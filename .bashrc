#
# ~/.bashrc
#

export EDITOR="vim"
export VISUAL="emacsclient -C -a emacs"
export TERM="alacritty"
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

eval "$(thefuck --alias)"
alias lsd='lsd -lah | lolcat'
alias ls='exa -al --color=always --group-directories-first --icons'
PS1='[\u@\h \W]\$ '

export QT_QPA_PLATFORMTHEME="qt5ct"

cowsay "Fuck You" | lolcat

eval "$(starship init bash)"
