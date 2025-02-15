#!/bin/bash
. ~/dotfiles/shell_common
# $HOME/.cargo/bin is added to user PATH by MDM
# You can opt-out by creating ~/.no_touch_shell_rc file
case ":${PATH}:" in
    *:"$HOME/.cargo/bin":*)
    ;;
    *)
    export PATH="$PATH:$HOME/.cargo/bin"
    ;;
esac
