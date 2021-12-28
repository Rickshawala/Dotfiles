set fish_greeting

set EDITOR "vim"
set VISUAL "emacs -c -a emacs"
set TERM "alacritty"

#thefuck --alias | source

if test -n "$DESKTOP_SESSION"
    set -x (gnome-keyring-daemon --start | string split "=")
end

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

#NGROK
function ngroke
        ngrok tcp -region in 25565
end

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
alias cat="bat --style header --style rules --style snip --style changes --style header"

#fun
alias btw="sudo"
alias h="/home/wolfgang/.local/bin/fuck"
alias :wq="exit"
alias :q="exit"
alias brag="neofetch --cpu_temp C --ascii_distro windows7"
alias klear="clear" #kde users lol

colorscript random 

starship init fish |source
