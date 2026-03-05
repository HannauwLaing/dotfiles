
NVM_HOME_CONFIG_FOLDER=~/.config/nvim
NVM_SRC=$(pwd)/bin/nvim_setup






NVM_CLONE_FOLDER=$NVM_SRC/repo
NVM_BUILD=$NVM_SRC/build
NVM_CONFIG=$NVM_SRC/config/nvim
NVM_REPO="https://github.com/neovim/neovim.git"
NVM_CONFIG_REPO="https://github.com/HannauwLaing/kickstart.nvim.git"

cd $NVM_SRC;
echo "[NEOVIM] Now cloning $NVM_REPO";

if [ -d "$NVM_CLONE_FOLDER" ]; then
    echo "[NEOVIM] Repo already exsists";
else
    echo "[NEOVIM] Start Cloning";
	# git clone $NVM_REPO $NVM_CLONE_FOLDER > /dev/null 2>&1
	# cd $NVM_CLONE_FOLDER;
	#
	#
	# make CMAKE_BUILD_TYPE=RelWithDebInfo > /dev/null 2>&1
	# make CMAKE_INSTALL_PREFIX=$NVM_BUILD install > /dev/null 2>&1
	#
fi
cd $NVM_SRC;
echo "[NEOVIM] Setting up Configrations";


if [ -d "$NVM_CONFIG" ]; then
    echo "[NEOVIM] Config already exsists, removing config";
	rm $NVM_CONFIG 
fi
echo "[NEOVIM] Linking Config now";
# echo "[NEOVIM] Linking from $NVM_HOME_CONFIG_FOLDER to $NVM_CONFIG";
# git clone $NVM_CONFIG_REPO $NVM_CONFIG > /dev/null 2>&1

ln -sfn $NVM_HOME_CONFIG_FOLDER $NVM_CONFIG;

if [ ":$PATH:" =~ ":$NVM_BUILD/bin:" ]; then
    echo "[NEOVIM] Export already contains bin"
else
    echo "[NEOVIM] Exporting bin/ to path now"
	export PATH="$NVM_BUILD/bin:$PATH"
	echo "[NEOVIM] New <PATH>: $PATH"
fi
echo "[NEOVIM] Now removing cloned repo";
rm -rf $NVM_CLONE_FOLDER;

echo "[NEOVIM] Finished setting up Neovim";

