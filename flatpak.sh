#!/usr/bin/env bash
set -euo pipefail

# Add Flathub remote
echo "Adding Flathub remote..."
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

# Remove Fedora remote if it exists
if flatpak remotes --columns=name | grep -q 'fedora'; then
    echo "Removing Fedora remote..."
    flatpak remote-delete fedora
fi

# Install Flatpaks
echo "Installing Flatpak apps..."
flatpaks=(
    "app.zen_browser.zen"
    "com.brave.Browser"
    "com.discordapp.Discord"
    "com.fastmail.Fastmail"
    "com.github.marhkb.Pods"
    "com.github.tchx84.Flatseal"
    "com.google.Chrome"
    "com.mattjakeman.ExtensionManager"
    "com.spotify.Client"
    "com.todoist.Todoist"
    "com.usebruno.Bruno"
    "dev.mufeed.Wordbook"
    "io.github.flattool.Ignition"
    "io.github.flattool.Warehouse"
    "io.github.pieterdd.RcloneShuttle"
    "io.github.ppvan.tarug"
    "it.mijorus.gearlever"
    "md.obsidian.Obsidian"
    "net.nokyan.Resources"
    "org.gnome.Solanum"
    "org.gnome.gitlab.somas.Apostrophe"
    "org.mozilla.firefox"
    "page.tesk.Refine"
)
for f in "${flatpaks[@]}"; do
    flatpak install --noninteractive --or-update flathub "$f"
done
