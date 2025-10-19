#!/bin/bash
source ~/.local/share/linuxforge/install/lib/env.sh
run_pkg_mgr install emacs
git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.config/emacs
~/.config/emacs/bin/doom install
