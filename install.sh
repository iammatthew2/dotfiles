#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [[ -e ~/.bashrc ]];then
  mv ~/.bashrc ~/.bashrc.bak
fi
ln -sf ${BASEDIR}/bashrc ~/.bash_rc

if [[ -e ~/.tmux.conf ]];then
  mv ~/.tmux.conf ~/.tmux.conf.bak
fi
ln -sf ${BASEDIR}/tmux.conf ~/.tmux.conf

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

if [[ -e ~/.watchman-processor.config.js ]];then
  mv ~/.watchman-processor.config.js ~/.watchman-processor.config.js.bak
fi
ln -sf ${BASEDIR}/watchman-processor.config.js ~/.watchman-processor.config.js

#Add the gitignore settings dotfile to the local gitconfigs:
git config --global core.excludesfile ${BASEDIR}/gitignore_global

#Add the git aliases to the local gitconfigs:
git config --global include.path ${BASEDIR}/gitconfig
