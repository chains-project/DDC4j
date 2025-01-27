#!/bin/bash

source /root/.sdkman/bin/sdkman-init.sh

sdk install java 21.0.5-tem

cd /root
git clone --depth 1 --branch jdk-21.0.5-ga https://github.com/openjdk/jdk21u

/root/scripts/double-compile.sh /root/jdk21u 21.0.5-tem /root/.sdkman/candidates/java/21.0.5-tem /root/21.0.5-tem
