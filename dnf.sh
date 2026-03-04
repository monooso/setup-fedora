#!/usr/bin/env bash
set -euo pipefail

# ------------------------------------------------
# NOTE:
# `dnf` is a last resort. Wherever possible, use
# Homebrew.
# ------------------------------------------------

# Upgrade existing packages
echo "Upgrading system packages..."
sudo dnf upgrade -y

# Install 1Password (the Flatpak has loads of issues with GPG keys)
echo "Installing 1Password..."
sudo rpm --import https://downloads.1password.com/linux/keys/1password.asc
sudo sh -c 'echo -e "[1password]\nname=1Password Stable Channel\nbaseurl=https://downloads.1password.com/linux/rpm/stable/\$basearch\nenabled=1\ngpgcheck=1\nrepo_gpgcheck=1\ngpgkey=\"https://downloads.1password.com/linux/keys/1password.asc\"" > /etc/yum.repos.d/1password.repo'
sudo dnf check-update -y 1password 1password-cli || true
sudo dnf install -y 1password 1password-cli

# Install essential tools
echo "Installing essential tools..."
sudo dnf install -y \
    fish \
    podman-compose \
    stow \
    wl-clipboard \
    wofi

# Install build dependencies for Homebrew and Erlang
echo "Installing build dependencies..."
sudo dnf group install -y development-tools
sudo dnf install -y \
    autoconf \
    automake \
    g++ \
    ncurses-devel \
    openssl-devel

