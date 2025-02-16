#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [[ -e ~/.bashrc ]];then
  mv ~/.bashrc ~/.bashrc.bak
fi
ln -sf ${BASEDIR}/bashrc ~/.bashrc

if [[ -e ~/.ripgreprc ]];then
  mv ~/.ripgreprc ~/.ripgreprc.bak
fi
ln -sf ${BASEDIR}/ripgreprc ~/.ripgreprc

if [[ -e ~/.vim ]];then
  mv ~/.vim ~/.vim.bak
fi
ln -sf ${BASEDIR}/vim ~/.vim

if [[ -e ~/.vimrc ]];then
  mv ~/.vimrc ~/.vimrc.bak
fi
ln -sf ${BASEDIR}/vim/vimrc ~/.vimrc

if [[ -e ~/.zshrc ]];then
  mv ~/.zshrc ~/.zshrc.bak
fi
ln -sf ${BASEDIR}/zshrc ~/.zshrc

#Add the gitignore settings dotfile to the local gitconfigs:
git config --global core.excludesfile ${BASEDIR}/gitignore_global

#Add the git aliases to the local gitconfigs:
git config --global include.path ${BASEDIR}/gitconfig
