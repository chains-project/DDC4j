#!/bin/bash

# Can be ran inside a docker container, note the storage usage in the container might be overwhelming. It is recommended to run ddc_21.0.5-ga.sh in the parent folder to isolate each compilation.

# --- JDK 21.0.5 ---
echo "PERFORMING DDC ON 21.0.5-ga WITH 21.0.5-tem"
/root/scripts/dc_21.0.5-ga_from_sdkman.sh 21.0.5-tem
echo "PERFORMING DDC ON 21.0.5-ga WITH 21.0.5-oracle"
/root/scripts/dc_21.0.5-ga_from_sdkman.sh 21.0.5-oracle
echo "PERFORMING DDC ON 21.0.5-ga WITH 21.0.5-amzn"
/root/scripts/dc_21.0.5-ga_from_sdkman.sh 21.0.5-amzn
echo "PERFORMING DDC ON 21.0.5-ga WITH 21.0.5-graal"
/root/scripts/dc_21.0.5-ga_from_sdkman.sh 21.0.5-graal
echo "PERFORMING DDC ON 21.0.5-ga WITH 21.0.5-jbr"
/root/scripts/dc_21.0.5-ga_from_sdkman.sh 21.0.5-jbr
echo "PERFORMING DDC ON 21.0.5-ga WITH 21.0.5-librca"
/root/scripts/dc_21.0.5-ga_from_sdkman.sh 21.0.5-librca
echo "PERFORMING DDC ON 21.0.5-ga WITH 21.0.5-ms"
/root/scripts/dc_21.0.5-ga_from_sdkman.sh 21.0.5-ms
echo "PERFORMING DDC ON 21.0.5-ga WITH 21.0.5-sem"
/root/scripts/dc_21.0.5-ga_from_sdkman.sh 21.0.5-sem
echo "PERFORMING DDC ON 21.0.5-ga WITH 21.0.5-kona"
/root/scripts/dc_21.0.5-ga_from_sdkman.sh 21.0.5-kona
echo "PERFORMING DDC ON 21.0.5-ga WITH 21.0.5-zulu"
/root/scripts/dc_21.0.5-ga_from_sdkman.sh 21.0.5-zulu

# --- JDK 20.0.2 ---
echo "PERFORMING DDC ON 21.0.5-ga WITH 20.0.2-tem"
/root/scripts/dc_21.0.5-ga_from_sdkman.sh 20.0.2-tem
echo "PERFORMING DDC ON 21.0.5-ga WITH 20.0.2-oracle"
/root/scripts/dc_21.0.5-ga_from_sdkman.sh 20.0.2-oracle
echo "PERFORMING DDC ON 21.0.5-ga WITH 20.0.2-amzn"
/root/scripts/dc_21.0.5-ga_from_sdkman.sh 20.0.2-amzn
echo "PERFORMING DDC ON 21.0.5-ga WITH 20.0.2-graal"
/root/scripts/dc_21.0.5-ga_from_sdkman.sh 20.0.2-graal
echo "PERFORMING DDC ON 21.0.5-ga WITH 20.0.2-jbr"
/root/scripts/dc_21.0.5-ga_from_sdkman.sh 20.0.2-jbr
echo "PERFORMING DDC ON 21.0.5-ga WITH 20.0.2-librca"
/root/scripts/dc_21.0.5-ga_from_sdkman.sh 20.0.2-librca
echo "PERFORMING DDC ON 21.0.5-ga WITH 20.0.2-ms"
/root/scripts/dc_21.0.5-ga_from_sdkman.sh 20.0.2-ms
echo "PERFORMING DDC ON 21.0.5-ga WITH 20.0.2-sem"
/root/scripts/dc_21.0.5-ga_from_sdkman.sh 20.0.2-sem
echo "PERFORMING DDC ON 21.0.5-ga WITH 20.0.2-kona"
/root/scripts/dc_21.0.5-ga_from_sdkman.sh 20.0.2-kona
echo "PERFORMING DDC ON 21.0.5-ga WITH 20.0.2-zulu"
/root/scripts/dc_21.0.5-ga_from_sdkman.sh 20.0.2-zulu

# --- VERSIONS TEST ---
echo "PERFORMING DDC ON 21.0.5-ga WITH 19.0.2-tem"
/root/scripts/dc_21.0.5-ga_from_sdkman.sh 19.0.2-tem
echo "PERFORMING DDC ON 21.0.5-ga WITH 18.0.2.1-tem"
/root/scripts/dc_21.0.5-ga_from_sdkman.sh 18.0.2.1-tem
echo "PERFORMING DDC ON 21.0.5-ga WITH 17.0.14-tem"
/root/scripts/dc_21.0.5-ga_from_sdkman.sh 17.0.14-tem
echo "PERFORMING DDC ON 21.0.5-ga WITH 16.0.2-tem"
/root/scripts/dc_21.0.5-ga_from_sdkman.sh 16.0.2-tem
echo "PERFORMING DDC ON 21.0.5-ga WITH 15.0.10-tem"
/root/scripts/dc_21.0.5-ga_from_sdkman.sh 15.0.10-tem
echo "PERFORMING DDC ON 21.0.5-ga WITH 14.0.2-tem"
/root/scripts/dc_21.0.5-ga_from_sdkman.sh 14.0.2-tem
