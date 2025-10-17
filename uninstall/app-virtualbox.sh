#!/bin/bash
source ~/.local/share/omakub/install/lib/env.sh
sudo $PKG_MGR purge -y virtualbox virtualbox-dkms virtualbox-qt virtualbox-ext-pack
sudo $PKG_MGR autoremove --purge -y
rm -rf ~/.config/VirtualBox
