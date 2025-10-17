#!/bin/bash
# Create the directory if it doesn't exist
mkdir -p ~/.local/share/applications
cat <<EOF >~/.local/share/applications/HEY.desktop
[Desktop Entry]
Version=1.0
Name=HEY
Comment=HEY Email + Calendar
Exec=google-chrome --app="https://app.hey.com/" --name=HEY --class=HEY
Terminal=false
Type=Application
Icon=/home/$USER/.local/share/omakub/applications/icons/HEY.png
Categories=Network;Internet;
MimeType=text/html;text/xml;application/xhtml_xml;
StartupNotify=true
EOF
