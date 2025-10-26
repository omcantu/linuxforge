#!/bin/bash

if [ "$OS_NAME" = "Fedora" ]; then
  # Add Microsoft's VSCode repository for Fedora
  sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
  sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'

  # Install VSCode
  run_pkg_mgr install code
elif [ "$OS_NAME" = "Ubuntu" ]; then
  cd /tmp
  sudo rm -f /etc/apt/keyrings/packages.microsoft.gpg > /dev/null
  sudo rm -f /etc/apt/sources.list.d/vsdcode.list > /dev/null
  wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor >packages.microsoft.gpg
  sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
  echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" | sudo tee /etc/apt/sources.list.d/vscode.list >/dev/null
  rm -f packages.microsoft.gpg
  cd -

  run_pkg_mgr update
  run_pkg_mgr install code
elif [ "$OS_NAME" = "Arch" ]; then
  yay -S --noconfirm --needed visual-studio-code-bin
fi
# Install default supported themes
code --install-extension dracula-theme.theme-dracula
