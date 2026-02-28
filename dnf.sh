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
sudo dnf install -y https://downloads.1password.com/linux/rpm/stable/x86_64/1password-latest.rpm

# Install essential tools, which can't be managed by Homebrew
echo "Installing essential tools..."
sudo dnf install -y \
    fish \
    podman-compose \
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

