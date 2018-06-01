if [ "$(uname)" == "Darwin" ]; then
  export PS1='\[\e[1;32m\]\h\w${text}$\[\e[m\] '
else
  export PS1='\[\e[1;33m\]\h@\w${text}$\[\e[m\] '
fi
export LSCOLORS=GxFxCxDxBxegedabagaced
export CLICOLOR=1

##### general settings (methods and aliases go below)
# unified bash history
shopt -s histappend
PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"

# include bash_private if it exists
if [ -f ~/.secrets/bash_private ]; then
   . ~/.secrets/bash_private
fi

bind Space:magic-space
HISTFILESIZE=10000

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # load nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # load nvm bash_completion

##### scripts
source ~/.dotfiles/scripts/git-completion.bash
# the z dir completion helper
. ~/.dotfiles/scripts/z/z.sh

##### methods
##call gitFind with an argument to search for in addition to your user name
gitFind() {
  if [ ! -z $1 ]
  then
    git log --pretty=format:'%C(red black)%h%Creset %s %C(yellow black)%an' | grep -i "${2-$(git config user.name)}" | grep -i "$1"
  else
    echo "one or two arguments required: gitFind <query> or gitFind <query1> <query2>/n
    If only one argument, second argument is defaulted to git config user.name'"
  fi
}

##get info on port 9000 or some other specified port
port() {
  echo "Running lsof -n -iTCP: on ports 9000 thru 9005 and 9999"
  for i in {9000..9005} 
    do
      echo "Port $i: $(lsof -n -iTCP:$i)"
    # alternative command - might be more redhat friendly: lsof -n -iTCP:$i
    done
    echo "Port 9999: $(lsof -n -iTCP:9999)"
    echo "Port 4443: $(lsof -n -iTCP:4443)"
}

##### aliases
alias vim='vi'
alias evim='vim ~/.vim/vimrc'
alias egit='vim ~/.dotfiles/gitconfig'
alias etmux='vim ~/.tmux.conf'
alias rbash='. ~/.bash_profile'
alias ebash='vim ~/.bash_profile'
alias ewatch='vim ~/.watchman-processor.config.js'
alias ..='cd ..'
alias l='ls -l'
alias ll='ls -la'
alias lll='ls -lha'
alias notes='cd ~/Dropbox/notes/work'
alias nox='vim ~/Dropbox/notes/work'
alias dot='cd ~/.dotfiles/'
