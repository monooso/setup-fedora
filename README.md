# Fedora Laptop Setup

Provision a freshly installed Fedora Workstation with Ansible. Installs essential tools, GUI apps, dotfiles, and GNOME preferences.

---

## 📚 Table of Contents

- [Quickstart](#-quickstart)
- [Prerequisites](#️-prerequisites)
- [Required variables](#-required-variables)
- [What it configures](#-what-it-configures)
- [Caveats](#-caveats)
- [Role structure](#-role-structure)
- [Post-install steps](#-post-install-steps)
- [License](#-license)

---

## ⚡ Quickstart

```bash
# Install Ansible
sudo dnf install ansible

# Clone the setup repo
mkdir -p ~/code && cd ~/code
git clone https://github.com/monooso/setup-linux.git
cd setup-linux

# Run the playbook
ansible-playbook -i inventory playbook.yml --ask-become-pass --extra-vars "ssh_key_passphrase=yourpass"
```

---

## ⚙️ Prerequisites

- Fedora Workstation installed
- Internet connection
- System updated (`sudo dnf upgrade --refresh`)
- Ansible installed (`sudo dnf install ansible`)

---

## 🔐 Required variables

You must provide a passphrase for the SSH key named `default`. Either:

```bash
ansible-playbook -i inventory playbook.yml --ask-become-pass --extra-vars "ssh_key_passphrase=yourpass"
```

Or set it via environment:

```bash
export SSH_KEY_PASSPHRASE=yourpass
ansible-playbook -i inventory playbook.yml --ask-become-pass
```

---

## 🧰 What it configures

### CLI & shell
- Core tools: `curl`, `git`, `neovim`, `stow`, etc.
- ZSH as default shell
- [Starship](https://starship.rs) prompt
- Dotfiles from [monooso/dotfiles](https://github.com/monooso/dotfiles)
- [Mise](https://mise.jdx.dev) version manager
- GitHub CLI (`gh`)
- Lazygit (via GitHub releases)

### GUI apps
- **RPM**: 1Password, Brave, TablePlus
- **Flatpak**: Discord, Signal, Spotify, Obsidian
- **AppImage**: pCloud
- AppImageLauncher included

### GNOME config
- Dark mode
- Custom wallpaper
- Pop Shell installed & enabled
- Search shortcut set to `Super+Space`

### SSH
- Key generated at `~/.ssh/default` using provided passphrase
- You’ll need to manually add the public key to GitHub

---

## ⚠️ Caveats

- No clipboard manager yet, as nothing plays nicely with Wayland
- No snippets manager, as Espanso doesn't play nicely with Wayland
- Compose key not configured yet, because I'm awkward and use Home Row mods
- AppImageLauncher integration may require launching an AppImage once

---

## 📁 Role structure

```text
roles/
  packages/       # DNF-based installs
  dotfiles/       # Git + stow
  flatpak/        # Flathub apps
  appimages/      # AppImages and launcher
  gnome/          # Appearance & shell config
  ssh/            # Key generation
```

---

## ✅ Post-install steps

```bash
# Add SSH key to GitHub
gh auth login
gh ssh-key add ~/.ssh/default.pub --title "Fedora laptop"
```

Log out and back in to apply:
- Docker group membership
- ZSH shell
- GNOME tweaks
```
