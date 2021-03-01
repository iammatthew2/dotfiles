#!/bin/bash

# Git branch in prompt.
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \1/'
}

if [ "$(uname)" == "Darwin" ]; then
  export PS1='\[\e[1;32m\]\h\[\e[m\]\[\e[1;30m\]\w\[\e[m\]\[\e[1;35m\]$(parse_git_branch)\[\e[m\]\[\e[1;32m\]$\[\e[m\] '
elif [ -z "$RDEV_NAME" ]; then
  export PS1='\[\e[1;33m\]\h@\w${text}$\[\e[m\] '
else
  export PS1='\[\e[1;33m\]$RDEV_NAME@\w${text}$\[\e[m\] '
fi

export LSCOLORS=GxFxCxDxBxegedabagaced
export CLICOLOR=1

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

bind Space:magic-space

HISTFILESIZE=10000


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # load nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # load nvm bash_completion

##### scripts
source ~/dotfiles/scripts/git-completion.bash

# the z dir completion helper
. ~/dotfiles/scripts/z.sh


test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
