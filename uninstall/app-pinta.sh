#!/bin/bash
source ~/.local/share/linuxforge/install/lib/env.sh
if [ "$OS_NAME" = "Ubuntu" ]; then
  sudo snap remove pinta
else
  flatpak uninstall -y flathub com.github.PintaProject.Pinta
fi
