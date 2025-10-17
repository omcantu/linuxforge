#!/bin/bash

set -e

ascii_art='________                  __        ___.
\_____  \   _____ _____  |  | ____ _\_ |__
 /   |   \ /     \\__   \ |  |/ /  |  \ __ \
/    |    \  Y Y  \/ __ \|    <|  |  / \_\ \
\_______  /__|_|  (____  /__|_ \____/|___  /
        \/      \/     \/     \/         \/
'

echo -e "$ascii_art"
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
else
    echo "Warning : no supported package manager found (dnf or apt)"
    return 1
fi
export PKG_MGR

sudo $PKG_MGR install -y git >/dev/null

echo "Cloning linuxforge..."
rm -rf ~/.local/share/linuxforge
git clone https://github.com/omcantu/linuxforgetu.git ~/.local/share/linuxforge >/dev/null


echo "Installation starting..."
source ~/.local/share/linuxforge/install.sh
