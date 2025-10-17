#!/bin/bash
# Create the directory if it doesn't exist
mkdir -p ~/.local/share/applications
cat <<EOF >~/.local/share/applications/Docker.desktop
[Desktop Entry]
Version=1.0
Name=Docker
Comment=Manage Docker containers with LazyDocker
Exec=alacritty --config-file /home/$USER/.config/alacritty/pane.toml --class=Docker --title=Docker -e lazydocker
Terminal=false
Type=Application
Icon=/home/$USER/.local/share/omakub/applications/icons/Docker.png
Categories=Development;
StartupNotify=false
EOF
