#!/usr/bin/env bash

# ------------------------------------------------
# NOTE:
# `dnf` is a last resort. Wherever possible, use
# Homebrew.
# ------------------------------------------------

# Install 1Password (the Flatpak has loads of issues with GPG keys)
sudo dnf install -y https://downloads.1password.com/linux/rpm/stable/x86_64/1password-latest.rpm

# Install essential tools, which can't be managed by Homebrew
sudo dnf install -y \
    fish \
    podman-compose \
    wl-clipboard

# Install Erlang build dependencies, unfortunately
sudo dnf install -y \
    autoconf \
    automake \
    g++ \
    ncurses-devel \
    openssl-devel
