#!/usr/bin/env bash

echo "🔧 Killing leftover dnf, PackageKit, and ansible processes..."
sudo pkill -9 dnf 2>/dev/null
sudo pkill -9 PackageKit 2>/dev/null
pkill -9 ansible 2>/dev/null

echo "🧹 Removing DNF metadata locks..."
sudo rm -f /var/cache/dnf/metadata_lock.pid

echo "🧹 Cleaning up Ansible temp files..."
rm -rf ~/.ansible/tmp/
rm -rf ~/.cache/ansible/

echo "✅ Done. You can rerun the playbook now."

