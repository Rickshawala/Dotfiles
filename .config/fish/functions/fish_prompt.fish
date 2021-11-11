function fish_prompt
    if test -n "$SSH_TTY"
        echo -n (set_color brred)"$USER"(set_color white)'@'(set_color yellow)(prompt_hostname)' '
    end

    echo -n (set_color blue)(prompt_pwd)' '

    set_color -o
    if fish_is_root_user
        echo -n (set_color red)'# '
    end
    echo -n (set_color red)'❯'(set_color yellow)'❯'(set_color green)'❯ '
    set_color normal
end

alias ls="ls -lAgh | lolcat"

alias ip a="ip -c a"

alias btw="sudo"

alias h="fuck"

alias :wq="exit"

alias :q="exit"

alias brag="neofetch"

alias updatee="sudo aura -Syyu && sudo aura -Ayyu"

alias lsd="lsd -lah"

function ngroke
        ngrok tcp -region in 25565
end

alias lsd="lsd -lah"

alias cat="bat"

alias dotfilese="/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME"

alias nano="vim"

alias neofetch="neofetch --cpu_temp C --ascii_distro windows7"

alias archup="sudo aura -Syyu"

alias aurup="sudo aura -Ayyu"
