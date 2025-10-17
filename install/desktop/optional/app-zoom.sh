#!/bin/bash
source ~/.local/share/omakub/install/lib/env.sh

if [ "$OS_NAME" = "Ubuntu" ]; then
  # Make video calls using https://zoom.us/
  cd /tmp
  wget https://zoom.us/client/latest/zoom_amd64.deb
  sudo $PKG_MGR install -y ./zoom_amd64.deb
  rm zoom_amd64.deb
  cd -
else
  # Make video calls using https://zoom.us/
  cd /tmp
  wget https://zoom.us/client/latest/zoom_x86_64.rpm
  sudo $PKG_MGR install -y ./zoom_x86_64.rpm
  rm zoom_x86_64.rpm
  cd -
fi