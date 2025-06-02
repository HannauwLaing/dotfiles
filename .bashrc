export DOT_FOLDER_DIR=$HOME/dotfiles
# ^ This line must stay on top

ln -s $DOT_FOLDER_DIR/.bashrc $HOME/
ln -s $DOT_FOLDER_DIR/.tmux $HOME/
ln -s $DOT_FOLDER_DIR/.tmux.conf $HOME/

ln -s $DOT_FOLDER_DIR/nvim $HOME/.config/
# $DOT_FOLDER_DIR/zsh
# exit

