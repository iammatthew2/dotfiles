Dotfiles: a set of public configs
====

This repo makes use of git submodules to pull in a few other repos: 
vim configs, vim modules and bash scripts

## Setup
You are going to need to: git clone, create the symlinks, and add dotfile configs to local .gitconfig. See details below.

### Install:
`$ git clone --recursive https://github.com/iammatthew2/dotfiles.git`

### Setup symlinks:
* `$ ln -sf ~/.dotfiles/bash_profile ~/.bash_profile`
* `$ ln -sf ~/.dotfiles/screenrc ~/.screenrc`
* `$ ln -sf ~/.dotfiles/tmux.conf ~/.tmux.conf`
* `$ ln -sf ~/.dotfiles/vim-configs  ~/.vim`
* `$ ln -sf ~/.dotfiles/vim-configs/vimrc ~/.vimrc`

### Add dotfile configs to your local .gitconfig:
* `$ git config --global core.excludesfile ~/.dotfiles/gitignore_global`
* `$ git config --global include.path ~/.dotfiles/gitconfig`

## Working with git submodules
### Adding a new submodule?

`$ git submdule add <gitPathHere> parentDirectory`

Example: `$ git submodule add https://github.com/rupa/z.git scripts/z `

### Doing a git pull and receiving a new submodule? You will need to init it:
`$ git submodule update --init local/path/to/submodule/folder`
