#!/bin/bash
source ~/.local/share/linuxforge/install/lib/env.sh
# This script installs btop, a resource monitor that shows usage and stats for processor, memory, disks, network and processes.
sudo $PKG_MGR install -y btop

# Use linuxforge btop config
mkdir -p ~/.config/btop/themes
cp ~/.local/share/linuxforge/configs/btop.conf ~/.config/btop/btop.conf
cp ~/.local/share/linuxforge/themes/tokyo-night/btop.theme ~/.config/btop/themes/tokyo-night.theme

