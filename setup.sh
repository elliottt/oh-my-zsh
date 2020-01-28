#!/bin/zsh

set -euo pipefail

pushd custom/themes

if [ ! -d agkozak ]; then
  git clone https://github.com/agkozak/agkozak-zsh-prompt agkozak
else
  pushd agkozak
  git pull
  popd
fi

ln -s agkozak/agkozak-zsh-prompt.plugin.zsh agkozak.zsh-theme

popd
