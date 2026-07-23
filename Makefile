SRC = $(PWD)
BIN = $(SRC)/bin


# TODO:
# make oneko compile from git repo & change .zshrc
#
# Compile zsh and oh-my-zsh into bin
#
#
# cmatrix setup


usage:
	@echo "";
	@echo "Usage: make <all,clean,setup_rc,setup_zsh,setup_neovim> ";

all: clean default setup_zsh setup_neovim setup_rc
	@echo "Setup Complete"

default:
	sudo apt-get update

clean:
	rm -rf $(BIN)

_make_bin:
	mkdir -p $(BIN)

setup_rc: default 
	ln -sfn $(SRC)/.setup_files/dotfile_setup.sh $(SRC)/; \
	chmod +x $(SRC)/dotfile_setup.sh ; \
	$(SRC)/dotfile_setup.sh
	rm $(SRC)/dotfile_setup.sh

setup_neovim: _make_bin default 
	echo "Installing dependents"
	sudo apt install -y cmake
	echo "Seting up neovim"
	ln -sfn $(SRC)/.setup_files/setup_neovim.sh $(BIN)/setup_neovim.sh ; \
	ln -sfn $(SRC)/.nvim_config/nvim ~/.config/nvim; \
	chmod +x $(BIN)/setup_neovim.sh; \
	$(BIN)/setup_neovim.sh; \
	
	
setup_zsh: _make_bin default 
	echo "TODO Setup automatic oh-my-zsh source install and config"
	sudo apt install -y zsh
	sudo apt install -y curl
	# Only do font setup here
	ln -sfn $(SRC)/.setup_files/setup_zsh.sh $(BIN)
	ln -sfn $(SRC)/.source_files/env $(BIN)

	cd $(BIN); $(BIN)/setup_zsh.sh

setup_background_changer: _make_bin default 
	ln -sfn $(SRC)/.setup_files/setup_background_changer.sh $(BIN); \
	chmod +x $(BIN)/setup_background_changer.sh; \
	$(BIN)/setup_background_changer.sh

setup_oneko: REPO_URL := https://github.com/HannauwLaing/oneko.git
setup_oneko: BIN_DIR  := $(shell pwd)/bin
setup_oneko: REPO_DIR := $(shell pwd)/bin/oneko
setup_oneko: _make_bin default
	# REPO_URL := https://github.com/HannauwLaing/oneko.git
	# BIN_DIR := "$(shell pwd)/bin"
	# REPO_DIR := "$(BIN_DIR)/oneko"
	@mkdir -p "$(REPO_DIR)"
	@if [ ! -d "$(REPO_DIR)/.git" ]; then \
		echo "[Oneko] Cloning repo -> $(REPO_DIR)"; \
		git clone --depth=1 "$(REPO_URL)" "$(REPO_DIR)"; \
		echo "[Oneko] Running make compile"; \
		$(MAKE) -C "$(REPO_DIR)" compile; \
		echo "[Oneko] Done."; \
	else \
		echo "[Oneko] Already Cloned"; \
		echo "[Oneko] Done."; \
	fi
