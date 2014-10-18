#!/usr/bin/env sh

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

logfile=ubuntu-setup.log
rm $logfile

#install prerequisites
sudo apt-get update
sudo apt-get -y install libncurses5-dev libgnome2-dev libgnomeui-dev \
libgtk2.0-dev libatk1.0-dev libbonoboui2-dev \
libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev ruby-dev zsh \
mercurial cmake 2>> $HOME/$logfile

if [[ $? != 0 ]]; then
    echo -e "\e[00;31mError during installation of prerequisties!\e[00m"
    exit 1
fi

# uninstall previous versions of vim
sudo apt-get -y remove vim-tiny vim-common vim-gui-common \
vim vim-runtime gvim 2>> $HOME/$logfile

if [[ $? != 0 ]]; then
    echo -e "\e[00;31mError during uninstallation old vim!\e[00m"
    exit 1
fi

# fetch the vim repo and compile the latest version
rm -rf vim
hg clone https://code.google.com/p/vim 2>> $HOME/$logfile
if [[ $? != 0 ]]; then
    echo -e "\e[00;31mError during cloning of vim repo!\e[00m"
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
    echo -e "\e[00;31mError during vim ./configure!\e[00m"
    cd $HOME
    rm -rf vim
    exit 1
fi

make VIMRUNTIMEDIR=/usr/share/vim/vim$version 2>> $HOME/$logfile
if [[ $? != 0 ]]; then
    echo -e "\e[00;31mError during make\e[00m"
    cd $HOME
    rm -rf vim
    exit 1
fi

sudo make install 2>> $HOME/$logfile
if [[ $? != 0 ]]; then
    echo -e "\e[00;31mError during make\e[00m"
    cd $HOME
    rm -rf vim
    exit 1
fi

cd $HOME
rm -rf vim

# make vim default system editor
sudo update-alternatives --install /usr/bin/editor editor /usr/bin/vim 1
sudo update-alternatives --set editor /usr/bin/vim
sudo update-alternatives --install /usr/bin/vi vi /usr/bin/vim 1
sudo update-alternatives --set vi /usr/bin/vim

rm $HOME/.vimrc
ln -s .vim/vimrc $HOME/.vimrc
cd .vim

if [[ -d "$HOME/.vim/bundle/vundle" ]]; then
    echo -e "Moving existing vundle directory to vundle.old.."
    mv $HOME/.vim/bundle/vundle $HOME/.vim/bundle/vundle.old
fi
git clone https://github.com/gmarik/vundle.git $HOME/.vim/bundle/vundle \
2>> $HOME/$logfile
if [[ $? != 0 ]]; then
    echo -e "\e[00;31mError during cloning of Vundle repo!\e[00m"
    exit 0
fi

# install all vim plugins using vundle
vim +BundleInstall +qall

# quick install ycm with semantic completion
cd bundle/YouCompleteMe/
./install.sh --clang-completer

cd $HOME
echo -e "\e[00;32mVim $version installation and setup completed successfully!\e[00m"

