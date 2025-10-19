#!/bin/bash
source ~/.local/share/linuxforge/install/lib/env.sh
# Browse the web with the most popular browser. See https://www.google.com/chrome/
if [ "$OS_NAME" = "Ubuntu" ]; then
  cd /tmp
  wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
  run_pkg_mgr install ./google-chrome-stable_current_amd64.deb
  rm google-chrome-stable_current_amd64.deb
  cd -
elseif [ "$OS_NAME" = "Fedora" ]; then
  run_pkg_mgr install fedora-workstation-repositories
  sudo $PKG_MGR config-manager setopt google-chrome.enabled=1
  run_pkg_mgr install google-chrome-stable
fi
# Todo: Arch google chrome install through yay
