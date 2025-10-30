SRC = $(PWD)
BIN = $(SRC)/bin


usage:
	echo "Usage: \"make all\" "

all: clean setup_zsh setup_neovim setup_rc_files 
	echo "Setup Complete"

clean:
	rm -rf $(BIN)

make_bin:
	mkdir -p $(BIN)

setup_rc_files:
	cp $(SRC)/.setup_files/dotfile_setup.sh $(SRC)/
	$(SRC)/dotfile_setup.sh
	rm dotfile_setup.sh

setup_neovim: make_bin
	cp $(SRC)/.setup_files/setup_neovim.sh $(BIN)
	cd $(BIN); $(BIN)/setup_neovim.sh
	
	
setup_zsh: make_bin
	echo "TODO Setup automatic oh-my-zsh source install and config"
	# Only do font setup here
	cp $(SRC)/.setup_files/setup_zsh.sh $(BIN)
	cd $(BIN); $(BIN)/setup_zsh.sh

setup_background_changer: make_bin
	cp $(SRC)/.setup_files/setup_zsh.sh $(BIN)
