#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

ln -sf ${BASEDIR}/bash_profile ~/.bash_profile
ln -sf ${BASEDIR}/tmux.conf ~/.tmux.conf
ln -sf ${BASEDIR}/ripgreprc ~/.ripgreprc
ln -sf ${BASEDIR}/vim ~/.vim
ln -sf ${BASEDIR}/vim/vimrc ~/.vimrc
ln -sf ${BASEDIR}/zshrc ~/.zshrc

#Add the gitignore settings dotfile to the local gitconfigs:
git config --global core.excludesfile ${BASEDIR}/gitignore_global

#Add the git aliases to the local gitconfigs:
git config --global include.path ${BASEDIR}/gitconfig
