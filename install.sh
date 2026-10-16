#!/usr/bin/env bash
set -euo pipefail

REPO_NAME="schneider-arch-repo"
PACMAN_CONF="/etc/pacman.conf"

if grep -Fqx "[$REPO_NAME]" "$PACMAN_CONF"; then
    echo "Schneider Arch Repository is already configured."
    exit 0
fi

sudo tee -a "$PACMAN_CONF" > /dev/null <<'EOF'

[schneider-arch-repo]
SigLevel = Optional TrustAll
Server = https://codeberg.org/schneiderman/$repo/raw/branch/main/$arch
EOF

echo "Schneider Arch Repository added successfully!"
echo "Refreshing package databases..."

sudo pacman -Sy

echo "Done! Install packages with:"
echo "  sudo pacman -S everything-linux"
echo "  sudo pacman -S jarvis"
echo "  sudo pacman -S schneider-deep-learn"
