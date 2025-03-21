#!/bin/bash

source /root/.sdkman/bin/sdkman-init.sh

version=$1
path=$2

cd /root
git clone --depth 1 --branch jdk-21.0.5-ga https://github.com/openjdk/jdk21u

/root/scripts/double-compile.sh /root/jdk21u $version $path /root/from_$version
