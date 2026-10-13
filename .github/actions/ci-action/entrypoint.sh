#!/bin/bash
set -o errexit

make test
make acceptance
make ci
