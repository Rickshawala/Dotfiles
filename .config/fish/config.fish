set fish_greeting
thefuck --alias | source

#FUNCTIONS

#BANGBANG https://github.com/oh-my-fish/plugin-bang-bang
function __history_previous_command
  switch (commandline -t)
  case "!"
    commandline -t $history[1]; commandline -f repaint
  case "*"
    commandline -i !
  end
end

function __history_previous_command_arguments
  switch (commandline -t)
  case "!"
    commandline -t ""
    commandline -f history-token-search-backward
  case "*"
    commandline -i '$'
  end
end

if [ "$fish_key_bindings" = fish_vi_key_bindings ];
  bind -Minsert ! __history_previous_command
  bind -Minsert '$' __history_previous_command_arguments
else
  bind ! __history_previous_command
  bind '$' __history_previous_command_arguments
end

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
#alias df="df -hx squashfs"
alias dotfilese="/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME"
alias dotfilesep="/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME push git@github.com:Rickshawala/dotfiles"
alias dotfilesea="/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME add"
alias dotfilesec="/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME commit -m"
alias dotfilesewhat="/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME diff --staged"
alias updatee="yay"
alias nano="vim"
alias cat="bat --style header --style rules --style snip --style changes --style header"
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

colorscript random 

starship init fish |source
