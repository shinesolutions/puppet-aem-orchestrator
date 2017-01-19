# == Class: aem_orchestrator
#
# Install and configure the Shine Solution Orchestrator for Adobe Experience Manager
#
# === Parameters
#
# [*basedir*]
#   Path to the base directory for installation. Used to define `libdir` and
#   `bindir`.
#
# [*libdir*]
#   Path to the `lib` directory for installation. Based on `basedir` by default
#   but can be overridden.
#
# [*bindir*]
#   Path to the `bin` directory for installation. Based on `basedir` by default
#   but can be overridden.
#
# [*manage_dirs*]
#   Whether or not to manage the installation directories.
#
# [*jarfile_source*]
#   Source URL for the AEM Orchestrator JAR file.
#
# [*jarfile_checksum*]
#   Checksum type used for `jarfile_checksum_value`.
#
# [*jarfile_checksum_value*]
#   Checksum of the AEM Orchestrator JAR file. If not specified, Puppet will
#   treat the `File` resource as updated on every run.
#
# === Examples
#
#  include aem_orchestrator
#
# === Authors
#
# James Sinclair <james.sinclair@shinesolutions.com>
#
# === Copyright
#
# Copyright © 2017	Shine Solutions Group, unless otherwise noted.
#
class aem_orchestrator (
  $basedir,
  $libdir,
  $bindir,
  $manage_dirs,
  $jarfile_source,
  $jarfile_checksum,
  $jarfile_checksum_value,
){
  if $manage_dirs {
    file { [ $basedir, $libdir, $bindir ]:
      ensure => directory,
    }
  }
  file { "${libdir}/aem-orchestrator.jar":
    ensure         => file,
    source         => $jarfile_source,
    checksum       => $jarfile_checksum,
    checksum_value => $jarfile_checksum_value,
    require        => [File[$libdir], File[$bindir]],
  }
}
