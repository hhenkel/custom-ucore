FROM ghcr.io/ublue-os/ucore-hci:stable

COPY build.sh /tmp/build.sh
RUN mkdir -p /etc/ssh && \
    pwd && \
    ls -l && \
    ls -ld /etc/ssh && \
    ls -l /home/runner/work/custom-ucore/custom-ucore    

COPY ./etc/ssh/* /etc/ssh/

RUN chmod +x /tmp/build.sh &&\
    /tmp/build.sh && \
    dnf5 clean all && \
    ostree container commit

RUN bootc container lint
