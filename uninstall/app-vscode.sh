#!/bin/bash
source ~/.local/share/linuxforge/install/lib/env.sh
sudo $PKG_MGR purge -y remove code
rm -rf ~/.config/Code/User
