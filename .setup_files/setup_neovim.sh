

NVM_SRC=$(pwd)

git clone https://github.com/neovim/neovim.git
cd neovim

# make CMAKE_BUILD_TYPE=RelWithDebInfo
#
# sudo make install



mkdir -p build
cd build
cmake .. -DCMAKE_INSTALL_PREFIX=$HOME/.local/nvim

make CMAKE_BUILD_TYPE=RelWithDebInfo 
make install
export PATH="$HOME/.local/nvim/bin:$PATH"

