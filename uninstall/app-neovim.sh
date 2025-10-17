#!/bin/bash
source ~/.local/share/omakub/install/lib/env.sh
sudo $PKG_MGR purge -y neovim neovim-runtime
rm ~/.local/share/applications/Neovim.desktop
rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.cache/nvim
