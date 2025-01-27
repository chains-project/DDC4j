#!/bin/bash

source_code_folder=$1
grand_parent_compiler_version=$2
grand_parent_compiler_folder=$3
output_folder=$4

mkdir -p $output_folder
cd $source_code_folder

# --- STAGE 1 ---
make clean
git clean -fd
/root/scripts/bootstrap.sh $source_code_folder $grand_parent_compiler_folder
cp -r $source_code_folder/build/linux-x86_64-server-release/images/jdk $output_folder/stage1_$grand_parent_compiler_version
rm -rf $output_folder/stage1_$grand_parent_compiler_version/demo

# --- STAGE 2 ---
make clean
git clean -fd
/root/scripts/bootstrap.sh $source_code_folder $output_folder/stage1_$grand_parent_compiler_version
cp -r $source_code_folder/build/linux-x86_64-server-release/images/jdk $output_folder/stage2_$grand_parent_compiler_version
rm -rf $output_folder/stage2_$grand_parent_compiler_version/demo
