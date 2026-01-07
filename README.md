# Simple setup

## Introduction
Simple setup for an atomic desktop (such as Fedora Silverblue),
or a non-atomic desktop (such as Fedora Workstation) that I intend
to treat as immutable.

This means that:

1. We use Flatpak for all desktop applications.
2. We use Homebrew for all CLI applications. 
3. We use Mise for all project dependencies.
4. We use project-specific Distroboxes for development.
5. We use "build" Distroboxes to build binaries from source.

## Usage
Run the installation script, using `bash setup.sh`.

This performs the following actions:

1. Ensures that Flathub is configured as a Flatpak remote.
2. Installs the Homebrew formulae listed in the `Brewfile`.
3. Installs Flatpaks listed in the `Brewfile`.

