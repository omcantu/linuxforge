#!/bin/bash

# ==============================================================================
# Package Manager Helper Function (run_pkg_mgr)
#
# This function standardizes package manager commands across:
# - Ubuntu/Debian (apt)
# - Fedora/RHEL (dnf)
# - Arch (pacman)
#
# It automatically inserts the necessary flags for non-interactive execution
# and translates common subcommands (install, remove, update) into distribution-
# specific syntax while ensuring idempotent operation where possible.
#
# Usage: run_pkg_mgr <subcommand> [package1] [package2]...
# Example: run_pkg_mgr install git nano
# Example: run_pkg_mgr update
# ==============================================================================

run_pkg_mgr() {
  # 1. Check if the package manager variable is set
  if [[ -z "$PKG_MGR" ]]; then
    echo "Warning: PKG_MGR environment variable is empty. Skipping command: $*" >&2
    return 1
  fi

  # Extract the subcommand (e.g., 'install', 'remove', 'update')
  local subcommand="$1"
  # Shift the arguments so that "$@" now contains only the packages/arguments
  shift

  case "$PKG_MGR" in
    "apt"|"dnf")
      # For apt and dnf, the subcommands are standardized (install, remove, etc.)
      # and they both use the '-y' flag for non-interactive mode.
      echo "--> Running: sudo $PKG_MGR -y $subcommand $*"
      sudo $PKG_MGR -y $subcommand "$@"
      ;;

    "pacman")
      local pacman_flag=""
      local install_extras="" # Variable to hold flags like --needed

      case "$subcommand" in
        "install"|"i")
          # Pacman uses -S for sync/install
          pacman_flag="-S"
          # Add --needed to skip re-installation of packages already up-to-date.
          install_extras="--needed"
          ;;
        "remove"|"r")
          # Pacman uses -R for remove
          pacman_flag="-R"
          ;;
        "update"|"upgrade")
          # Pacman full system update is -Syu
          pacman_flag="-Syu"
          # Ensure packages are ignored for a full update command
          set -- # Clear all positional parameters to ensure only -Syu runs
          ;;
        *)
          # Fallback for unrecognized subcommands
          echo "Error: Unsupported pacman subcommand translation: $subcommand." >&2
          return 1
          ;;
      esac
      
      # The pacman command is constructed using the non-interactive flag,
      # any necessary extra flags (like --needed), the main command flag, and the package list.
      echo "--> Running: sudo pacman --noconfirm $install_extras $pacman_flag $*"
      sudo pacman --noconfirm $install_extras $pacman_flag "$@"
      ;;

    *)
      # Handle any other unrecognized package managers
      echo "Error: Unknown package manager: $PKG_MGR" >&2
      return 1
      ;;
  esac
}

# ------------------------------------------------------------------------------
# Example Usage (Uncomment to test):
# ------------------------------------------------------------------------------
# # Simulate an Ubuntu environment
# PKG_MGR="apt"
# echo "--- Testing on simulated $PKG_MGR ---"
# run_pkg_mgr update
# run_pkg_mgr install vim
# 
# # Simulate an Arch environment (Now includes --needed automatically for installs)
# PKG_MGR="pacman"
# echo "--- Testing on simulated $PKG_MGR ---"
# run_pkg_mgr update
# run_pkg_mgr install htop
# 
# # Simulate a Fedora environment
# PKG_MGR="dnf"
# echo "--- Testing on simulated $PKG_MGR ---"
# run_pkg_mgr update
# run_pkg_mgr remove nano
