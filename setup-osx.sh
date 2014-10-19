#!/usr/bin/env sh

# Author: Nils Peder Korsveien
# Brief: downloads, compiles and sets up latest vim with all plugins
# Note: Must be run as sudo!
# Prerequisites: brew

cd $HOME
brew install git, vim
ln -s $HOME/.vim/vimrc $HOME/.vimrc

# install vundle
if [[ -d "$HOME/.vim/bundle/vundle" ]]; then
    echo -e "Moving existing vundle directory to vundle.old.."
    mv $HOME/.vim/bundle/vundle $HOME/.vim/bundle/vundle.old
fi
git clone https://github.com/gmarik/vundle.git $HOME/.vim/bundle/vundle
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
echo -e "\e[00;32mVim installation and setup completed successfully!\e[00m"

