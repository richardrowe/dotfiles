#!/usr/bin/env bash

#mv /Library/Caches/com.apple.desktop.admin.png ~/Desktop/.backup
#cp $HOME/.dotfiles/lib/wallpapers/mountain_peak_stars_sky_night_light_snow_46057_2560x1440.jpg /Library/Caches/com.apple.desktop.admin.png

sqlite3 ~/Library/Application\ Support/Dock/desktoppicture.db "update data set value = '$HOME/.dotfiles/lib/wallpapers/mountain_peak_stars_sky_night_light_snow_46057_2560x1440.jpg'";
killall Dock;