#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")"

rsync --exclude ".git/" \
      --exclude ".DS_Store" \
      --exclude "tags" \
      -av --no-perms ./dotfiles/ ~

# Update iterm2 Preferences
sh ./iterm2.sh

# Update wallpaper
python ./wallpaper.py --path=$HOME/.dotfiles/lib/wallpapers/mountain_peak_stars_sky_night_light_snow_46057_2560x1440.jpg