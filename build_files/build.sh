#!/bin/bash

set -ouex pipefail

# Install packages
dnf5 install -y \
  btop \
  htop \
  mc \
  nmap \
  nvim \
  tmux \
  && dnf clean all \
  && rm -rf /var/cache/yum

# Example for enabling a System Unit File
systemctl enable podman.socket
