#
# ~/.bashrc
#

export EDITOR="vim"
export VISUAL="emacsclient -C -a emacs"
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

eval "$(thefuck --alias)"
alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

export QT_QPA_PLATFORMTHEME="qt5ct"

cowsay "Fuck You" | lolcat

eval "$(starship init bash)"
