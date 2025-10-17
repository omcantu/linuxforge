#!/bin/bash
source ~/.local/share/omakub/install/lib/env.sh
sudo $PKG_MGR remove --purge -y emacs emacs-gtk
sudo rm -rf ~/.config/emacs
sudo rm -rf ~/.emacs.d
sudo rm -rf ~/.config/doom
