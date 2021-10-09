#
# ~/.bashrc
#

EDITOR = vim
VISUAL = vim
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias DID_I_FUCKING_STUTTER="sudo $(history -p !!)" 
alias minecrafte="java -jar ~/.minecraft/minecraft-launcher/Tlauncher.jar"
PS1='[\u@\h \W]\$ '

export QT_QPA_PLATFORMTHEME="qt5ct"

cowsay "Fuck You"

source /home/alokesh/.config/broot/launcher/bash/br
