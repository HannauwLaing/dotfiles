export DOT_FOLDER_DIR=$HOME/dotfiles

# If you come kkfrom bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$DOT_FOLDER_DIR/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="Hannauwstheme"
export ZSH_TMUX_AUTOSTART=true
export ZSH_TMUX_AUTOCONNECT=true

source $ZSH/oh-my-zsh.sh

zstyle ':omz:update' mode auto



alias zconfig="nvim $DOT_FOLDER_DIR/.rc_files/.zshrc"
alias hconfig="nvim $DOT_FOLDER_DIR/.source_files/helpcodes.sh"
alias tconfig="nvim $DOT_FOLDER_DIR/.rc_files/.tmux.conf"
alias nconfig="nvim $DOT_FOLDER_DIR/.nvim_config/nvim/init.lua"
#open tmux with old session
alias tx="if [[ -z $(tmux ls) ]]; then tmux; else tmux a; fi"
alias help="$DOT_FOLDER_DIR/.source_files/helpcodes.sh"
alias h="help"
alias reload="source ~/.zshrc;c;"
alias r="reload;"
# alias pj="cd ;cd ~/StelenboshYear2/Compsci244/Project/;"
# alias tu="cd ;cd ~/StelenboshYear2/Compsci244/CS244Tuts/;"
alias pushgit="ga .; gc -m \"Commit all\"; gp"
alias autogit="git add . ;git commit -m '$1'; git push;"
alias e="exit;"
alias eall="tmux detach"

alias c="clear"

# alias oneko="$DOT_FOLDER_DIR/oneko 0<&- >/dev/null 2>&1 & disown ;"
alias oneko="make -C ~/FunCodes/oneko/ all 0<&- >/dev/null 2>&1 & disown ;"
# alias killcat="pkill java_neko;c; echo \"Cats have been purged\""
alias killcat="pkill -f \"^java -cp bin NekoMain$\"; echo \"Cats have been purged\""
alias kc="killcat"
alias kcc="kc;c"
alias endlesskat="while true; do oneko; sleep 2; done;"
alias manykats="for i in {1..22}; do oneko; sleep 4; done;"
alias fewkats="for i in {1..11}; do oneko; sleep 8; done;"


alias funcode="cd ~/Onstartup/FunCode/;java FunWallPaper;cd;"
alias cmatrix="$DOT_FOLDER_DIR/cmatrix"
alias hackerman="cmatrix -b"

alias killses="tmux kill-session"

alias openNarga="ssh 27086534@open.rga.stb.sun.ac.za"
alias oN="openNarga"

alias gst="git fetch; git status;"
alias specs="neofetch"

alias ga="git add"
alias gc="git commit"
alias gp="git push"

# My own costomizations:

alias cbg="~/Onstartup/backgrounds/change-background.sh"


bindkey \^K kill-line


tmux() {
  if [ $# -eq 0 ]; then
	echo "Launching tmux, please wait"
    command tmux attach || command tmux
  else
	echo "Launching tmux, please wait"
    command tmux "$@"
  fi
}

# Some testing from ChadGPT

# _h_completion() {
#   local -a args
#   args=("arg1" "arg2" "arg3")  # Define the allowed arguments
#   _arguments '1:argument:(${args[@]})'
# }
#
# # Apply completion to both the script and alias
# compdef _h_completion h=~/Onstartup/helpcodes.sh
#




function rejbg() {
  # get the current picture-uri-dark (in single quotes), remove 'file://' and surrounding quotes
  local cur
  cur=$(gsettings get org.gnome.desktop.background picture-uri-dark \
        | sed -e "s/^'file:\/\///" -e "s/'$//")
  # move it into your “Rejected backgrounds” directory
  mv "$cur" "$HOME/Onstartup/backgrounds/RejectedWallpapers/"
  echo "Moved $cur to rejected backgrounds"
  cbg
}

. "$HOME/.local/bin/env"
