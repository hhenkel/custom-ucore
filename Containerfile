FROM ghcr.io/ublue-os/ucore-hci:stable

COPY build.sh /tmp/build.sh

RUN chmod +x /tmp/build.sh &&\
    /tmp/build.sh && \
    dnf5 clean all && \
    ostree container commit

RUN bootc container lint
