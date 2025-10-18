#!/bin/bash

CHOICES=(
  "Dev Editor        Install alternative programming editors"
  "Dev Language      Install programming language environment"
  "Dev Database      Install development database in Docker"
  "Audacity          Record and edit audio"
  "Dropbox           Sync files across computers with ease"
  "Discord           Communication platform for voice, video, and text messaging"
  "Gimp              Image manipulation tool ala Photoshop"
  "Geekbench         CPU benchmaking tool"
  "OBS Studio        Record screencasts with inputs from both display + webcam"
  "Ollama            Run LLMs, like Meta's Llama3, locally"
  "Retroarch         Play retro games"
  "Spotify           Stream music from the world's most popular service"
  "Steam             Play games from Valve's store"
  "VirtualBox        Virtual machines to run Windows/Linux"
  "Zoom              Attend and host video chat meetings"
  "Web Apps          Install web apps with their own icon and shell"
  "> All             Re-run any of the default installers"
  "<< Back           "
)

CHOICE=$(gum choose "${CHOICES[@]}" --height 26 --header "Install application")

if [[ "$CHOICE" == "<< Back"* ]] || [[ -z "$CHOICE" ]]; then
  # Don't install anything
  echo ""
elif [[ "$CHOICE" == "> All"* ]]; then
  INSTALLER_FILE=$(gum file $linuxforge_PATH/install)

  [[ -n "$INSTALLER_FILE" ]] &&
    gum confirm "Run installer?" &&
    source $INSTALLER_FILE &&
    gum spin --spinner globe --title "Install completed!" -- sleep 3
else
  INSTALLER=$(echo "$CHOICE" | awk -F ' {2,}' '{print $1}' | tr '[:upper:]' '[:lower:]' | sed 's/ /-/g')

  case "$INSTALLER" in
  "dev-editor") INSTALLER_FILE="$linuxforge_PATH/bin/linuxforge-sub/install-dev-editor.sh" ;;
  "web-apps") INSTALLER_FILE="$linuxforge_PATH/install/desktop/optional/select-web-apps.sh" ;;
  "dev-language") INSTALLER_FILE="$linuxforge_PATH/install/terminal/select-dev-language.sh" ;;
  "dev-database") INSTALLER_FILE="$linuxforge_PATH/install/terminal/select-dev-storage.sh" ;;
  "ollama") INSTALLER_FILE="$linuxforge_PATH/install/terminal/optional/app-ollama.sh" ;;
  "tailscale") INSTALLER_FILE="$linuxforge_PATH/install/terminal/optional/app-tailscale.sh" ;;
  "geekbench") INSTALLER_FILE="$linuxforge_PATH/install/terminal/optional/app-geekbench.sh" ;;
  *) INSTALLER_FILE="$linuxforge_PATH/install/desktop/optional/app-$INSTALLER.sh" ;;
  esac

  source $INSTALLER_FILE && gum spin --spinner globe --title "Install completed!" -- sleep 3
fi

clear
source $linuxforge_PATH/bin/linuxforge
