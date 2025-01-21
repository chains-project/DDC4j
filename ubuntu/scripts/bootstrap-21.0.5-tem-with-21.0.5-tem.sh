#!/bin/bash

source /root/.sdkman/bin/sdkman-init.sh

sdk install java 21.0.5-tem
sdk use java 21.0.5-tem

git clone --depth 1 --branch jdk-21.0.5-ga https://github.com/openjdk/jdk21u
cd jdk21u

/root/scripts/bootstrap.sh $(pwd) /root/.sdkman/candidates/java/21.0.5-tem
