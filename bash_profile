if [ "$(uname)" == "Darwin" ]; then
  export PS1='\[\e[1;32m\]mac@\w${text}$\[\e[m\] '
else
  export PS1='\[\e[1;33m\]\h@\w${text}$\[\e[m\] '
fi
export LSCOLORS=GxFxCxDxBxegedabagaced
export CLICOLOR=1

##### general settings (methods and aliases go below)
# include bash_private if it exists
if [ -f ~/.dotfiles/bash_private ]; then
   . ~/.dotfiles/bash_private
fi

bind Space:magic-space
HISTFILESIZE=10000

source ~/.dotfiles/scripts/git-completion.bash

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # load nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # load nvm bash_completion

##### methods
##call gitFind with an argument to search for in addition to your user name
gitFind() {
  if [ ! -z $1 ]
  then
    git log --pretty=format:'%C(red black)%h%Creset %s %C(yellow black)%an' | grep -i  "${2-Matthew}" | grep -i "$1"
  else
    echo "one or two arguments required: gitFind <query> or gitFind <query1> <query2>/n
    If only one argument, second argument is defaulted to 'Matthew'"
  fi
}

##get info on port 9000 or some other specified port
port() {
  echo "Running lsof -n -iTCP: on ports 9000 thru 9005"
  for i in {9000..9005} 
    do
      echo "Port $i: $(lsof -n -iTCP:$i)"
    # alternative command - might be more redhat friendly: lsof -n -iTCP:$i
    done
}

##### aliases
alias evim='vim ~/.vim/vimrc'
alias egit='vim ~/.gitconfig'
alias rbash='. ~/.bash_profile'
alias ebash='vim ~/.bash_profile'
alias ebashpri='vim ~/.dotfiles/bash_private'
alias ..='cd ..'
alias l='ls -l'
alias ll='ls -la'
alias lll='ls -lha'
alias ip='ifconfig en0 | grep inet | grep -v inet6'
alias notes='cd ~/Dropbox/notes/work'
alias nox='vim ~/Dropbox/notes/work'
alias dot='cd ~/.dotfiles/'
