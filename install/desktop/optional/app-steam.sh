#!/bin/bash
source ~/.local/share/omakub/install/lib/env.sh

if [ "$OS_NAME" = "Ubuntu" ]; then
  # Play games from https://store.steampowered.com/
  cd /tmp
  wget https://cdn.akamai.steamstatic.com/client/installer/steam.deb
  sudo $PKG_MGR install -y ./steam.deb
  rm steam.deb
  cd -
else
  sudo $PKG_MGR install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y
  sudo $PKG_MGR config-manager setopt fedora-cisco-openh264.enabled=1
  sudo $PKG_MGR install -y steam
fi