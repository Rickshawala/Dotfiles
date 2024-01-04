# If not running interactively, don't do anything
[[ $- != *i* ]] && return

##ALIAS

#required
alias wget="wget --hsts-file="$XDG_DATA_HOME/wget-hsts""

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
#alias cat="bat --style header --style rules --style snip --style changes --style header"
alias mv="mv -riv"
alias cp="cp -riv"
alias rm="rm -iv"
alias mkdir="mkdir -pv"
alias systemctl="sudo systemctl"
alias doomsync="~/.emacs.d/bin/doom sync"


#edit config files
alias edawesome="vim ~/.config/awesome/rc.lua"
alias edautoawesome="vim ~/.config/awesome/autostart.sh"
alias edfish="vim ~/.config/fish/config.fish"
alias edbash="vim ~/.bashrc"
alias edalacritty="vim ~/.config/alacritty/alacritty.yml"
alias edzsh="vim ~/.config/zsh/.zshrc"
alias edkitty="vim ~/.config/kitty/kitty.conf"

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

cowsay "Ramram" | lolcat

eval "$(thefuck --alias)"
eval "$(starship init bash)"
