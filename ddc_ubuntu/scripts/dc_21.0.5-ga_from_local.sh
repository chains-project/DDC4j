#!/bin/bash

version=$1
path=$2

cd /root
# Source code installed in Dockerfile
# git clone --depth 1 --branch jdk-21.0.5-ga https://github.com/openjdk/jdk21u

/root/scripts/double-compile.sh /root/jdk21u $version $path /root/from_$version
