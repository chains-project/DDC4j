FROM ubuntu:22.04

ENV TZ UTC

ENV SDKMAN_DIR /root/.sdkman

RUN apt-get update && apt-get install -y \
        git vim tree strace bsdmainutils \
        file zip unzip curl autoconf texinfo lbzip2 bison libasound2-dev libcups2-dev libfontconfig1-dev \
        libx11-dev libxext-dev libxrender-dev libxrandr-dev libxtst-dev libxt-dev


RUN curl -s "https://get.sdkman.io" | /bin/bash
RUN chmod a+x "$SDKMAN_DIR/bin/sdkman-init.sh"

RUN git clone --depth 1 --branch jdk-21.0.5-ga https://github.com/openjdk/jdk21u /root/jdk21u

COPY scripts /root/scripts

CMD ["sleep", "infinity"]
