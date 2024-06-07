#!/bin/bash
set -euo pipefail

here="$PWD"
[[ ! -f "$here/install.sh" ]] && exit 1

su -c 'ln -sf "/run/systemd/resolve/stub-resolv.conf" "/etc/resolv.conf"'
su -c 'pacman -S stow neovim git openssh'

stow -t "$HOME" -d "/mnt/phoebus" .
stow --dotfiles --no-folding -t "$HOME" -d "$here" .

echo "DONE"
