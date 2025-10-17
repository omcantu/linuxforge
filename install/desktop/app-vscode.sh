#!/bin/bash
source ~/.local/share/omakub/install/lib/env.sh





if [ "$OS_NAME" = "Ubuntu" ]; then
  cd /tmp
  # Check if the sources list file already exists and remove it to prevent duplicates
  if [ -f "/etc/apt/sources.list.d/vscode.list" ]; then
      echo "Removing existing vscode.list file..."
      sudo rm -f /etc/apt/sources.list.d/vscode.list
  fi
  if [ -f "/etc/apt/sources.list.d/vscode.sources" ]; then
      echo "Removing existing vscode.sources file..."
      sudo rm -f /etc/apt/sources.list.d/vscode.sources
  fi
  
  # Download and install the GPG key
  wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor >packages.microsoft.gpg
  sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
  
  # Add the VS Code repository to a new, clean file
  sudo tee /etc/apt/sources.list.d/vscode.sources > /dev/null << EOF
Types: deb
URIs: https://packages.microsoft.com/repos/code
Suites: stable
Components: main
Architectures: amd64,arm64,armhf
Signed-By: /usr/share/keyrings/microsoft.gpg
EOF
  
  # Clean up
  rm -f packages.microsoft.gpg
  cd -

  sudo $PKG_MGR update
  sudo $PKG_MGR install -y code
else
  # Add Microsoft's VSCode repository for Fedora
  sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
  sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'

  # Install VSCode
  sudo $PKG_MGR install -y code
fi


mkdir -p ~/.config/Code/User
cp ~/.local/share/omakub/configs/vscode.json ~/.config/Code/User/settings.json

# Install default supported themes
code --install-extension dracula-theme.theme-dracula
