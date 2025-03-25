FROM ubuntu:22.04

ENV TZ UTC

# No other dependencies are installed at this stage to enable adding dependencies without
# having to wait for guix pull to finish every time the Dockerfile is rebuilt
RUN apt-get update && apt-get install -y \
        # guix is the functional package manager which bootstrappable builds
        # uses to reproducibly bootstrap the jdk from jikes
        guix

# Docker does not allow running the guix-daemon with systemctl, so we run it manually
# NOTE: guix-daemon will not be started when running the docker container, so this must be
#       done manually when the container is started
# NOTE: guix pull takes a loooong time, which is why this is done so early in the Dockerfile
#       to avoid having to wait for it to finish every time the Dockerfile is rebuilt
RUN ~root/.config/guix/current/bin/guix-daemon --build-users-group=guixbuild & \
        guix pull

RUN apt-get install -y \
        curl git

COPY scripts /root/scripts

CMD ["sleep", "infinity"]
