#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Give people a chance to retry running the installation
trap 'echo "linuxforge installation failed! You can retry by running: source ~/.local/share/linuxforge/install.sh"' ERR

# Load environment helpers
source ~/.local/share/linuxforge/install/lib/env.sh

# Ask for app choices
echo "Get ready to make a few choices..."
source ~/.local/share/linuxforge/install/terminal/required/app-gum.sh >/dev/null
source ~/.local/share/linuxforge/install/first-run-choices.sh
source ~/.local/share/linuxforge/install/identification.sh

echo "Installing desktop tools and terminal tools"
# Install terminal tools
source ~/.local/share/linuxforge/install/terminal.sh
# Install desktop tools and tweaks
source ~/.local/share/linuxforge/install/desktop.sh
echo "Finished!!!!"
