FROM ubuntu:22.04

RUN apt-get update && apt-get install -y \
        git vim tree \
        file zip unzip curl autoconf texinfo lbzip2 bison libasound2-dev libcups2-dev libfontconfig1-dev \
        libx11-dev libxext-dev libxrender-dev libxrandr-dev libxtst-dev libxt-dev

ENV SDKMAN_DIR /root/.sdkman

RUN curl -s "https://get.sdkman.io" | /bin/bash
RUN chmod a+x "$SDKMAN_DIR/bin/sdkman-init.sh"

COPY scripts /root/scripts

CMD ["sleep", "infinity"]
