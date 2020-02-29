#!/usr/bin/env bash

set -euo pipefail

cd "$(dirname ${BASH_SOURCE[0]})"

mkdir -p custom/themes

pushd custom/themes > /dev/null

echo "Checking out theme"
git clone --quiet https://github.com/agkozak/agkozak-zsh-prompt agkozak
ln -s agkozak/agkozak-zsh-prompt.plugin.zsh agkozak.zsh-theme

popd > /dev/null

echo "Done"
