#!/bin/bash
source ~/.local/share/omakub/install/lib/env.sh
sudo $PKG_MGR install -y emacs
git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.config/emacs
~/.config/emacs/bin/doom install
