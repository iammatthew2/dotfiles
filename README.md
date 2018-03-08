Using git submodules to pull in nested git repos, including my personal
vim-configs and various thrid-party vim plugins

How to replicate this dotfiles setup on new machine:
git clone --recursive https://github.com/iammatthew2/dotfiles.git

Now commit those changes: then: git submodule add
https://github.com/iammatthew2/vim-configs vim-configs

Then, setup symlinks:
ln -sf ~/.dotfiles/bash_profile ~/.bash_profile
ln -sf ~/.dotfiles/gitconfig ~/.gitconfig
ln -sf ~/.dotfiles/gitignore_global ~/.gitignore_global
ln -sf ~/.dotfiles/screenrc ~/.screenrc
ln -sf ~/.dotfiles/tmux.conf ~/.tmux.conf
ln -sf ~/.dotfiles/vim-configs  ~/.vim
ln -sf ~/.dotfiles/vim-configs/vimrc ~/.vimrc

When initing, after init run git submodule update to get all the submodules
