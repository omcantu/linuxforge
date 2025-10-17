#!/bin/bash
# A Communication platform for voice, video, and text messaging https://discord.com/
source ~/.local/share/omakub/install/lib/env.sh

if [ "$OS_NAME" = "Ubuntu" ]; then
  cd /tmp
  wget https://discord.com/api/download?platform=linux -O discord.deb
  sudo $PKG_MGR install ./discord.deb -y
  rm discord.deb
  cd -
else
  flatpak install -y --user flathub com.discordapp.Discord
fi
