#!/bin/bash

# change shell to zsh
if which zsh > /dev/null; then
  export SHELL=/usr/bin/zsh
  exec /usr/bin/zsh -l
fi

# include bash_zsh_common if it exists
if [ -f ~/dotfiles/bash_zsh_common ]; then
   . ~/dotfiles/bash_zsh_common
fi

if [ "$(uname)" == "Darwin" ]; then
  export PS1='\[\e[1;32m\]\h\[\e[m\]\[\e[1;30m\]\w\[\e[m\]\[\e[1;35m\]$\[\e[m\]\[\e[1;32m\]\[\e[m\] '
elif [ -z "$RDEV_NAME" ]; then
  export PS1='\[\e[1;33m\]\h@\w$\[\e[m\] '
else
  export PS1='\[\e[1;33m\]$RDEV_NAME@\w$\[\e[m\] '
fi

export LSCOLORS=GxFxCxDxBxegedabagaced
export CLICOLOR=1

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

HISTFILESIZE=10000


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # load nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # load nvm bash_completion

##### scripts
source ~/dotfiles/scripts/git-completion.bash


test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
