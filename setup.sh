#!/usr/bin/env shell

# Check our dependencies exist
if ! command -v brew; then
    echo "ERROR: this script requires Homebrew."
    exit 1
fi

if ! command -v flatpak; then
    echo "ERROR: this script requires Flatpak."
    exit 1
fi

# Add Flathub remote
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

# Install (or update) everything
brew bundle

# Create our distroboxes
if ! command -v distrobox; then
    echo "ERROR: this script requires Distrobox, which is normally installed via Homebrew. Confirm that the Brewfile contains `brew distrobox`."
    exit 1
fi
distrobox-assemble create --file distrobox.ini
