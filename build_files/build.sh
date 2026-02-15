#!/bin/bash

set -ouex pipefail

# Get all cockpit packages
COCKPIT_PACKAGES=$(rpm -qa --queryformat='%{NAME}\n' | grep 'cockpit-') || true

# Remove Cockpit
if [ -n "$COCKPIT_PACKAGES" ]; then
  rpm-ostree override remove $(echo $COCKPIT_PACKAGES | xargs)
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
