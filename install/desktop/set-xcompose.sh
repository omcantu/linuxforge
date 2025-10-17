#!/bin/bash

#cp $HOME/.local/share/omakub/configs/xcompose $HOME/.XCompose
# not restarting ibus as it causes issues with plasma
#ibus restart

# Define the directory and file path
#ENV_DIR="$HOME/.config/plasma-workspace/env"
#SCRIPT_FILE="$ENV_DIR/set_compose_key.sh"

# 1. Create the directory if it doesn't exist
#echo "Creating directory: $ENV_DIR"
#mkdir -p "$ENV_DIR"

# 2. Create the file and add content
#echo "Creating script file: $SCRIPT_FILE"
# Use a "here document" to write the content cleanly
#cat > "$SCRIPT_FILE" << EOF
##!/bin/bash
#setxkbmap -option "compose:caps"
#EOF

# 3. Make the script executable
#echo "Making script executable..."
#chmod +x "$SCRIPT_FILE"

#echo "✅ Script created and configured successfully!"
#echo "The compose key will be set to Caps Lock on your next login."
