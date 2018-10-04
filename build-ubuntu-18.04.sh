#!/bin/bash

set -uo pipefail
set -e
set -vx

MAKE_J=$(grep -c processor /proc/cpuinfo)
echo "inside make"
./autogensh.sh
./configure
make .
