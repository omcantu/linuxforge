# Linux Setup
This sets up a brand new system according to my prefered libraries, apps and terminal environment

## Install
``` sh
wget -qO- https://raw.githubusercontent.com/omcantu/linuxforge/refs/heads/main/boot.sh | bash
```
 
## Fish shell support

This project now includes optional Fish shell configuration. To install the Fish config after installing the required packages, run:

```sh
# make sure fish is installed (the project installer can install it)
~/.local/share/linuxforge/install/terminal/app-fish.sh
```

This copies `configs/fish/config.fish` to `~/.config/fish/config.fish` (backing up any existing file).

Starship (cross-shell prompt) and Dracula theme
----------------------------------------------

The installer will also attempt to ensure Starship is installed. If Starship isn't present it will run the official installer script to install it. The installer will then apply the Dracula Starship palette from `themes/dracula/starship.toml`.

Behavior summary:
- If you don't have a `~/.config/starship.toml`, the installer will copy the Dracula `starship.toml` into that path.
- If you already have a `~/.config/starship.toml`, the installer will append the Dracula palette to your existing file only if your config does not already reference `palette = "dracula"`. You should review the merged file afterwards.

Plugins
-------

Fisher plugins installed by the script come from `configs/fish/fish_plugins` in the repository (one plugin per line). Edit that file in the repo to add or remove plugins before running the installer.

After install you may need to restart your shell (exec fish) to load new completions and plugins. If you want a different prompt (tide, starship customization, or starship presets), edit `~/.config/starship.toml` directly.

## License

This is released under the [MIT License](https://opensource.org/licenses/MIT).
