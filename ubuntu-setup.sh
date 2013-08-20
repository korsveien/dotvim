#! /usr/bin/env sh

# Author: Nils Peder Korsveien
# Brief: downloads, compiles and sets up latest vim with all plugins
# Note: Must be run as sudo!
# Prerequisites: git

cd $HOME

if [[ -z $1 ]]; then
    echo $0 "<version for VIMRUNTIMEDIR>"
    exit 1
fi

# as of 20/08/13 21:13:49 this is 74 (7.4)
version=$1

rm $logfile
logfile=ubuntu-setup.log

#install prerequisites
sudo apt-get update
sudo apt-get -y install libncurses5-dev libgnome2-dev libgnomeui-dev \
libgtk2.0-dev libatk1.0-dev libbonoboui2-dev \
libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev ruby-dev \
mercurial 2>> $HOME/$logfile

if [[ $? != 0 ]]; then
    echo "Error during installation of prerequisties!"
    exit 1
fi

# uninstall previous versions of vim
sudo apt-get -y remove vim-tiny vim-common vim-gui-common \
vim vim-runtime gvim 2>> $HOME/$logfile

if [[ $? != 0 ]]; then
    echo "Error during uninstallation old vim!"
    exit 1
fi

# fetch the vim repo and compile the latest version
hg clone https://code.google.com/p/vim 2>> $HOME/$logfile
if [[ $? != 0 ]]; then
    echo "Error during cloning of vim repo!"
    exit 1
fi

cd vim
hg up tip
./configure --with-features=huge \
            --enable-rubyinterp \
            --enable-pythoninterp \
            --enable-perlinterp \
            --enable-luainterp \
            --enable-gui=gtk2 --enable-cscope --prefix=/usr 2>>\
$HOME/$logfile
if [[ $? != 0 ]]; then
    echo "Error during vim ./configure!"
    exit 1
fi

make VIMRUNTIMEDIR=/usr/share/vim/vim$version 2>> $HOME/$logfile
if [[ $? != 0 ]]; then
    echo "Error during make"
    exit 1
fi

sudo make install 2>> $HOME/$logfile
if [[ $? != 0 ]]; then
    echo "Error during make"
    exit 1
fi

cd $HOME
rm -rf vim

# make vim default system editor
sudo update-alternatives --install /usr/bin/editor editor /usr/bin/vim 1
sudo update-alternatives --set editor /usr/bin/vim
sudo update-alternatives --install /usr/bin/vi vi /usr/bin/vim 1
sudo update-alternatives --set vi /usr/bin/vim

ln -s .vim/vimrc $HOME/.vimrc
cd .vim

git clone https://git@github.com:gmarik/vundle.git $HOME/bundle/vundle \
2>> $HOME/$logfile
if [[ $? != 0 ]]; then
    echo "Error during cloning of Vundle repo!"
    exit 1
fi

# install all vim plugins using vundle
vim +BundleInstall +qall

# quick install ycm with semantic completion
cd bundle/YouCompleteMe/
./install.sh --clang-completer

cd $HOME
echo "Vim $version installation and setup completed successfully!"

