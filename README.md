Using git submodules to pull in nested git repos, including my personal
vim-configs and various thrid-party vim plugins

How to replicate this dotfiles setup on new machine:
git clone --recursive https://github.com/username/reponame.git

^ can also be used to pull in a mid-level nested repo, such as vim-configs

Now commit those changes: then: git submodule add
https://github.com/iammatthew2/vim-configs vim-configs

Then, setup symlinks:
ln -sf ~/.dotfiles/bash_profile ~/.bash_profile
ln -sf ~/.dotfiles/gitconfig ~/.gitconfig
ln -sf ~/.dotfiles/screenrc ~/.screenrc
ln -sf ~/.dotfiles/vim-configs  ~/.vim
ln -sf ~/.dotfiles/vim-configs/vimrc ~/.vimrc
