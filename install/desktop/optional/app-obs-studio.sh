#!/bin/bash
source ~/.local/share/omakub/install/lib/env.sh
# OBS Studio is a screen recording application that allows you to capture both display and webcam in the same recording
if [ "$OS_NAME" = "Fedora" ]; then
  sudo $PKG_MGR clean all
fi
sudo $PKG_MGR install -y obs-studio
