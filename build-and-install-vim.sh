#!/usr/bin/env bash

# remove vim
sudo apt remove \
    vim \
    vim-runtime \
    gvim

# install prereqs

sudo apt install \
    libncurses5-dev \
    libgnome2-dev \
    libgnomeui-dev \
    libgtk2.0-dev \
    libatk1.0-dev \
    libbonoboui2-dev \
    libcairo2-dev \
    libx11-dev \
    libxpm-dev \
    libxt-dev \
    python-dev \
    python3-dev \
    ruby-dev \
    lua5.1 \
    liblua5.1-dev \
    libperl-dev \
    git \
    checkinstall

echo "Verify python2 configuration is in /usr/lib/python2.7/config-x86_64-linux-gnu"
echo "If it is not then stop the script and change --with-python-config-dir option"
echo "Verify python3 configuration is in /usr/lib/python3.7m/config-3.7m-x86_64-linux-gnu"
echo "If it is not then stop the scrtop and change --with-python3-config-dir"
read -n 1 -p "Press Enter to continue or Ctrl-C to stop"

# Create installation directory
mkdir -p $HOME/.local/vim

#install vim
cd /tmp
git clone https://github.com/vim/vim.git
cd vim
./configure --with-features=huge \
            --enable-multibyte \
	    --enable-rubyinterp=yes \
	    --enable-pythoninterp=yes \
	    --with-python-config-dir=/usr/lib/python2.7/config-x86_64-linux-gnu \ # pay attention here check directory correct
	    --enable-python3interp=yes \
	    --with-python3-config-dir=/usr/lib/python3.7m/config-x86_64-linux-gnu \
	    --enable-perlinterp=yes \
	    --enable-luainterp=yes \
            --enable-gui=gtk2 \
            --enable-cscope \
	    --prefix=$HOME/.local/opt/vim

make
make install DESTDIR=$HOME/.local/opt/vim

# Set vim as your default editor with update-alternatives
sudo update-alternatives --install /usr/bin/editor editor $HOME/.local/opt/vim/usr/local/bin/vim 1
sudo update-alternatives --set editor $HOME/.local/opt/vim/usr/local/bin/vim
sudo update-alternatives --install /usr/bin/vi vi $HOME/.local/opt/vim/usr/local/bin/vim 1
sudo update-alternatives --set vi $HOME/.local/opt/vim/usr/local/bin/vim
sudo update-alternatives --install /usr/bin/vim vim $HOME/.local/opt/vim/usr/local/bin/vim 1
sudo update-alternatives --set vim $HOME/.local/opt/vim/usr/local/bin/vim
