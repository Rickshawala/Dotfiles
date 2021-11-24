export EDITOR="vim"
export VISUAL="emacsclient -c -a emacs"

bindkey -v

alias ls="ls -lAgh | lolcat"
alias ipa="ip -c a"
alias btw="sudo"
alias h="fuck"
alias :wq="exit"
alias :q="exit"
alias brag="neofetch --cpu_temp c --ascii_distro windows7"
alias updatee="sudo aura -Syyu --noconfirm && sudo aura -Ayyu --noconfirm"
alias lsd="lsd -lah | lolcat"
alias cat="bat"
alias nano="vim"
alias dotfilese="/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME"

function ngroke{
	ngrok tcp -region in 25565
}

colorscript random

eval "$(starship init zsh)"
