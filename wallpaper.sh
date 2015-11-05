#!/usr/bin/env bash

mv /Library/Caches/com.apple.desktop.admin.png ~/Desktop/.backup
mv $HOME/.dotfiles/lib/wallpapers/mountain_peak_stars_sky_night_light_snow_46057_2560x1440.jpg /Library/Caches/com.apple.desktop.admin.png

osascript -e 'tell application "Finder" to set desktop picture to POSIX file "$HOME/.dotfiles/lib/wallpapers/mountain_peak_stars_sky_night_light_snow_46057_2560x1440.jpg"'
