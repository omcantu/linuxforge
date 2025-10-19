#!/bin/bash
source ~/.local/share/linuxforge/install/lib/env.sh
# Virtualbox allows you to run VMs for other flavors of Linux or even Windows
# See https://ubuntu.com/tutorials/how-to-run-ubuntu-desktop-on-a-virtual-machine-using-virtualbox#1-overview
# for a guide on how to run Ubuntu inside it.

if [ "$OS_NAME" = "Ubuntu" ]; then
  run_pkg_mgr install virtualbox virtualbox-ext-pack
else
  run_pkg_mgr install VirtualBox VirtualBox-guest-additions
fi
sudo usermod -aG vboxusers ${USER}


