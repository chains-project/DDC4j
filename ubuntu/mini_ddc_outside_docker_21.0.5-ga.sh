#!/bin/bash

image=$1

if [ -z "$image" ]; then
    echo "USAGE: mini_ddc_outside_docker_21.0.5-ga.sh <image>"
    exit 1
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

    tar -xzf from_$version.tar.gz
    rm from_$version.tar.gz
    echo "DONE COMPILING AND COPYING $version ($(date))"
}

# --- JDK 21.0.5 ---
ddc 21.0.5-infected_local /root/21.0.5_infected_jdk
ddc 21.0.5-tem
ddc 21.0.5-oracle
