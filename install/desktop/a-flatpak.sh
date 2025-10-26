#!/bin/bash
source ~/.local/share/linuxforge/install/lib/env.sh

run_pkg_mgr install flatpak
if [ "$OS_NAME" = "Ubuntu" ]; then
  run_pkg_mgr install plasma-discover-backend-flatpak
fi
sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak remote-add --user --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
