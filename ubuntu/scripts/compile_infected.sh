#!/bin/bash

source /root/.sdkman/bin/sdkman-init.sh
yes | sdk install java 21.0.5-tem

cd /root
git clone https://github.com/LogFlames/jdk21u_trusting_trust.git

cd jdk21u_trusting_trust

/root/scripts/bootstrap.sh /root/jdk21u_trusting_trust/infected_jdk /root/.sdkman/candidates/java/21.0.5-tem
/root/scripts/bootstrap.sh /root/jdk21u_trusting_trust/clean_jdk /root/jdk21u_trusting_trust/infected_jdk/build/linux-x86_64-server-release/images/jdk

cp -pr /root/jdk21u_trusting_trust/infected_jdk/build/linux-x86_64-server-release/images/jdk /root/infected_jdk
