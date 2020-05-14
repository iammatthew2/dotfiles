#!/bin/bash

# include bash_zsh_common if it exists
if [ -f ~/.dotfiles/bash_zsh_common ]; then
   . ~/.dotfiles/bash_zsh_common
fi

# Git branch in prompt.
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \1/'
}

if [ "$(uname)" == "Darwin" ]; then
  export PS1='\[\e[1;32m\]\h\[\e[m\]\[\e[1;30m\]\w\[\e[m\]\[\e[1;35m\]$(parse_git_branch)\[\e[m\]\[\e[1;32m\]$\[\e[m\] '
else
  export PS1='\[\e[1;33m\]\h@\w${text}$\[\e[m\] '
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
source ~/.dotfiles/scripts/git-completion.bash

# the z dir completion helper
. ~/.dotfiles/scripts/z/z.sh
export VOLTA_HOME="/Users/mvillene/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

