#!/usr/bin/env bash
set -euox pipefail

tee /etc/yum.repos.d/netbird.repo <<EOF
[netbird]
name=netbird
baseurl=https://pkgs.netbird.io/yum/
enabled=1
gpgcheck=0
gpgkey=https://pkgs.netbird.io/yum/repodata/repomd.xml.key
repo_gpgcheck=1
EOF

curl -L https://copr.fedorainfracloud.org/coprs/gsauthof/dracut-sshd/repo/fedora-43/gsauthof-dracut-sshd-fedora-43.repo -o /etc/yum.repos.d/gsauthof-dracut-sshd-fedora-43.repo


mkdir /etc/dracut-sshd
echo "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIvhNf+pVcXIAvM/xe9IFj0157y3EQ1Z51DUUlzrG47C" > /etc/dracut-sshd/authorized_keys

rpm-ostree install netbird dracut-sshd

dnf5 clean all
