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


# pnpm
export PNPM_HOME="/Users/mvillene/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
# $HOME/.cargo/bin is added to user PATH by MDM
case ":${PATH}:" in
    *:"$HOME/.cargo/bin":*)
    ;;
    *)
    export PATH="$PATH:$HOME/.cargo/bin"
    ;;
esac

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
