#!/bin/bash
source ~/.local/share/omakub/install/lib/env.sh
sudo $PKG_MGR purge --auto-remove docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin docker-ce-rootless-extras
sudo groupdel docker
