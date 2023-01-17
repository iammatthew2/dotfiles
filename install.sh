#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [[ -e ~/.bashrc ]];then
  mv ~/.bashrc ~/.bashrc.bak
fi
ln -sf ${BASEDIR}/bashrc ~/.bashrc

# if [[ -e ~/.tmux.conf ]];then
#   mv ~/.tmux.conf ~/.tmux.conf.bak
# fi
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

# handle zsh plugins & themes
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/sindresorhus/pure.git "$HOME/.zsh/pure"

ln -sf ${BASEDIR}/watchman-processor.config.js ~/.watchman-processor.config.js

#Add the gitignore settings dotfile to the local gitconfigs:
git config --global core.excludesfile ${BASEDIR}/gitignore_global

#Add the git aliases to the local gitconfigs:
git config --global include.path ${BASEDIR}/gitconfig
