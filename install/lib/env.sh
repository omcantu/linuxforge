#!/usr/bin/env bash
# idempotent environment helpers for linuxforge
if [[ "${linuxforge_ENV_LOADED:-}" == "1" ]]; then
  return 0
fi
export linuxforge_ENV_LOADED=1
source ~/.local/share/linuxforge/install/lib/pkg_manager_functions.sh

# Desktop/session detection
export linuxforge_DE="${XDG_CURRENT_DESKTOP:-}"
export linuxforge_SESSION_TYPE="${XDG_SESSION_TYPE:-}"

# helper to check command availability
require_cmd() {
  command -v "$1" >/dev/null 2>&1 || return 1
}

installYay() {
    case "$PKG_MGR" in
        pacman)
            if ! command -v yay >/dev/null 2>&1; then
                run_pkg_mgr install base-devel git
                cd /opt && "$ESCALATION_TOOL" git clone https://aur.archlinux.org/yay-bin.git && "$ESCALATION_TOOL" chown -R "$USER": ./yay-bin
                cd yay-bin && makepkg --noconfirm -si
            fi
            ;;
        *)
            echo "installYay Warning : no supported package manager found (pacman, dnf or apt)"
            return 1
            ;;
    esac
}

if command -v dnf >/dev/null 2>&1; then
    PKG_MGR=dnf
    OS_NAME="Fedora"
elif command -v apt >/dev/null 2>&1; then
    PKG_MGR=apt
    OS_NAME="Ubuntu"
elif command -v pacman >/dev/null 2>&1; then
    PKG_MGR=pacman
    OS_NAME="Arch"
    installYay
else
    echo "Warning : no supported package manager found (pacman, dnf or apt)"
    return 1
fi
export PKG_MGR

return 0
