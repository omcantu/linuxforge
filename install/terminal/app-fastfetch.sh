#!/bin/bash
source ~/.local/share/omakub/install/lib/env.sh
# Display system information in the terminal

if [ "$OS_NAME" = "Ubuntu" ]; then
  sudo add-apt-repository -y ppa:zhangsongcui3371/fastfetch
fi
sudo $PKG_MGR update
sudo $PKG_MGR install -y fastfetch

# Only attempt to set configuration if fastfetch is not already set
if [ ! -f "$HOME/.config/fastfetch/config.jsonc" ]; then
  # Use Omakub fastfetch config
  mkdir -p ~/.config/fastfetch
  cp ~/.local/share/omakub/configs/fastfetch.jsonc ~/.config/fastfetch/config.jsonc
fi
