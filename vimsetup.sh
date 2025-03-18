# Remove any previous neovim version
sudo apt remove neovim neovim-runtime

# Download build tools
sudo apt-get install ninja-build gettext cmake curl build-essential libreadline-dev unzip

# Build neovim from source
mkdir neovim-src && cd $_
git clone https://github.com/neovim/neovim
cd neovim
make CMAKE_BUILD_TYPE=RelWithDebInfo
cd build && cpack -G DEB && sudo dpkg -i nvim-linux-x86_64.deb
cd ~
rm -rf ~/neovim-src

# Install Lua from source
mkdir luarocks && cd &_
LUA_ZIP=lua-5.4.7
wget https://www.lua.org/ftp/$LUA_ZIPlua-5.4.7.tar.gz
tar -xvzf $LUA_ZIP.tar.gz
cd $LUA_ZIP
make all test
sudo make install

#Install LuaRocks
LUA_ROCKS_ZIP=luarocks-3.11.1
cd ~/luarocks
wget https://luarocks.github.io/luarocks/releases/$LUA_ROCKS_ZIP.tar.gz
tar -xvzf $LUA_ROCKS_ZIP.tar.gz
cd $LUA_ROCKS_ZIP
./configure --with-lua-include=/usr/local/include \
make
sudo make install
cd ~
rm -rf ~/luarocks


#Install NvimChad
git clone https://github.com/NvChad/starter ~/.config/nvim && nvim
