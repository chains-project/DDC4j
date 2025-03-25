#!/bin/bash

# This script implements the bootstrapping outlined by the Bootstrappable Builds
# project. It is the first step in the process of building a JDK of version 21
# which does not depend on any Java compiler written in Java.
# - Bootstrappable Builds: https://www.bootstrappable.org/
# - The Java bootstrapping project: https://www.bootstrappable.org/projects/java.html
# - Guix build file: https://git.savannah.gnu.org/cgit/guix.git/plain/gnu/packages/java-bootstrap.scm?id=e12455a5e8d524c5c3fba1ae56ebc6819b4f9320 
# 
# Note that this script requires guix to be installed and configured (with guix pull),
# in our case that is done in the Dockerfile (during docker build).


# The guix-daemon cannot run as a service, so we must start it in the background manually
~root/.config/guix/current/bin/guix-daemon --build-users-group=guixbuild &

####################################
# Step 1: Build a bootstrapped JDK #

mkdir -p /root/java_bootstrap
cd /root/java_bootstrap

# The java-bootstrap.scm file declares the dependencies and build process for the bootstrapped JDK
curl "https://git.savannah.gnu.org/cgit/guix.git/plain/gnu/packages/java-bootstrap.scm?id=e12455a5e8d524c5c3fba1ae56ebc6819b4f9320" \
    > java-bootstrap.scm

guix build -f java_bootstrap.scm

##################################################
# Step 2: Build JDK 6 using the bootstrapped JDK #

cd /root
git clone https://github.com/openjdk/jdk6.git

cd /root/jdk6

export PATH="/root/java_bootstrap/bin:$PATH"
export JAVA_HOME="/root/java_bootstrap"

chmod a+x configure
./configure
make all