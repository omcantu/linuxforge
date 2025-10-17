#!/bin/bash
# Create the directory if it doesn't exist
mkdir -p ~/.local/share/applications
cat <<EOF >~/.local/share/applications/Neovim.desktop
[Desktop Entry]
Version=1.0
Name=Neovim
Comment=Edit text files
Exec=alacritty --config-file /home/$USER/.config/alacritty/pane.toml --class=Neovim --title=Neovim -e nvim %F
Terminal=false
Type=Application
Icon=nvim
Categories=Utilities;TextEditor;
StartupNotify=false
EOF
