#!/bin/bash

set -ouex pipefail

# Get all cockpit packages
COCKPIT_PACKAGES=$(rpm -qa | grep 'cockpit-')

# Remove Cockpit
if [ -n "$COCKPIT_PACKAGES" ]; then
  rpm-ostree override remove $COCKPIT_PACKAGES
fi

# Install packages
dnf5 install -y \
  btop \
  htop \
  mc \
  nmap \
  nvim \
  tmux \
  && dnf clean all \
  && rm -rf /var/cache/dnf

# Example for enabling a System Unit File
systemctl enable podman.socket
