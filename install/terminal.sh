#!/bin/bash
source ~/.local/share/linuxforge/install/lib/env.sh
# Needed for all installers
run_pkg_mgr update
run_pkg_mgr ugrade
run_pkg_mgr install curl git unzip

# Run terminal installers
for installer in ~/.local/share/linuxforge/install/terminal/*.sh; do source $installer; done
