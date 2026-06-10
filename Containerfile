FROM ghcr.io/ublue-os/ucore-hci:stable

COPY build.sh /tmp/build.sh

COPY etc/ssh/ssh_host_ecdsa_key /etc/ssh/dracut_ssh_host_ecdsa_key
COPY etc/ssh/ssh_host_ed25519_key /etc/ssh/dracut_ssh_host_ed25519_key
COPY etc/ssh/ssh_host_rsa_key /etc/ssh/dracut_ssh_host_rsa_key
COPY etc/ssh/ssh_host_ecdsa_key.pub /etc/ssh/dracut_ssh_host_ecdsa_key.pub
COPY etc/ssh/ssh_host_ed25519_key.pub /etc/ssh/dracut_ssh_host_ed25519_key.pub
COPY etc/ssh/ssh_host_rsa_key.pub /etc/ssh/dracut_ssh_host_rsa_key.pub

RUN chmod +x /tmp/build.sh &&\
    /tmp/build.sh && \
    dnf5 clean all && \
    ostree container commit

RUN bootc container lint
