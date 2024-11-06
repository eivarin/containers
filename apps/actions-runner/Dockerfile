FROM --platform=amd64 ghcr.io/actions/actions-runner:2.320.0
LABEL org.opencontainers.image.source=https://github.com/eivarin/containers
ENV DEBCONF_NONINTERACTIVE_SEEN=true \
    DEBIAN_FRONTEND="noninteractive" \
    APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=DontWarn

USER root

RUN \
    apt-get -qq update \
    && \
    apt-get -qq install -y --no-install-recommends --no-install-suggests \
        ca-certificates \
        gcc \
        jo \
        moreutils \
        wget \
        jq \
        build-essential \
        locales \
        imagemagick \
        file \
        inotify-tools \
        gh \
    && rm -rf /var/lib/apt/lists/*

RUN sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen && \
    locale-gen
ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8  

USER runner
