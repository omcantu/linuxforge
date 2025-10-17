#!/bin/bash
# Create the directory if it doesn't exist
mkdir -p ~/.local/share/applications
cat <<EOF >~/.local/share/applications/Omakub.desktop
[Desktop Entry]
Version=1.0
Name=Omakub
Comment=Omakub Controls
Exec=alacritty --config-file /home/$USER/.config/alacritty/pane.toml --class=Omakub --title=Omakub -e omakub
Terminal=false
Type=Application
Icon=/home/$USER/.local/share/omakub/applications/icons/Omakub.png
Categories=System;
StartupNotify=false
EOF
