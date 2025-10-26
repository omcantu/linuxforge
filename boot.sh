#!/bin/bash

set -e

echo "=> linuxforge is for fresh Kubuntu 24.04+ or Fedora KDE installations only!"
echo -e "\nBegin installation (or abort with ctrl+c)..."

if command -v dnf >/dev/null 2>&1; then
    PKG_MGR=dnf
    OS_NAME="Fedora"
    sudo $PKG_MGR clean all >/dev/null
    sudo $PKG_MGR update -y >/dev/null
elif command -v apt >/dev/null 2>&1; then
    PKG_MGR=apt
    OS_NAME="Ubuntu"
    sudo $PKG_MGR update >/dev/null
elif command -v pacman >/dev/null 2>&1; then
    PKG_MGR=pacman
    OS_NAME="Arch"
    sudo $PKG_MGR -Syu --noconfirm
else
    echo "Warning : no supported package manager found (dnf, apt or pacman)"
    return 1
fi
export PKG_MGR

if [[ "$OS_NAME" = "Arch" ]]; then
  sudo pacman -Syu --noconfirm --needed git
  sudo pacman -S --needed --noconfirm base-devel
else
  sudo $PKG_MGR install -y git >/dev/null
fi
echo "Cloning linuxforge..."
rm -rf ~/.local/share/linuxforge
git clone https://github.com/omcantu/linuxforge.git ~/.local/share/linuxforge >/dev/null


echo "Installation starting..."
source ~/.local/share/linuxforge/install.sh
