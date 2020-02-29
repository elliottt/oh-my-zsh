#!/usr/bin/env bash

set -euo pipefail

if ! git ls-remote --quiet --exit-code ohmyzsh > /dev/null 2>&1 ; then
  echo "Adding the ohmyzsh remote"
  git remote add ohmyzsh https://github.com/ohmyzsh/ohmyzsh > /dev/null
fi

echo "Fetching ohmyzsh"
git fetch --quiet ohmyzsh

echo "Rebasing onto ohmyzsh/master"
git rebase --quiet ohmyzsh/master

echo "Done"
