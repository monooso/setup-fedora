#!/usr/bin/env bash

# Install Homebrew (idempotent)
bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Add Homebrew to path to complete setup
eval $("/home/linuxbrew/.linuxbrew/bin/brew shellenv")

# Install dependencies (don't love this)
sudo dnf group install development-tools

# Install CLI tools
brew install \
    bat \
    fd \
    fzf \
    gcc \
    lazygit \
    mise \
    neovim \
    opencode \
    rclone \
    ripgrep \
    starship \
    stow
