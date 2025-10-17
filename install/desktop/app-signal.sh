#!/bin/bash
source ~/.local/share/omakub/install/lib/env.sh


if [ "$OS_NAME" = "Ubuntu" ]; then
	wget -qO- https://updates.signal.org/desktop/apt/keys.asc | gpg --dearmor >signal-desktop-keyring.gpg
	cat signal-desktop-keyring.gpg | sudo tee /usr/share/keyrings/signal-desktop-keyring.gpg >/dev/null
	echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/signal-desktop-keyring.gpg] https://updates.signal.org/desktop/apt xenial main' |
		sudo tee /etc/apt/sources.list.d/signal-xenial.list
	rm signal-desktop-keyring.gpg
	sudo $PKG_MGR update
	sudo $PKG_MGR install -y signal-desktop
else
  # Add Signal repository for Fedora
	flatpak install -y --user flathub org.signal.Signal
fi
