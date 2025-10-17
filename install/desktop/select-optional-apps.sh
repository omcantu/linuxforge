#!/bin/bash

if [[ -v linuxforge_FIRST_RUN_OPTIONAL_APPS ]]; then
	apps=$linuxforge_FIRST_RUN_OPTIONAL_APPS

	if [[ -n "$apps" ]]; then
		for app in $apps; do
			source "$linuxforge_PATH/install/desktop/optional/app-${app,,}.sh"
		done
	fi
fi
