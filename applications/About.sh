#!/bin/bash
# Create the directory if it doesn't exist
mkdir -p ~/.local/share/applications
# Create the About.desktop file with the specified content
cat <<EOF >~/.local/share/applications/About.desktop
[Desktop Entry]
Version=1.0
Name=About
Comment=System information from Fastfetch
Exec=alacritty --config-file /home/$USER/.config/alacritty/pane.toml --class=About --title=About -e bash -c 'fastfetch; read -n 1 -s'
Terminal=false
Type=Application
Icon=/home/$USER/.local/share/omakub/applications/icons/Ubuntu.png
Categories=System;
StartupNotify=false
EOF