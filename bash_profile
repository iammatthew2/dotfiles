export PS1='\[\e[1;32m\]mac@\w${text}$\[\e[m\] '
export LSCOLORS=GxFxCxDxBxegedabagaced
export CLICOLOR=1
export NVM_DIR="$HOME/.nvm"

HISTFILESIZE=10000

source ~/.dotfiles/scripts/git-completion.bash

# include bash_aliases if it exists
if [ -f ~/.dotfiles/bash_aliases ]; then
    . ~/.dotfiles/bash_aliases
fi

# include bashrc_methods if it exists
if [ -f ~/.dotfiles/bash_methods ]; then
    . ~/.dotfiles/bash_methods
fi

# incluse bash_private if it exists
if [ -f ~/.dotfiles/bash_private ]; then
   . ~/.dotfiles/bash_private
fi

bind Space:magic-space
