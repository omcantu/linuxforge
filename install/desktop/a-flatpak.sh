#!/bin/bash
source ~/.local/share/omakub/install/lib/env.sh

sudo $PKG_MGR install -y flatpak
if [ "$OS_NAME" = "Ubuntu" ]; then
  sudo $PKG_MGR install -y plasma-discover-backend-flatpak
else
echo "Plasma Discover"
#  sudo $PKG_MGR install -y plasma-discover-flatpak
fi
sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak remote-add --user --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
