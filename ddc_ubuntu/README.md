# DDC in Docker on Ubuntu

## Setup

Start by running `setup_new_ubuntu.sh` to install all the required packages (along with development tools that are convenient).

Run `docker compose build` to build the docker image.

## Create bootstrapped JDK 

TODO: Install and run GUIX

```bash
guix build openjdk@21.0.5:jdk --no-substitutes
guix pack openjdk@21.0.5:jdk
# expand tarball at /root/21.0.5_bootstrapped_jdk/
```

## Create infected JDK

```bash
./setup_build_for_infected.sh

# Inside docker container
/root/scripts/compile_infected.sh

# Outside docker container once completed
dokcer cp [docker container id]:/root/infected_jdk/ /root/21.0.5_infected_jdk/
```

## Run DDC

```bash
./ddc_21.0.5-ga.sh
```

