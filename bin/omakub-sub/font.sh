#!/bin/bash

# Source shared env helpers if available (idempotent)
if [[ -f "$HOME/.local/share/omakub/install/lib/env.sh" ]]; then
	source "$HOME/.local/share/omakub/install/lib/env.sh"
else
	# fall back to repo copy (works when executed from repo root)
	source "$(dirname "$(dirname "$0")")/install/lib/env.sh" || true
fi

set_font() {
	local font_name=$1
	local url=$2
	local file_type=$3
	local file_name="${font_name/ Nerd Font/}"

	if ! $(fc-list | grep -i "$font_name" >/dev/null); then
		cd /tmp
		wget -O "$file_name.zip" "$url"
		unzip "$file_name.zip" -d "$file_name"
		cp "$file_name"/*."$file_type" ~/.local/share/fonts
		rm -rf "$file_name.zip" "$file_name"
		fc-cache
		cd -
		clear
		source $OMAKUB_PATH/ascii.sh
	fi

		#if [[ -n "${KWRC:-}" ]]; then
		#	$KWRC --file kdeglobals --group General --key fixed "$font_name,10,-1,5,50,0,0,0,0,0"
		#else
		#	echo "Warning: kwriteconfig not found; skipping kdeglobals font setting"
		#fi
	cp "$OMAKUB_PATH/configs/alacritty/fonts/$file_name.toml" ~/.config/alacritty/font.toml
	sed -i "s/\"editor.fontFamily\": \".*\"/\"editor.fontFamily\": \"$font_name\"/g" ~/.config/Code/User/settings.json
}

if [ "$#" -gt 1 ]; then
	choice=${!#}
else
	choice=$(gum choose "Cascadia Mono" "Fira Mono" "JetBrains Mono" "Meslo" "> Change size" "<< Back" --height 8 --header "Choose your programming font")
fi

case $choice in
"Cascadia Mono")
	set_font "CaskaydiaMono Nerd Font" "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/CascadiaMono.zip" "ttf"
	;;
"Fira Mono")
	set_font "FiraMono Nerd Font" "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/FiraMono.zip" "otf"
	;;
"JetBrains Mono")
	set_font "JetBrainsMono Nerd Font" "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip" "ttf"
	;;
"Meslo")
	set_font "MesloLGS Nerd Font" "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/Meslo.zip" "ttf"
	;;
"> Change size")
	source $OMAKUB_PATH/bin/omakub-sub/font-size.sh
	exit
	;;
esac

source $OMAKUB_PATH/bin/omakub-sub/menu.sh
