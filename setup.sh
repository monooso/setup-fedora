#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Check we can sudo before doing anything
if ! sudo -v; then
    echo "Error: sudo access is required to run this setup." >&2
    exit 1
fi

echo "=== Simple Setup ==="
echo ""

echo "--- Installing dnf packages ---"
source "$SCRIPT_DIR/dnf.sh"

echo ""
echo "--- Installing Flatpaks ---"
source "$SCRIPT_DIR/flatpak.sh"

echo ""
echo "--- Installing Homebrew and formulae ---"
source "$SCRIPT_DIR/homebrew.sh"

echo ""
echo "=== Setup complete ==="
