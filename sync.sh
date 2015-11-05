#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")"

rsync --exclude ".git/" \
      --exclude ".DS_Store" \
      --exclude "tags" \
      -av --no-perms ./dotfiles/ ~

# Update iterm2 Preferences
sh ./iterm2.sh

# Update wallpaper
sh ./wallpaper.sh