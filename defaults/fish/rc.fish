# Fish defaults aggregator (mirrors defaults/bash/rc)
# Sources all fish-specific configuration files

set fish_conf_dir ~/.local/share/linuxforge/defaults/fish

# Source each module in order (similar to bash/rc)
source $fish_conf_dir/shell.fish
source $fish_conf_dir/aliases.fish
source $fish_conf_dir/functions.fish
source $fish_conf_dir/init.fish

# Load starship prompt if available
if command -sq starship
    starship init fish | source
end