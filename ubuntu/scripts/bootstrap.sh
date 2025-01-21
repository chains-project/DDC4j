#!/bin/bash

source_code_folder=$1
boot_jdk_folder=$2

cd $source_code_folder
export SOURCE_DATE_EPOCH=$(git log -1 --format="%at")
# timedatectl set-timezone UTC # Might not be needed in a docker container
bash configure --with-version-opt=adhoc --with-boot-jdk=$boot_jdk_folder
make images
