export EDITOR="vim"
export VISUAL="emacsclient -C -a kate"
export TERM="alacritty"
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

##ALIAS

#ls'es
#alias ls="ls -lAgh | lolcat"
#alias ls="lsd -lAh | lolcat"
alias lsd="lsd -lah"
alias ls="exa -al --color=always --group-directories-first --icons"

#useful
alias ngroke="ngrok tcp -region in 25565"
alias ipa="ip -c a"
#alias lsblk="lsblk -e whatever major number snap apps have"
alias df="df -hx squashfs"
alias dotfilese="/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME"
alias updatee="yay"
alias nano="vim"
alias cat="bat --style header --style rules --style snip --style changes --style head
        er"
alias mv="mv -iv"
alias cp="cp -iv"
alias rm="rm -iv"
alias mkdir="mkdir -pv"
alias systemctl="sudo systemctl"

#fun
alias btw="sudo"
alias h="fuck"
alias :wq="exit"
alias :q="exit"
alias brag="neofetch --cpu_temp C --ascii_distro windows7"
alias klear="clear" #kde users lol
alias DIDIFUCKINGSTUTTER="sudo !!"
alias ieditedetcdefaultgrub="sudo grub-mkconfig -o /boot/grub/grub.cfg"
alias takenotes="vim ~/Notes/todo.list"

#autocd
shopt -s autocd

# BEGIN_KITTY_SHELL_INTEGRATION
if test -n "$KITTY_INSTALLATION_DIR" -a -e "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; then source "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; fi
# END_KITTY_SHELL_INTEGRATION

cowsay "Ramram" | lolcat

eval "$(thefuck --alias)"
eval "$(starship init bash)"
