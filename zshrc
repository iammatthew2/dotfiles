#!/bin/bash

###############################
# EXPORT ENVIRONMENT VARIABLE #
###############################

export DOTFILES="$HOME/dotfiles"
export EDITOR="vim"
export HISTSIZE=10000                   # Maximum events for internal history
export SAVEHIST=10000                   # Maximum events in history file
export CLICOLOR=1

try_source() {
  local file_path="$1"
  
  if [[ -f "$file_path" ]]; then
    source "$file_path"
  else
    echo "Path not found (try_source): $file_path" >&2
  fi
}

# +------------+
# | NAVIGATION |
# +------------+

setopt AUTO_CD              # Go to folder path without using cd.
setopt AUTO_PUSHD           # Push the old directory onto the stack on cd.
setopt PUSHD_IGNORE_DUPS    # Do not store duplicates in the stack.
setopt PUSHD_SILENT         # Do not print the directory stack after pushd or popd.
setopt CDABLE_VARS          # Change directory to a path stored in a variable.
setopt EXTENDED_GLOB        # Use extended globbing syntax.

# +------------+
# | FZF SETUP  |
# +------------+
# Enable fzf keybindings
# fzf keybindings and completions
try_source "/opt/homebrew/opt/fzf/shell/key-bindings.zsh"
try_source "/opt/homebrew/opt/fzf/shell/completion.zsh"
export FZF_CTRL_R_OPTS="--layout=reverse --preview-window=down:3 --border --height=40% --bind 'ctrl-y:execute-silent(echo {} | pbcopy)+abort'"

# +------------+
# | PREVENT CORRECTION |
# +------------+

unsetopt correct_all
unsetopt correct

# +---------+
# | HISTORY |
# +---------+

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search

setopt EXTENDED_HISTORY          # Write the history file in the ':start:elapsed;command' format.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire a duplicate event first when trimming history.
setopt HIST_IGNORE_DUPS          # Do not record an event that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete an old recorded event if a new event is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a previously found event.
setopt HIST_IGNORE_SPACE         # Do not record an event starting with a space.
setopt HIST_SAVE_NO_DUPS         # Do not write a duplicate event to the history file.
setopt HIST_VERIFY               # Do not execute immediately upon history expansion.

# completion
autoload -U compinit; compinit
_comp_options+=(globdots) # With hidden files
try_source "$DOTFILES/zsh_config/completion.zsh"

# +--------+
# | PROMPT |
# +--------+

fpath=($DOTFILES/zsh_config/prompt $fpath)
try_source "$DOTFILES/zsh_config/prompt/prompt_purification_setup"

# Clone the repo only if the main script file is missing
if [[ ! -f "$DOTFILES/zsh_config/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]]; then
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$DOTFILES/zsh_config/zsh-syntax-highlighting"
fi

# Source the plugin if the file exists
try_source "$DOTFILES/zsh_config/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# Load shared shell configuration
try_source ~/dotfiles/shell_common

# Zoink shell integration
try_source "/Users/mvillene/Library/Application Support/zoink/shell/zsh.sh"
# temporarily point to dev installation
export PATH="$HOME/dev/zoink_dev/bin:$PATH"
