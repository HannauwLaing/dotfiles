#!/usr/bin/env bash
set -euo pipefail


REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
REPO_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"


git -C $REPO_DIR submodule update --init --recursive

# git clone --recurse-submodules https://github.com/HannauwLaing/dotfiles.git

cp $REPO_DIR/.source_files/Hannauwstheme.zsh-theme $REPO_DIR/.oh-my-zsh/custom/themes

backup() {
  local path="$1"
  # If it doesn't exist → nothing to do
  [ -e "$path" ] || [ -L "$path" ] || return 0
  
  # If it's a symlink → skip
  if [ -L "$path" ]; then
    rm "$path"
    return 0
  fi
  # Otherwise back it up
  mv "$path" "$path.bak.$(date +%s)"
  mkdir -p "$(dirname "$2")"
}
check_src_files() {
# This is done manually cause I cant be bothered

  files=( "$HOME/.bashrc" "$HOME/.zshrc" "$HOME/.tmux.conf" )

  for f in "${files[@]}"; do
    if [ -e "$f" ] || [ -L "$f" ]; then   # catches broken symlinks too
      rm -f "$f"
      echo "Removed $f"
    else
      echo "Missing $f (skip)"
    fi
  done 
}

link_files() {
	echo "Linked $1 to $2"
  ln -sfn $1 "$2"
}

# Where things should live on the target machine
NVIM_SRC="$REPO_DIR/.nvim_config/nvim"
NVIM_DST="$HOME/.config/nvim"
backup "$NVIM_DST"
link_files "$NVIM_SRC" "$NVIM_DST"

# .zshrc links to inside the dotfiles folder so not needed
# OHZ_SRC="$REPO_DIR/.oh-my-zsh"
# OHZ_DST="$HOME"
# link_files "$OHZ_SRC" "$OHZ_DST"


RC_SRC="$REPO_DIR/.rc_files/.*"
RC_DST="$HOME"
check_src_files
link_files "$RC_SRC" "$RC_DST"



TMUX_SRC="$REPO_DIR/.tmux"
TMUX_DST="$HOME"
get_tmux_plugins() {
  grep -oE "@plugin +'[^']+'" $REPO_DIR/.rc_files/.tmux.conf \
  | awk -F"'" '{print $2}' \
  | while read repo; do
      name=$(basename "$repo")
      git clone "https://github.com/$repo.git" "$HOME/.tmux/plugins/$name"
    done
}
mkdir -p "$TMUX_DST"
get_tmux_plugins
# backup "$TMUX_DST"
# link_files "$TMUX_SRC" "$TMUX_DST"


BG_SRC="$REPO_DIR/.background_files"
./$BG_SRC/DownloadAllImages.sh
# BG_DST="$HOME/.background"
# mkdir -p "$BG_DST"
# link_files "$BG_SRC" "$BG_DST"







