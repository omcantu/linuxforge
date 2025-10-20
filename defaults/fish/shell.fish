#!/usr/bin/env fish
# Basic environment and path setup for Fish

# Set complete path (prepend project-local bins)
set -x PATH ./bin $HOME/.local/bin $HOME/.local/share/linuxforge/bin $PATH

# Expose linuxforge path for other scripts
set -x linuxforge_PATH $HOME/.local/share/linuxforge

# Note: Fish manages history and completions differently from bash.
# Additional completion tooling is sourced from `init.fish` when available.
