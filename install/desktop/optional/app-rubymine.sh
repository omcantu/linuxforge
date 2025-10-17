#!/bin/bash
source ~/.local/share/omakub/install/lib/env.sh
  # Define the download URL for the latest RubyMine release.
  # You might need to check JetBrains' website for the most recent version.
  RUBYMINE_VERSION="2025.2.2"  # Example version
  DOWNLOAD_URL="https://download.jetbrains.com/ruby/RubyMine-${RUBYMINE_VERSION}.tar.gz"
  INSTALL_DIR="/opt"
  RUBYMINE_DIR="RubyMine-${RUBYMINE_VERSION}"

  # Check for root privileges
  if [[ $EUID -ne 0 ]]; then
    echo "This script must be run with sudo or as root."
    exit 1
  fi

  echo "🚀 Downloading RubyMine..."
  wget -q --show-progress "$DOWNLOAD_URL" -P /tmp/

  # Check if the download was successful
  if [ ! -f "/tmp/RubyMine-${RUBYMINE_VERSION}.tar.gz" ]; then
      echo "❌ Download failed. Exiting."
      exit 1
  fi

  echo "📦 Extracting RubyMine to $INSTALL_DIR..."
  # The --strip-components=1 option removes the top-level directory from the tarball
  sudo tar -xzf "/tmp/RubyMine-${RUBYMINE_VERSION}.tar.gz" -C "$INSTALL_DIR" --strip-components=1

  # Check if extraction was successful and the directory exists
  if [ ! -d "$INSTALL_DIR/bin" ]; then
      echo "❌ Extraction failed or directory structure is incorrect. Exiting."
      exit 1
  fi

  echo "🧹 Cleaning up downloaded archive..."
  rm "/tmp/RubyMine-${RUBYMINE_VERSION}.tar.gz"

  echo "✅ RubyMine installed successfully to $INSTALL_DIR."
  echo "You can now run it by executing: $INSTALL_DIR/bin/rubymine.sh"

  echo "Creating a symlink for easy access..."
  # Create a symlink in a directory that is in the user's PATH
  sudo ln -sf "$INSTALL_DIR/bin/rubymine.sh" "/usr/local/bin/rubymine"

  echo "✅ Symbolic link created. You can now run 'rubymine' from any terminal."
fi
