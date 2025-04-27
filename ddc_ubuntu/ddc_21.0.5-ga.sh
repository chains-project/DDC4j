#!/bin/bash

image=$1

if [ -z "$image" ]; then
    read -p "No image specified. Use default image 'ddc_ubuntu-ubuntu-ddc'? (y/n): " choice
    if [ "$choice" = "y" ]; then
        image="ddc_ubuntu-ubuntu-ddc"
    else
        echo "USAGE: mini_ddc_outside_docker_21.0.5-ga.sh <image>"
        echo "Exiting."
        exit 1
    fi
fi


function ddc {
    local version=$1
    local path=$2
    echo "PERFORMING DDC ON 21.0.5-ga WITH $version ($(date))"
    if [ -d "$path" ]; then
        echo "RUNNING ON LOCAL JDK"
        docker create -t --entrypoint "/bin/bash" --network=host --name ddc_container $image /root/scripts/dc_21.0.5-ga_from_local.sh $version /root/local_jdk
        docker cp $path ddc_container:/root/local_jdk
        docker start -a ddc_container
    else
        echo "RUNNING ON SDKMAN JDK"
        docker create -t --entrypoint "/bin/bash" --network=host --name ddc_container $image /root/scripts/dc_21.0.5-ga_from_sdkman.sh $version
        docker start -a ddc_container
    fi

    docker cp ddc_container:/root/from_$version.tar.gz .
    docker rm ddc_container

    tar -xzf from_$version.tar.gz --strip-components=1
    rm from_$version.tar.gz
    echo "DONE COMPILING AND COPYING $version ($(date))"
}

# --- JDK 21.0.5 ---
# Automatically installed by SDKMAN
ddc 21.0.5-tem
ddc 21.0.5-oracle
ddc 21.0.5-open
ddc 21.0.5-kona

# --- Locally available ---
# Compile and locate at /root/21.0.5_infected_jdk
ddc 21.0.5-infected_local /root/21.0.5_infected_jdk
# This is a gnu guix pack generated with `guix pack openjdk@21.0.5:jdk --no-substitutes`. The tarball is extracted inside the /root/21.0.2_bootstrapped_jdk/ folder. To install the entire guix store in the correct place it is copied to /gnu inside the container
ddc 21.0.2-bootstrapped_local /root/21.0.2_bootstrapped_jdk/gnu /gnu /gnu/store/9y01x6ibci3l9bsrfshwgmdd12d7b2jw-openjdk-21.0.2-jdk
