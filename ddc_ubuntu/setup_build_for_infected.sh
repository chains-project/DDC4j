#!/bin/bash

# Convenient script for creating a docker container with the build environment to run ./scripts/compile_infected.sh in. The infected jdk should then be copied from the container to then later be used by ddc_21.0.5-ga.sh.

docker run -it --network=host ddc_ubuntu-ubuntu-ddc:latest /bin/bash
