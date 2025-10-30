

NVM_SRC=$(pwd)
NVM_BUILD=$NVM_SRC/neovim_build
NVM_CONFIG=$NVM_SRC/bin/.nvim_config/nvim
mkdir -p $NVM_BUILD
echo "Looking to clone now $NVM_CONFIG"
if [[ ":$PATH:" =~ ":$NVM_BUILD/bin:" ]]; then
    echo "No need to export"
else
    echo "Exporting bin now"
	git clone https://github.com/neovim/neovim.git
	cd neovim


	make CMAKE_BUILD_TYPE=RelWithDebInfo 
	make CMAKE_INSTALL_PREFIX=$NVM_BUILD install
	export PATH="$NVM_BUILD/bin:$PATH"
	
	# ln -sf $NVM_CONFIG ~/.config/nvim
fi


