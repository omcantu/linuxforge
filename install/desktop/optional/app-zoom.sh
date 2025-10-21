#!/bin/bash
source ~/.local/share/linuxforge/install/lib/env.sh

if [ "$OS_NAME" = "Ubuntu" ]; then
  # Make video calls using https://zoom.us/
  cd /tmp
  wget https://zoom.us/client/latest/zoom_amd64.deb
  run_pkg_mgr install ./zoom_amd64.deb
  rm zoom_amd64.deb
  cd -
elif [ "$OS_NAME" = "Fedora" ]; then
  # Make video calls using https://zoom.us/
  cd /tmp
  wget https://zoom.us/client/latest/zoom_x86_64.rpm
  run_pkg_mgr install ./zoom_x86_64.rpm
  rm zoom_x86_64.rpm
  cd -
else
  yay -S --noconfirm --needed zoom
fi
