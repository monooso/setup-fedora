# Simple setup

A sane middle ground between littering my OS with `dnf` packages and repositories,
and the rabbit hole of atomic desktops and distroboxes.

The rules of thumb are:

1. Use Flatpak for desktop applications.
2. Use Homebrew for CLI applications, whenever possible.
3. Use Mise for project dependencies.
4. Use Podman containers for "services", such as PostgreSQL.
5. As a last resort, use `dnf`.

## Usage
The repository includes four scripts:

- `dnf.sh` takes care of all things `dnf`.
  Among other things, it installs Fish, but _it does not set the user's shell_.
- `flatpak.sh` takes care of all things Flatpak.
  It sets up the "flathub" remote, removes the "fedora" remote, and installs a list of Flatpaks.
- `homebrew.sh` takes care of all things Homebrew.
  It sets up Homebrew and its dependencies, and installs a list of formulae.
- `setup.sh` is a convenience script, which calls `dnf.sh`, `flatpak.sh` and `homebrew.sh`.

