#!/usr/bin/env bash
# idempotent environment helpers for linuxforge
if [[ "${linuxforge_ENV_LOADED:-}" == "1" ]]; then
  return 0
fi
export linuxforge_ENV_LOADED=1

# Desktop/session detection
export linuxforge_DE="${XDG_CURRENT_DESKTOP:-}"
export linuxforge_SESSION_TYPE="${XDG_SESSION_TYPE:-}"

if command -v dnf >/dev/null 2>&1; then
    PKG_MGR=dnf
    OS_NAME="Fedora"
elif command -v apt >/dev/null 2>&1; then
    PKG_MGR=apt
    OS_NAME="Ubuntu"
else
    echo "Warning : no supported package manager found (dnf or apt)"
    return 1
fi
export PKG_MGR
# helper to run package manager safely
run_pkg_mgr() {
  if [[ -z "$PKG_MGR" ]]; then
    echo "Warning: no package manager available; skipping: $*"
    return 1
  fi
  sudo "$PKG_MGR" "$@"
}

# helper to check command availability
require_cmd() {
  command -v "$1" >/dev/null 2>&1 || return 1
}

return 0
