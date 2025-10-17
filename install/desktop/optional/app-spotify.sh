#!/bin/bash
source ~/.local/share/omakub/install/lib/env.sh

if [ "$OS_NAME" = "Ubuntu" ]; then
  # Stream music using https://spotify.com
  curl -sS https://download.spotify.com/debian/pubkey_C85668DF69375001.gpg | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg
  echo "deb [signed-by=/etc/apt/trusted.gpg.d/spotify.gpg] https://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
  sudo $PKG_MGR update -y
  sudo $PKG_MGR install -y spotify-client
else
  # Stream music using https://spotify.com
  flatpak install -y --user flathub com.spotify.Client
fi
