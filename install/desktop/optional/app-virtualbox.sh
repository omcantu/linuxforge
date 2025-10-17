#!/bin/bash
source ~/.local/share/omakub/install/lib/env.sh
# Virtualbox allows you to run VMs for other flavors of Linux or even Windows
# See https://ubuntu.com/tutorials/how-to-run-ubuntu-desktop-on-a-virtual-machine-using-virtualbox#1-overview
# for a guide on how to run Ubuntu inside it.

if [ "$OS_NAME" = "Ubuntu" ]; then
  sudo $PKG_MGR install -y virtualbox virtualbox-ext-pack
else
  sudo $PKG_MGR install -y VirtualBox VirtualBox-guest-additions
fi
sudo usermod -aG vboxusers ${USER}


