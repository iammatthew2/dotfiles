. ~/dotfiles/bash_zsh_common

function git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}$ZSH_THEME_GIT_PROMPT_SUFFIX"
}

DISABLE_UNTRACKED_FILES_DIRTY="true"

# Add wisely, as too many plugins slow down shell startup.
plugins=(zsh-syntax-highlighting)

# ZSH_THEME="awesomepanda"
# Path to your oh-my-zsh installation.
export ZSH="${HOME}/dotfiles/oh-my-zsh"
source $ZSH/oh-my-zsh.sh
fpath+=$HOME/.zsh/pure

autoload -U promptinit; promptinit
# zstyle :prompt:pure:path color white
zstyle :prompt:pure:path color '#57c7ff'
prompt pure

unset LESS

# modify the prompt of awesomepanda theme to display RDEV name
# if (( ${+RDEV_NAME} )); then
#   export PS1='${ret_status}%{$fg_bold[green]%} ${RDEV_NAME} %{$fg[cyan]%}%c %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%}$(svn_prompt_info)%{$reset_color%}'
# fi
# if (( ${+RDEV_NAME} )); then
  # export PS1='${ret_status}%{$fg_bold[green]%} ${RDEV_NAME} %{$fg[cyan]%}%c %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%}$(svn_prompt_info)%{$reset_color%}'
# fi
