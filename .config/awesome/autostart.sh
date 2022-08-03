#!/bin/bash

function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}

#xrandr --output DP-4 --mode 1920x1080 --output HDMI-0 --mode 1920x1080 --right-of DP-4
feh --no-fehbg --bg-fill --randomize ~/Pictures/wallpapers
mpv --fullscreen \
    --no-input-default-bindings \
    --no-config \
    --on-all-workspaces \
    ~/Videos/memes/*.mp4 &

run picom --experimental-backend
#run lxsession
run emacs --daemon
#run xfce4-power-manager
#run blueberry-tray
#run numlockx on
run dunst
#run barrier
run discord
run flameshot
run caffeine
run openrgb -p eafin.orp
run nextcloud
run keepassxc
run gromit-mpx --key F8 --undo-key F7
run alacritty -e cat /home/mohanlal/Notes/todo.list
run tailscale-systray
