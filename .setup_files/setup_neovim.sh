

NVM_SRC=$(pwd)
NVM_BUILD=$NVM_SRC/neovim_build
mkdir -p $NVM_BUILD
git clone https://github.com/neovim/neovim.git
cd neovim


make CMAKE_BUILD_TYPE=RelWithDebInfo 
make CMAKE_INSTALL_PREFIX=$NVM_BUILD install
export PATH="$NVM_BUILD/bin:$PATH"

