#!/bin/bash

image=$1

function ddc {
    local version=$1
    echo "PERFORMING DDC ON 21.0.5-ga WITH $version ($(date))"
    docker run -t --entrypoint "/bin/bash" --network=host --name ddc_container $image /root/scripts/dc_21.0.5-ga_from_sdkman.sh $version
    docker cp ddc_container:/root/from_$version .
    docker rm ddc_container
    echo "DONE COMPILING AND COPYING $version ($(date))"
}

# --- JDK 21.0.5 ---
ddc 21.0.5-tem
ddc 21.0.5-oracle
ddc 21.0.5-amzn
ddc 21.0.5-graal
ddc 21.0.5-jbr
ddc 21.0.5-librca
ddc 21.0.5-ms
ddc 21.0.5-sem
ddc 21.0.5-kona
ddc 21.0.5-zulu

# --- JDK 20.0.2 ---
ddc 20.0.2-tem
ddc 20.0.2-oracle
ddc 20.0.2-amzn
ddc 20.0.2-graal
ddc 20.0.2-jbr
ddc 20.0.2-librca
ddc 20.0.2-ms
ddc 20.0.2-sem
ddc 20.0.2-kona
ddc 20.0.2-zulu

# --- VERSIONS TEST ---
ddc 19.0.2-tem
ddc 18.0.2.1-tem
ddc 17.0.14-tem
ddc 16.0.2-tem
ddc 15.0.10-tem
ddc 14.0.2-tem
