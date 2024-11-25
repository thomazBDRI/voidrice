#!/bin/sh

# riverctl spawn needed? Can't I just call it directly?

riverctl spawn 'dunst'
riverctl spawn 'dex -a'
riverctl spawn 'localsend --hidden'
riverctl spawn '1password --silent'
riverctl spawn 'blueman-applet'
riverctl spawn 'sudo tailscale up'
riverctl spawn 'waybar'
riverctl spawn 'swww-daemon'
riverctl spawn 'setbg' # MUST be after swww-daemon
