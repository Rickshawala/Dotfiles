source $HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOME/.zsh/zsh-autosuggestions.zsh

source $HOME/.zsh/zsh-history-substring-search.zsh
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

source $HOME/.zsh/auto-notify.plugin.zsh
source $HOME/.zsh/you-should-use.plugin.zsh

bindkey -v

##ALIAS
#ls'es
#alias ls="ls -lAgh | lolcat"
#alias ls="lsd -lAh | lolcat"
alias lsd="lsd -lah"
alias ls="exa -al --color=always --group-directories-first --icons"

#useful
alias ipa="ip -c a"
alias dotfilese="/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME"
alias updatee="yay --noconfirm"
alias nano="vim"
alias cat="bat --style header --style rules --style snip --style changes --style header"
alias mv="mv -iv"
alias cp="cp -iv"
alias rm="rm -iv"
alias mkdir="mkdir -pv"
alias systemctl="sudo systemctl"
alias ..="cd .."

#fun
alias btw="sudo"
alias h="fuck"
alias :wq="exit"
alias :q="exit"
alias brag="neofetch --cpu_temp C --ascii_distro windows7"
alias klear="clear" #kde users lol
alias DIDIFUCKINGSTUTTER="sudo !!"

colorscript random

unset ZSH_AUTOSUGGEST_USE_ASYNC
eval "$(starship init zsh)"
