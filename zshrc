# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

ZSH_THEME="afowler"
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

# ghc management
use_ghc() {
  export PATH=$HOME/local/ghc/$1/bin:$PATH
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

# User configuration
if [[ -f $ZSH/site-config ]]; then
  source $ZSH/site-config
fi
