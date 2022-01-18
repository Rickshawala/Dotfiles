#!/bin/bash

function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}

xrandr --output DP-4 --mode 1920x1080 --output HDMI-0 --mode 1920x1080 --right-of DP-4
#run nitrogen --random --set-scaled --head=0
#run nitrogen --random --set-scaled --head=1
feh --bg-fill --randomize ~/Pictures/wallpapers

run picom --experimental-backend
run lxsession
#run variety
#run /mnt/games/urmillabot/start.sh
run emacs --daemon
#run xfce4-power-manager
#run blueberry-tray
#run numlockx on
run dunst
#run barrier
#run /home/wolfgang/gitclones/discordtarr/Discord
run discord
#run steam
run pa-applet
run flameshot
run nm-applet
#run ~/Documents/awesomewm.sh
run pamac-tray
run caffeine
#autorandr horizontal
#run /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1
#run volumeicon
run openrgb -p eafin.orp
run nextcloud
run kdeconnect-indicator
run keepassxc
run emacs --daemon
run secret-tool lookup keepass allah | keepassxc --pw-stdin /home/wolfgang/Documents/keepass.kdbx
run gromit-mpx --key F8 --undo-key F7
run tailscale-systray
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
