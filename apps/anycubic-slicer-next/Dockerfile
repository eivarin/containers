FROM ubuntu:24.04
LABEL org.opencontainers.image.source="https://github.com/eivarin/containers"

WORKDIR /tmp

COPY ./locale.gen /etc/locale.gen
COPY ./AnycubicSlicerNextInstaller.sh /tmp/AnycubicSlicerNextInstaller.sh

RUN apt-get update && \
    apt-get install -y sudo lsb-release curl locales \
    && bash /tmp/AnycubicSlicerNextInstaller.sh \
    && rm -rf /var/lib/apt/lists/*

RUN locale-gen

RUN mkdir -p /root/.config

CMD ["/usr/bin/AnycubicSlicerNext"]