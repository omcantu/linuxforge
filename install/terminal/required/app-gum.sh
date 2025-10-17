#!/bin/bash
source ~/.local/share/linuxforge/install/lib/env.sh

if [ "$OS_NAME" = "Ubuntu" ]; then
  # Gum is used for the linuxforge commands for tailoring linuxforge after the initial install
  cd /tmp
  GUM_VERSION="0.14.3" # Use known good version
  wget -qO gum.deb "https://github.com/charmbracelet/gum/releases/download/v${GUM_VERSION}/gum_${GUM_VERSION}_amd64.deb"
  sudo apt install -y --allow-downgrades ./gum.deb
  rm gum.deb
  cd -
else
  sudo $PKG_MGR install -y gum
fi