FROM jamesread/olivetin:2024.11.24
USER root

RUN microdnf install -y \
    kubectl \
    && microdnf clean all

USER olivetin

ENTRYPOINT [ "/usr/bin/OliveTin" ]