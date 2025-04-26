#!/bin/bash

function setup {
    timedatectl set-timezone UTC

    git clone https://github.com/openjdk/jdk20u.git jdk20u
    git clone https://github.com/openjdk/jdk21u.git jdk21u
    (cd jdk21u && git checkout jdk-21.0.5+11)
    export LD_LIBRARY_PATH=/home/ddc4j/temurin_build/jdk21u/build/devkit/result/x86_64-linux-gnu-to-x86_64-linux-gnu/lib64:/home/ddc4j/temurin_build/jdk21u/build/devkit/result/x86_64-linux-gnu-to-x86_64-linux-gnu/lib
}

function first_compile {
    local version=$1
    local boot_jdk_path=$2

    echo "[DDC]: Compiling JDK20 with boot jdk: $version"

    mkdir jdk20_from-$version
    cd jdk20_from-$version
    
    export PATH=$PATH_MINIMAL:$boot_jdk_path/bin

    # Set vendor name to Eclipse Adoptium avoid diff in jrt-fs.jar 
    bash ../jdk20u/configure --with-boot-jdk=$boot_jdk_path --with-vendor-name='Eclipse Adoptium'
    make images

    echo "[DDC]: Done compiling JDK20 with boot jdk: $version"

    cd ..
}

function second_compile {
    local version=$1
    local boot_jdk_path=$2

    echo "[DDC]: Compiling JDK21 with grand parent boot jdk: $version"

    mkdir jdk21_from-gp-$version
    cd jdk21_from-gp-$version
    
    export PATH=$PATH_MINIMAL:$boot_jdk_path/bin
    
    bash ../jdk21u/configure --verbose --with-vendor-name='Eclipse Adoptium' --with-vendor-url=https://adoptium.net/ --with-vendor-bug-url=https://github.com/adoptium/adoptium-support/issues --with-vendor-vm-bug-url=https://github.com/adoptium/adoptium-support/issues --with-version-opt=LTS --without-version-pre --with-version-build=11 --with-vendor-version-string=Temurin-21.0.5+11 --with-boot-jdk=$boot_jdk_path --with-devkit=/home/ddc4j/temurin_build/jdk21u/build/devkit/result/x86_64-linux-gnu-to-x86_64-linux-gnu --with-debug-level=release --with-native-debug-symbols=external --with-source-date=version --disable-ccache --with-build-user=admin --with-jvm-variants=server --disable-warnings-as-errors --enable-dtrace --with-freetype=bundled --with-zlib=bundled
    make images

    echo "[DDC]: Done compiling JDK21 with boot jdk: $version"

    cd ..
}

function double_compile_from_sdkman {
    source /home/ddc4j/.sdkman/bin/sdkman-init.sh
    local version=$1
    echo "[DDC]: Performing ddc from sdkman for $version"
    echo "[DDC]: Installing $version with sdkman"
    yes | sdk install java $version
    echo "[DDC]: Done installing $version with sdkman"

    first_compile $version /home/ddc4j/.sdkman/candidates/java/$version
    second_compile $version /home/ddc4j/temurin_build/ddc/jdk20_from-$version/images/jdk

    echo "[DDC]: Done performing ddc from sdkman for $version"
}

export PATH_MINIMAL=/home/ddc4j/.local/bin:/home/ddc4j/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin

mkdir -p /home/ddc4j/temurin_build/ddc
cd /home/ddc4j/temurin_build/ddc

setup

double_compile_from_sdkman 19.0.2-tem
double_compile_from_sdkman 19.0.2-open

first_compile 21.0.5-guix-bootstrapped /gnu/store/9y01x6ibci3l9bsrfshwgmdd12d7b2jw-openjdk-21.0.2-jdk
second_compile 21.0.5-guix-bootstrapped /home/ddc4j/temurin_build/ddc/jdk21_from-21.0.5-guix-bootstrapped/images/jdk
