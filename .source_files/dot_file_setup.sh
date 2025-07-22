#!/usr/bin/env bash
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"


backup() {
  local path="$1"
  # If it doesn't exist → nothing to do
  [ -e "$path" ] || [ -L "$path" ] || return 0
  
  # If it's a symlink → skip
  if [ -L "$path" ]; then
    return 0
  fi
  # Otherwise back it up
  mv "$path" "$path.bak.$(date +%s)"
}

link_files() {
  backup "$2"
  mkdir -p "$(dirname "$2")"
  ln -sfn "$1" "$2"
}

# Where things should live on the target machine
NVIM_SRC="$REPO_DIR/.nvim_config/nvim"
NVIM_DST="$HOME/.config/nvim"
link_files "$NVIM_SRC" "$NVIM_DST"

# .zshrc links to inside the dotfiles folder so not needed
# OHZ_SRC="$REPO_DIR/.oh-my-zsh"
# OHZ_DST="$HOME/.oh-my-zsh"
# link_files "$OHZ_SRC" "$OHZ_DST"


RC_SRC="$REPO_DIR/.rc_files"
RC_DST="$HOME"
link_files "$RC_SRC" "$RC_DST"

