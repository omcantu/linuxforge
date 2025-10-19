#!/bin/bash

THEME_NAMES=("Tokyo Night" "Catppuccin" "Nord" "Everforest" "Gruvbox" "Kanagawa" "Ristretto" "Rose Pine" "Matte Black" "Dracula")
THEME=$(gum choose "${THEME_NAMES[@]}" "<< Back" --header "Choose your theme" --height 12 | tr '[:upper:]' '[:lower:]' | sed 's/ /-/g')

if [ -n "$THEME" ] && [ "$THEME" != "<<-back" ]; then
  cp $linuxforge_PATH/themes/$THEME/alacritty.toml ~/.config/alacritty/theme.toml
  if [ -d "$HOME/.config/nvim" ]; then
    cp $linuxforge_PATH/themes/$THEME/neovim.lua ~/.config/nvim/lua/plugins/theme.lua
  fi

  if [ -f "$linuxforge_PATH/themes/$THEME/btop.theme" ]; then
    cp $linuxforge_PATH/themes/$THEME/btop.theme ~/.config/btop/themes/$THEME.theme
    sed -i "s/color_theme = \".*\"/color_theme = \"$THEME\"/g" ~/.config/btop/btop.conf
  else
    sed -i "s/color_theme = \".*\"/color_theme = \"Default\"/g" ~/.config/btop/btop.conf
  fi


  source $linuxforge_PATH/themes/$THEME/vscode.sh
fi

source $linuxforge_PATH/bin/linuxforge-sub/menu.sh
