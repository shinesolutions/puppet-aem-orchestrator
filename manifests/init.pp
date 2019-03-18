# @summary
#   Install and configure the Shine Solution Orchestrator for Adobe Experience
#   Manager.
#
# @param service_name
#   The name of the service when it is installed. Defaults to
#   `aem-orchestrator` and several other variables are based on it. You probably
#   shouldn't change this.
#
# @param basedir
#   Path to the base directory for installation. Defaults to
#   '/opt/shinesolutions' and several other paths are based on it.
#
# @param basedir_mode
#   File mode for the base directory.
#
# @param installdir
#   Path to the directory for installation. The JAR file and configuration
#   files are installed here. Defaults to <basedir>/<service_name>.
#
# @param installdir_mode
#   File mode for the installation directory.
#
# @param homedir
#   Path to the home directory for the user the service runs as. Only used if
#   <manage_homedir> is true.
#
# @param user
#   The user the service runs as. Defaults to <service_name>.
#
# @param group
#   The primary group for user the service runs as. Defaults to <service_name>.
#
# @param jarfile_source
#   Source URL for the AEM Orchestrator JAR file.
#
# @param jarfile_checksum_value
#   Checksum of the AEM Orchestrator JAR file. If not specified and an HTTP URL
#   is used, Puppet will treat the `File` resource as updated on every run.
#
# @param jarfile_checksum_type
#   The checksum algorithm used to produce `jarfile_checksum_value`.
#
# @param jarfile_mode
#   File mode for the JAR file.
#
# @param manage_basedir
#   Whether or not to manage <basedir> as a resource in Puppet.
#
# @param manage_installdir
#   Whether or not to manage <installdir> as a resource in Puppet.
#
# @param manage_homedir
#   Whether or not to manage <homedir> as a resource in Puppet.
#
# @param manage_user
#   Whether or not to manage <user> as a resource in Puppet.
#
# @param manage_group
#   Whether or not to manage <group> as a resource in Puppet.
#
# @param aws_profile
#   If specified, sets the `AWS_PROFILE` variable in the service's environment.
#
# @param user_shell
#   The shell to be used when managing the user. Should be the full path to the
#   `nologin` shell.
#
# @example Declaring the class
#  include aem_orchestrator
#
# @author  James Sinclair <james.sinclair@shinesolutions.com>
#
# Copyright © 2017-2019 Shine Solutions Group, unless otherwise noted.
#
class aem_orchestrator (
  String $service_name,
  String $basedir,
  String $installdir,
  String $homedir,
  String $user,
  String $group,

  String $jarfile_source,
  String $jarfile_checksum_value,
  String $jarfile_checksum_type = 'sha256',
  String $jarfile_mode          = '0500',

  String $basedir_mode    = '0755',
  String $installdir_mode = '0750',

  Boolean $manage_basedir    = true,
  Boolean $manage_installdir = false,
  Boolean $manage_homedir    = true,
  Boolean $manage_user       = true,
  Boolean $manage_group      = true,

  Variant[String, Undef] $aws_profile = undef,
  String $user_shell = '/usr/sbin/nologin',
){
  if $manage_basedir {
    file { $basedir:
      ensure => directory,
      mode   => $basedir_mode,
    }
    $basedir_require = File[$basedir]
  } else {
    $basedir_require = undef
  }
  if $manage_user {
    group { $group:
      ensure => present,
      system => true,
    }
    user { $user:
      ensure     => present,
      home       => $homedir,
      managehome => $manage_homedir,
      system     => true,
      shell      => $user_shell,
      gid        => $group,
      expiry     => absent,
    }
  }
  if $manage_installdir {
    file { [ $installdir ]:
      ensure  => directory,
      owner   => $user,
      group   => $group,
      mode    => $installdir_mode,
      require => [ $basedir_require, User[$user] ],
    }
    $file_requires = [ File[$installdir], User[$user] ]
  } else {
    $file_requires = [ User[$user] ]
  }

  $jarfile = "${installdir}/aem-orchestrator.jar"
  archive { $jarfile:
    ensure        => present,
    source        => $jarfile_source,
    checksum_type => $jarfile_checksum_type,
    checksum      => $jarfile_checksum_value,
    require       => $file_requires;
  }
  -> file { $jarfile:
    owner => $user,
    group => $group,
    mode  => $jarfile_mode,
  }

  if $facts['os']['family'] == 'redhat' {
    if $facts['os']['name'] == 'Amazon' {
      if $facts['os']['release']['major'] == '2' {
        $servicefile = "/etc/systemd/system/${service_name}.service"
        $servicetmpl = 'systemd.erb'
        $serviceprvd = undef
      } else {
        $servicefile = "/etc/init/${service_name}.conf"
        $servicetmpl = 'upstart.erb'
        $serviceprvd = 'upstart'
      }
    } else {
      $servicefile = "/etc/systemd/system/${service_name}.service"
      $servicetmpl = 'systemd.erb'
      $serviceprvd = undef
    }
  }

  file { $servicefile:
    ensure  => file,
    content => template("aem_orchestrator/service/${servicetmpl}"),
    require => File[$jarfile],
  }

  $application_properties_file = "${installdir}/application.properties"
  class { '::aem_orchestrator::application_properties':
    path    => $application_properties_file,
    owner   => $user,
    group   => $group,
    notify  => Service[$service_name],
    require => File[$servicefile],
  }

  service { $service_name:
    ensure   => running,
    enable   => true,
    provider => $serviceprvd,
    require  => File[$application_properties_file],
  }
}
