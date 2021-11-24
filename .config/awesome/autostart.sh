#!/bin/bash

function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}

xrandr --output DP-2 --mode 1920x1080 --output HDMI-0 --mode 1920x1080 --right-of DP-2
#run nitrogen --random --set-scaled --head=0
#run nitrogen --random --set-scaled --head=1
feh --bg-fill --randomize ~/Pictures/wallpapers

run picom
run lxsession
#run variety
run /home/alokesh/Documents/sh/sawpbuttons.sh
#run xfce4-power-manager
#run blueberry-tray
#run numlockx on
#run dunst
#run barrier
#run discord &
#run steam
#run pa-applet
#run nm-applet
#run ~/Documents/awesomewm.sh
#run pamac-tray
run caffeine
#autorandr horizontal
#run /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1
#run volumeicon
run openrgb -p eafin.orp
run nextcloud
run kdeconnect-indicator
run keepassxc
run emacs --daemon
#you can set wallpapers in themes as well

#run applications from startup
#run firefox
#run atom
#run dropbox
#run insync start
#run spotify
#run ckb-next -b
#run discord
#run telegram-desktop
