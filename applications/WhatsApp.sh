#!/bin/bash
# Create the directory if it doesn't exist
mkdir -p ~/.local/share/applications
cat <<EOF >~/.local/share/applications/WhatsApp.desktop
[Desktop Entry]
Version=1.0
Name=WhatsApp
Comment=WhatsApp Messenger
Exec=google-chrome --app="https://web.whatsapp.com" --name=WhatsApp --class=Whatsapp
Terminal=false
Type=Application
Icon=/home/$USER/.local/share/omakub/applications/icons/WhatsApp.png
Categories=Network;Internet;
MimeType=text/html;text/xml;application/xhtml_xml;
StartupNotify=true
EOF
