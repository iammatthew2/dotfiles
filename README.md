# Dotfiles: a set of public configs

This repository makes use of git sub-modules to pull in a few other repositories:
vim configs, vim modules and bash scripts

These dotfiles support:

* [bash](https://www.gnu.org/software/bash/)
* [vim](https://www.vim.org/)
* [tmux](https://github.com/tmux/tmux)
* [ripgrep](https://github.com/BurntSushi/ripgrep)
* [git](https://git-scm.com/docs/git-config)

---

## Setup

These dot files can be installed with with the included install script or manually

* Running the install script:
  * Clone the repo: `$ git clone --recursive https://github.com/iammatthew2/dotfiles.git`
  * Install: `$ cd dotfiles && . install.sh`

* Manual install:
  * Clone the repo: `$ git clone --recursive https://github.com/iammatthew2/dotfiles.git`
  * Create symlinks (see below)
  * Config changes to local .gitconfig settings (see below)


---

### Create symlinks

Run the following commands to add each of the symlinks:

* `$ ln -sf ~/dotfiles/zshrc ~/.zshrc`
* `$ ln -sf ~/dotfiles/bash_profile ~/.bash_profile`
* `$ ln -sf ~/dotfiles/tmux.conf ~/.tmux.conf`
* `$ ln -sf ~/dotfiles/ripgreprc ~/.ripgreprc`
* `$ ln -sf ~/dotfiles/vim ~/.vim`
* `$ ln -sf ~/dotfiles/vim-configs/vimrc ~/.vimrc`
* `$ ln -sf ~/dotfiles/zshrc ~/.zshrc`

### Add dotfile configs to your local .gitconfig

Add the gitignore settings dotfile to the local gitconfigs:

* `$ git config --global core.excludesfile ~/dotfiles/gitignore_global`

Add the git aliases to the local gitconfigs:

* `$ git config --global include.path ~/dotfiles/gitconfig`

---

## Notes on working with git submodules

On first install these notes below can be disregarded since we pull in the submodules in this repository via the `--recursive ` in the `git clone` command above. However, if/when this repository is updated with a new submodule (perhaps a vim module is added) or you add your own, then you would need to manually add the submodule as described below.

### Adding a new submodule

`$ git submdule add <gitPathHere> parentDirectory`

Example: `$ git submodule add https://github.com/rupa/z.git scripts/z `

### Doing a git pull and receiving a new submodule? You will need to init it

`$ git submodule update --init local/path/to/submodule/folder`
