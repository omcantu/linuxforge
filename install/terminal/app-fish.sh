#!/bin/bash

# Install fish config from linuxforge into user's fish config location
source ~/.local/share/linuxforge/install/lib/env.sh
set -e


if ! command -v fish >/dev/null 2>&1; then
  run_pkg_mgr install fish
fi

mkdir -p "$HOME/.config/fish"

if [ -f "$HOME/.config/fish/config.fish" ]; then
  echo "Backing up existing fish config to ~/.config/fish/config.fish.bak"
  mv "$HOME/.config/fish/config.fish" "$HOME/.config/fish/config.fish.bak"
fi

cp "$HOME/.local/share/linuxforge/configs/fish/config.fish" "$HOME/.config/fish/config.fish"
echo "Installed linuxforge fish config to ~/.config/fish/config.fish"

# Make fish the default shell if it isn't already
FISH_PATH="$(command -v fish)"
if [ -n "$FISH_PATH" ]; then
  # Check if fish is already in /etc/shells
  if ! grep -q "^$FISH_PATH$" /etc/shells; then
    echo "Adding fish to /etc/shells (requires sudo)"
    echo "$FISH_PATH" | sudo tee -a /etc/shells
  fi

  # Only change shell if not already fish
  if [ "$SHELL" != "$FISH_PATH" ]; then
    TARGET_USER="$USER"
    echo "Changing shell for user $TARGET_USER to $FISH_PATH..."
    sudo chsh -s "$FISH_PATH" -u "$TARGET_USER"
    echo "Shell changed to fish. Changes will take effect on next login."
  else
    echo "Fish is already the default shell"
  fi
else
  echo "Warning: Could not find fish path. Shell not changed."
fi

# Bootstrap Fisher if missing
if ! fish -c 'command -v fisher >/dev/null 2>&1' >/dev/null 2>&1; then
  echo "Bootstrapping Fisher (plugin manager)"
  fish -c 'curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher' || true
fi

# Install requested Fisher plugins (idempotent)
# Read plugins from repo-provided configs/fish/fish_plugins (installed to ~/.local/share/linuxforge)
PLUGINS_FILE="$HOME/.local/share/linuxforge/configs/fish/fish_plugins"
if [ -f "$PLUGINS_FILE" ]; then
  echo "Reading Fisher plugin list from $PLUGINS_FILE"
  mapfile -t PLUGINS < <(sed -e 's/#.*//' -e '/^\s*$/d' "$PLUGINS_FILE") || true
else
  # Fallback to bundled list
  PLUGINS=("PatrickF1/fzf.fish" "jorgebucaran/autopair.fish" "dracula/fish")
fi

for p in "${PLUGINS[@]}"; do
  echo "Installing fisher plugin: $p"
  fish -c "fisher list | grep -q -- \"$p\" || fisher install $p" || true
done

echo "Ensuring Starship (cross-shell prompt) is installed"
if ! command -v starship >/dev/null 2>&1; then
  echo "Installing Starship (platform packages may prefer distro package manager). Trying official installer..."
  # follow official quick-install (idempotent)
  sh -c "$(curl -fsSL https://starship.rs/install.sh)" -- -y || true
else
  echo "Starship already installed"
fi

# Ensure Starship config exists and merge/apply Dracula theme palette
mkdir -p "$HOME/.config"
STARSHIP_CONF="$HOME/.config/starship.toml"
LOCAL_DRACULA="$HOME/.local/share/linuxforge/themes/dracula/starship.toml"

if [ -f "$LOCAL_DRACULA" ]; then
  echo "Applying local Dracula Starship theme from $LOCAL_DRACULA"
  if [ -f "$STARSHIP_CONF" ]; then
    # Merge strategy: if palette is not set to dracula, append the dracula palette and keep existing config
      if grep -q "palette\s*=\s*\"dracula\"" "$STARSHIP_CONF"; then
        echo "Starship already uses the Dracula palette"
      else
        # Backup existing starship config before appending
        BACKUP="$STARSHIP_CONF.bak.$(date +%s)"
        echo "Backing up existing $STARSHIP_CONF to $BACKUP"
        cp "$STARSHIP_CONF" "$BACKUP" || true
        echo "Appending Dracula palette to existing $STARSHIP_CONF (you may want to review the result)"
        printf "\n# Appended by linuxforge installer: Dracula palette\n" >> "$STARSHIP_CONF"
        cat "$LOCAL_DRACULA" >> "$STARSHIP_CONF"
      fi
  else
    echo "Copying Dracula Starship theme to $STARSHIP_CONF"
    cp "$LOCAL_DRACULA" "$STARSHIP_CONF"
  fi
else
  # If local theme not available, try best-effort download only when starship config missing
  if [ ! -f "$STARSHIP_CONF" ]; then
    echo "Downloading dracula/starship theme to $STARSHIP_CONF"
    curl -fsSL https://raw.githubusercontent.com/dracula/starship/master/starship.toml -o "$STARSHIP_CONF" || true
  else
    echo "No local Dracula theme available and $STARSHIP_CONF exists — leaving existing Starship config untouched."
  fi
fi

echo "Fish configuration, Fisher plugins and Starship (with Dracula theme) installation steps completed. You may need to restart your shell (exec fish) to load everything."
