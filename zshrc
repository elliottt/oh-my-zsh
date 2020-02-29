# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

ZSH_THEME="agkozak"
CASE_SENSITIVE="true"
DISABLE_AUTO_UPDATE="true"
DISABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

plugins=(git brew vagrant)

source $ZSH/oh-my-zsh.sh

# special key bindings
bindkey -e
bindkey "^f" forward-word
bindkey "^b" backward-word

# no beeping
setopt nobeep

# ghc management
use_ghc() {
  export PATH=$HOME/local/ghc/$1/bin:$PATH
}

# man wrapper that relies on my vim config
vman() {
  if [ $# -eq 0 ]; then
    echo "What man page do you want?"
  elif ! man -w "$@" &> /dev/null; then
    # Check that manpage exists to prevent visual noise.
    echo "No manual entry for $*"
  else
    nvim -c "FancyMan $1"
  fi
}

# handy scp wrapper for avoiding the weird local-to-local behavior
scp() {
  if grep -q : <(printf %s "$@")
  then
    command scp "$@"
  else
    echo If you really want to use scp to do cp"'"s job, type '`command !!`'.
    return 1
  fi
}

export EDITOR='vim'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
