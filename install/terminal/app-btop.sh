#!/bin/bash
source ~/.local/share/omakub/install/lib/env.sh
# This script installs btop, a resource monitor that shows usage and stats for processor, memory, disks, network and processes.
sudo $PKG_MGR install -y btop

# Use Omakub btop config
mkdir -p ~/.config/btop/themes
cp ~/.local/share/omakub/configs/btop.conf ~/.config/btop/btop.conf
cp ~/.local/share/omakub/themes/tokyo-night/btop.theme ~/.config/btop/themes/tokyo-night.theme

