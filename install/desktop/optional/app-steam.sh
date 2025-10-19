#!/bin/bash
source ~/.local/share/linuxforge/install/lib/env.sh

if [ "$OS_NAME" = "Ubuntu" ]; then
  # Play games from https://store.steampowered.com/
  cd /tmp
  wget https://cdn.akamai.steamstatic.com/client/installer/steam.deb
  run_pkg_mgr install ./steam.deb
  rm steam.deb
  cd -
elseif [ "$OS_NAME" = "Fedora" ]; then
  run_pkg_mgr install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y
  sudo $PKG_MGR config-manager setopt fedora-cisco-openh264.enabled=1
  run_pkg_mgr install steam
else
  run_pkg_mgr install steam
fi