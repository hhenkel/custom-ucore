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

dnf5 -y copr enable @kernel-vanilla/mainline
dnf5 -y upgrade 'kernel*'
dnf5 -y upgrade kernel-core kernel

rpm-ostree install netbird-ui
dnf5 clean all
