#!/bin/bash
source ~/.local/share/linuxforge/install/lib/env.sh
if [ "$OS_NAME" = "Ubuntu" ]; then
  cd /tmp
  wget -O nvim.tar.gz "https://github.com/neovim/neovim/releases/download/stable/nvim-linux-x86_64.tar.gz"
  tar -xf nvim.tar.gz
  sudo install nvim-linux-x86_64/bin/nvim /usr/local/bin/nvim
  sudo cp -R nvim-linux-x86_64/lib /usr/local/
  sudo cp -R nvim-linux-x86_64/share /usr/local/
  rm -rf nvim-linux-x86_64 nvim.tar.gz
  cd -
else
  run_pkg_mgr install nvim
fi
# Install luarocks and tree-sitter-cli to resolve lazyvim :checkhealth warnings
run_pkg_mgr install luarocks tree-sitter-cli

# Only attempt to set configuration if Neovim has never been run
if [ ! -d "$HOME/.config/nvim" ]; then
  # Use LazyVim
  git clone https://github.com/LazyVim/starter ~/.config/nvim
  # Remove the .git folder, so you can add it to your own repo later
  rm -rf ~/.config/nvim/.git

  # Make everything match the terminal transparency
  mkdir -p ~/.config/nvim/plugin/after
  cp ~/.local/share/linuxforge/configs/neovim/transparency.lua ~/.config/nvim/plugin/after/

  # Ensure editor.neo-tree is used by default
  cp ~/.local/share/linuxforge/configs/neovim/lazyvim.json ~/.config/nvim/
fi
