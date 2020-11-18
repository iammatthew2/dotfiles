# Dotfiles: a set of public configs

These dotfiles support:

* [bash](https://www.gnu.org/software/bash/)
* [vim](https://www.vim.org/)
* [tmux](https://github.com/tmux/tmux)
* [ripgrep](https://github.com/BurntSushi/ripgrep)
* [git](https://git-scm.com/docs/git-config)

## Setup

These dot files can be installed with with the included install script or manually

* Running the install script:
  * Clone this repo
  * Install: `$ cd dotfiles && . install.sh`

* Manual install:
  * Clone the repo: `$ git clone https://github.com/iammatthew2/dotfiles.git`
  * Create symlinks (see below)
  * Config changes to local .gitconfig settings (see below)

### Create symlinks

Run the following commands to add each of the symlinks:

* `$ ln -sf ~/dotfiles/zshrc ~/.zshrc`
* `$ ln -sf ~/dotfiles/bash_profile ~/.bash_profile`
* `$ ln -sf ~/dotfiles/tmux.conf ~/.tmux.conf`
* `$ ln -sf ~/dotfiles/ripgreprc ~/.ripgreprc`
* `$ ln -sf ~/dotfiles/vim ~/.vim`
* `$ ln -sf ~/dotfiles/vim/vimrc ~/.vimrc`

### Add dotfile configs to your local .gitconfig

Add the gitignore settings dotfile to the local gitconfigs:

* `$ git config --global core.excludesfile ~/dotfiles/gitignore_global`

Add the git aliases to the local gitconfigs:

* `$ git config --global include.path ~/dotfiles/gitconfig`

