export EDITOR="vim"
export VISUAL="emacsclient -C -a kate"
export TERM="alacritty"
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

cowsay | fortune

##ALIAS

#ls'es
#alias ls="ls -lAgh | lolcat"
#alias ls="lsd -lAh | lolcat"
alias lsd="lsd -lah"
alias ls="exa -al --color=always --group-directories-first --icons"

#useful
alias ipa="ip -c a"
alias dotfilese="/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME"
alias updatee="sudo aura -Syu --noconfirm && sudo aura -Ayu --noconfirm"
alias nano="vim"
alias cat="bat --style header --style rules --style snip --style changes --style head
        er"
alias mv="mv -iv"
alias cp="cp -iv"

#fun
alias btw="sudo"
alias h="fuck"
alias :wq="exit"
alias :q="exit"
alias brag="neofetch --cpu_temp C --ascii_distro windows7"
alias klear="clear" #kde users lol

cowsay "Ramram" | lolcat

eval "$(thefuck --alias)"
eval "$(starship init bash)"
