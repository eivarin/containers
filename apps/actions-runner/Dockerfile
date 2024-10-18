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
    && rm -rf /var/lib/apt/lists/*

USER runner
