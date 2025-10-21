#!/bin/bash
source ~/.local/share/linuxforge/install/lib/env.sh

if [ "$OS_NAME" = "Ubuntu" ]; then
  curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg &&
	sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg &&
	echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list >/dev/null &&
	run_pkg_mgr update
	run_pkg_mgr install gh
elif [ "$OS_NAME" = "Fedora" ]; then
  sudo $PKG_MGR config-manager addrepo  --overwrite --from-repofile https://cli.github.com/packages/rpm/gh-cli.repo
  run_pkg_mgr install gh
else
  run_pkg_mgr install github-cli
fi
