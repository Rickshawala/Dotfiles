#
# ~/.bashrc
#

EDITOR = vim
VISUAL = emacs
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

eval "$(thefuck --alias)"
alias ls='ls --color=auto'
alias DID_I_FUCKING_STUTTER="sudo $(history -p !!)" 
alias minecrafte="java -jar ~/.minecraft/minecraft-launcher/Tlauncher.jar"
PS1='[\u@\h \W]\$ '

export QT_QPA_PLATFORMTHEME="qt5ct"

cowsay "Fuck You" | lolcat

/usr/bin/emacs --daemon &

source /home/alokesh/.config/broot/launcher/bash/br
