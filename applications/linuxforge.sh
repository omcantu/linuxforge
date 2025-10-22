#!/bin/bash
# Create the directory if it doesn't exist
mkdir -p ~/.local/share/applications
cat <<EOF >~/.local/share/applications/linuxforge.desktop
[Desktop Entry]
Version=1.0
Name=linuxforge
Comment=linuxforge Controls
Exec=alacritty --config-file /home/$USER/.config/alacritty/pane.toml --class=linuxforge --title=linuxforge -e linuxforge
Terminal=false
Type=Application
Icon=/home/$USER/.local/share/omakub/applications/icons/linuxforge.png
Categories=System;
StartupNotify=false
EOF
