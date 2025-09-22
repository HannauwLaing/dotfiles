SRC = $(PWD)
BIN = $(SRC)/bin



all: clean setup_zsh setup_neovim setup_rc_files 
	echo "Setup Complete"

clean:
	rm -rf $(BIN)

make_bin:
	mkdir -p $(BIN)

setup_rc_files:
	cp $(SRC)/.setup_files/dotfiles_setup.sh $(SRC)/
	$(SRC)/.setup_files/dotfile_setup.sh
	rm dotfiles_setup.sh

setup_neovim: make_bin
	cp $(SRC)/.setup_files/setup_neovim.sh $(BIN)
	cd $(BIN); $(BIN)/setup_neovim.sh
	
setup_zsh: make_bin
	echo "Setup automatic oh-my-zsh config"
