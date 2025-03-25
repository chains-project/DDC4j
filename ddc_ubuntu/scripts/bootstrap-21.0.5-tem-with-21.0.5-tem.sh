#!/bin/bash

source /root/.sdkman/bin/sdkman-init.sh

sdk install java 21.0.5-tem

# Source code installed in Dockerfile
# git clone --depth 1 --branch jdk-21.0.5-ga https://github.com/openjdk/jdk21u
cd /root/jdk21u

/root/scripts/bootstrap.sh $(pwd) /root/.sdkman/candidates/java/21.0.5-tem
