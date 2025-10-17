#!/bin/bash
source ~/.local/share/omakub/install/lib/env.sh

if [ "$OS_NAME" = "Ubuntu" ]; then
  # Sync files across machines using https://dropbox.com
  sudo $PKG_MGR install -y nautilus-dropbox >/dev/null
else
  # Sync files across machines using https://dropbox.com
  flatpak install -y --user flathub com.dropbox.Client
fi

