#!/bin/bash
source ~/.local/share/omakub/install/lib/env.sh
# Temporarily switch away from using Typora repo which is broken.
#
# wget -qO - https://typora.io/linux/public-key.asc | sudo tee /etc/apt/trusted.gpg.d/typora.asc >/dev/null || true
#
# sudo add-apt-repository -y 'deb https://typora.io/linux ./'
# sudo add-apt-repository -y 'deb https://typora.io/linux ./'
# sudo $PKG_MGR update -y
# sudo $PKG_MGR install -y typora


if [ "$OS_NAME" = "Ubuntu" ]; then
  # Install with db
  cd /tmp
  wget -O typora.deb "https://downloads.typora.io/linux/typora_1.10.8_amd64.deb"
  sudo $PKG_MGR install -y /tmp/typora.deb
  rm typora.deb
  cd -
else
  # Add Typora repository for Fedora
  flatpak install -y --user flathub io.typora.Typora
fi

# Add iA Typora theme
mkdir -p ~/.config/Typora/themes
cp ~/.local/share/omakub/configs/typora/ia_typora.css ~/.config/Typora/themes/
cp ~/.local/share/omakub/configs/typora/ia_typora_night.css ~/.config/Typora/themes/
