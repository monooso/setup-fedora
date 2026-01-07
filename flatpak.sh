#!/usr/bin/env bash

# Add Flathub remote
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

# (Safely) remove Fedora remote
flatpak remotes --columns=name | grep 'fedora' && flatpak remote-delete fedora

# Install Flatpaks
flatpaks=(
    "flathub com.brave.Browser"
    "flathub com.discordapp.Discord"
    "flathub com.fastmail.Fastmail"
    "flathub com.github.marhkb.Pods"
    "flathub com.github.tchx84.Flatseal"
    "flathub com.google.Chrome"
    "flathub com.spotify.Client"
    "flathub com.todoist.Todoist"
    "flathub com.usebruno.Bruno"
    "flathub dev.mufeed.Wordbook"
    "flathub io.github.flattool.Ignition"
    "flathub io.github.flattool.Warehouse"
    "flathub io.github.pieterdd.RcloneShuttle"
    "flathub io.github.ppvan.tarug"
    "flathub it.mijorus.gearlever"
    "flathub md.obsidian.Obsidian"
    "flathub net.nokyan.Resources"
    "flathub org.gnome.Solanum"
    "flathub org.gnome.gitlab.somas.Apostrophe"
    "flathub org.mozilla.firefox"
    "flathub page.tesk.Refine"
)
for f in "${flatpaks[@]}"; do
    flatpak install --noninteractive --or-update flathub $f
done
