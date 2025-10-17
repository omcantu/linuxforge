#!/bin/bash
source ~/.local/share/omakub/install/lib/env.sh
sudo $PKG_MGR remove typora -y
rm -rf ~/.config/Typora
