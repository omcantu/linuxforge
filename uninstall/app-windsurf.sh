#!/bin/bash
source ~/.local/share/omakub/install/lib/env.sh
sudo $PKG_MGR purge -y windsurf
sudo rm /etc/apt/sources.list.d/windsurf.list
sudo rm /usr/share/keyrings/windsurf-stable-archive-keyring.gpg
