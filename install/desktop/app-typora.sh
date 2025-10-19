#!/bin/bash
source ~/.local/share/linuxforge/install/lib/env.sh
# Temporarily switch away from using Typora repo which is broken.
#
# wget -qO - https://typora.io/linux/public-key.asc | sudo tee /etc/apt/trusted.gpg.d/typora.asc >/dev/null || true
#
# sudo add-apt-repository -y 'deb https://typora.io/linux ./'
# sudo add-apt-repository -y 'deb https://typora.io/linux ./'
# run_pkg_mgr update
# run_pkg_mgr install typora


if [ "$OS_NAME" = "Ubuntu" ]; then
  # Install with db
  cd /tmp
  wget -O typora.deb "https://downloads.typora.io/linux/typora_1.10.8_amd64.deb"
  run_pkg_mgr install /tmp/typora.deb
  rm typora.deb
  cd -
elseif [ "$OS_NAME" = "Arch" ]; then
  run_pkg_mgr install typora
else
  # Add Typora repository for Fedora
  flatpak install -y --user flathub io.typora.Typora
fi

# Add iA Typora theme
mkdir -p ~/.config/Typora/themes
cp ~/.local/share/linuxforge/configs/typora/ia_typora.css ~/.config/Typora/themes/
cp ~/.local/share/linuxforge/configs/typora/ia_typora_night.css ~/.config/Typora/themes/
