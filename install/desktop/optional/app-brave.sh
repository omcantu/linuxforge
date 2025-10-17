#!/bin/bash
source ~/.local/share/omakub/install/lib/env.sh

if [ "$OS_NAME" = "Ubuntu" ]; then
  sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
  echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
  sudo $PKG_MGR update -y
  sudo $PKG_MGR install -y brave-browser
else
  # Add Brave browser repository for Fedora
  sudo $PKG_MGR config-manager addrepo  --overwrite --from-repofile https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo

  # Install Brave browser
  sudo $PKG_MGR install -y brave-browser
fi