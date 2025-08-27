# DDC on Ubuntu

## DDC in Docker

### Setup

Start by running `setup_new_ubuntu.sh` to install all the required packages (along with development tools that are convenient).

Run `docker compose build` to build the docker image.

### Create infected JDK

```bash
./setup_build_for_infected.sh

# Inside docker container
/root/scripts/compile_infected.sh

# Outside docker container once completed
docker cp [docker container id]:/root/infected_jdk/ /root/21.0.5_infected_jdk/
```

### Run DDC

```bash
./ddc_21.0.5-ga.sh
```


## Generating bootstrapped JDK in GNU Guix

### Install GNU Guix

Install GNU Guix and run

```bash
guix pull
```

This latter step will take a long time.

### Create bootstrapped JDK 

```bash
guix build openjdk@21.0.5:jdk --no-substitutes
guix pack openjdk@21.0.5:jdk
# expand tarball at /root/21.0.5_bootstrapped_jdk/
```

Note: sometimes `guix build openjdk@21.0.5:jdk` will crash. Re-running the command might work, and did so for us.