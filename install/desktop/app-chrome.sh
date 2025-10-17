#!/bin/bash
source ~/.local/share/omakub/install/lib/env.sh
# Browse the web with the most popular browser. See https://www.google.com/chrome/
if [ "$OS_NAME" = "Ubuntu" ]; then
  cd /tmp
  wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
  sudo $PKG_MGR install -y ./google-chrome-stable_current_amd64.deb
  rm google-chrome-stable_current_amd64.deb
  cd -
else
  sudo $PKG_MGR install -y fedora-workstation-repositories
  sudo $PKG_MGR config-manager setopt google-chrome.enabled=1
  sudo $PKG_MGR install -y google-chrome-stable
fi
