#!/bin/bash

  # Add Microsoft's VSCode repository for Fedora
  sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
  sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'

  # Install VSCode
  sudo dnf install -y code

# Install default supported themes
code --install-extension dracula-theme.theme-dracula
