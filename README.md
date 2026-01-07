# Simple setup

A sane middle ground between littering my OS with `dnf` packages and repositories,
and the rabbit hole of atomic desktops and distroboxes.

The rules of thumb are:

1. Use Flatpak for all desktop applications.
2. Use Homebrew for all CLI applications. 
3. Use Mise for all project dependencies.
4. Use Podman containers for "services", such as PostgreSQL.

## Usage
The repository includes three scripts:

- `flatpak.sh` takes care of all things Flatpak.
  It sets up the "flathub" remote, removes the "fedora" remote, and installs a list of Flatpaks.
- `homebrew.sh` takes care of all things Homebrew.
  It sets up Homebrew and its dependencies, and installs a list of formulae.
- `setup.sh` is a convenience script, which calls `flatpak.sh` and `homebrew.sh`.

