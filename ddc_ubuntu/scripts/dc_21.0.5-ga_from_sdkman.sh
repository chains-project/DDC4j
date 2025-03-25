#!/bin/bash

source /root/.sdkman/bin/sdkman-init.sh

version=$1

yes | sdk install java $version

cd /root
git clone --depth 1 --branch jdk-21.0.5-ga https://github.com/openjdk/jdk21u

/root/scripts/double-compile.sh /root/jdk21u $version /root/.sdkman/candidates/java/$version /root/from_$version
