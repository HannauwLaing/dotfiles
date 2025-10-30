SRC = $(PWD)
BIN = $(SRC)/bin


usage:
	echo "Usage: make <all,clean,setup_rc,setup_zsh,setup_neovim> "

all: clean setup_zsh setup_neovim setup_rc
	echo "Setup Complete"

clean:
	rm -rf $(BIN)

_make_bin:
	mkdir -p $(BIN)

setup_rc:
	cp $(SRC)/.setup_files/dotfile_setup.sh $(SRC)/
	$(SRC)/dotfile_setup.sh
	rm dotfile_setup.sh

setup_neovim: _make_bin
	cp $(SRC)/.setup_files/setup_neovim.sh $(BIN)
	cd $(BIN); $(BIN)/setup_neovim.sh
	
	
setup_zsh: _make_bin
	echo "TODO Setup automatic oh-my-zsh source install and config"
	# Only do font setup here
	cp $(SRC)/.setup_files/setup_zsh.sh $(BIN)
	cd $(BIN); $(BIN)/setup_zsh.sh

setup_background_changer: _make_bin
	cp $(SRC)/.setup_files/setup_zsh.sh $(BIN)
