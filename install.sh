#!/bin/bash
set -euo pipefail

here="$PWD"
[[ ! -f "$here/install.sh" ]] && exit 1

su -c 'ln -sf "/run/systemd/resolve/stub-resolv.conf" "/etc/resolv.conf"'
su -c 'pacman -S $(tr "\n" " " < "$0")' root "$here/programs"

cd "$HOME" || exit 1
curl -O "https://dl.suckless.org/tools/dmenu-5.3.tar.gz"
tar -xf "dmenu-5.3.tar.gz"
cd "$HOME/dmenu-5.3" || exit 1
cp "$here/patches/dmenu-initialtext-5.3.diff" .
patch < "dmenu-initialtext-5.3.diff"
su -c "make clean install"

cd "$HOME" || exit 1
curl -O "https://dl.suckless.org/dwm/dwm-6.5.tar.gz"
tar -xf "dwm-6.5.tar.gz"
cd "$HOME/dwm-6.5" || exit 1
cp "config.def.h" "config.h"
su -c "make clean install"

su -c 'install -Dm 644 "$0" "/etc/X11/xorg.conf.d/"' root "$here/etc/50-mouse-acceleration.conf"
su -c 'install -Dm 644 "$0" "/etc/fonts/conf.d/"' root "$here/etc/66-noto-reject-nastaliq.conf"

stow -t "$HOME" -d "/mnt/phoebus" .
stow --dotfiles --no-folding -t "$HOME" -d "$here" .

echo "DONE"
