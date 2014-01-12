# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

ZSH_THEME="afowler"
CASE_SENSITIVE="true"
DISABLE_AUTO_UPDATE="true"
DISABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

plugins=(git)

source $ZSH/oh-my-zsh.sh

# special key bindings
bindkey -e
bindkey "^f" forward-word
bindkey "^b" backward-word

export EDITOR='vim'

# User configuration
if [[ -f $ZSH/site-config ]]; then
  source $ZSH/site-config
fi
