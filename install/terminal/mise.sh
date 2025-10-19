#!/bin/bash
source ~/.local/share/linuxforge/install/lib/env.sh

if [ "$OS_NAME" = "Ubuntu" ]; then
  # Install mise for managing multiple versions of languages. See https://mise.jdx.dev/
  run_pkg_mgr update && run_pkg_mgr install gpg wget curl
  sudo install -dm 755 /etc/apt/keyrings
  wget -qO - https://mise.jdx.dev/gpg-key.pub | gpg --dearmor | sudo tee /etc/apt/keyrings/mise-archive-keyring.gpg 1>/dev/null
  echo "deb [signed-by=/etc/apt/keyrings/mise-archive-keyring.gpg arch=$(dpkg --print-architecture)] https://mise.jdx.dev/deb stable main" | sudo tee /etc/apt/sources.list.d/mise.list
  run_pkg_mgr update
  run_pkg_mgr install mise
elseif [ "$OS_NAME" = "Fedora" ]; then
  # Install mise for managing multiple versions of languages. See https://mise.jdx.dev/
  run_pkg_mgr install gpg wget curl

  # Add mise repository for Fedora
  sudo $PKG_MGR config-manager addrepo  --overwrite --from-repofile=https://mise.jdx.dev/rpm/mise.repo --overwrite
  sudo rpm --import https://mise.jdx.dev/gpg-key.pub

  # Install mise
  run_pkg_mgr install mise
else
  run_pkg_mgr install mise
fi