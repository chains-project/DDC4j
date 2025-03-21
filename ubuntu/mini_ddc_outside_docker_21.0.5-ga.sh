#!/bin/bash

image=$1

function ddc {
    local version=$1
    local path=$2
    echo "PERFORMING DDC ON 21.0.5-ga WITH $version ($(date))"
    if [ -d "$path" ]; then
        docker run -t --entrypoint "/bin/bash" --network=host --name ddc_container $image /root/scripts/dc_21.0.5-ga_from_local.sh $version $path
    else
        docker run -t --entrypoint "/bin/bash" --network=host --name ddc_container $image /root/scripts/dc_21.0.5-ga_from_sdkman.sh $version
    fi

    docker cp ddc_container:/root/from_$version .
    docker rm ddc_container
    echo "DONE COMPILING AND COPYING $version ($(date))"
}

# --- JDK 21.0.5 ---
ddc 21.0.5-tem
ddc 21.0.5-oracle
