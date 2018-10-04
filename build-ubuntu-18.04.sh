#!/bin/bash

set -uo pipefail
set -e
set -vx

MAKE_J=$(grep -c processor /proc/cpuinfo)
./autogensh.sh
./configure
make -j${MAKE_J} all
