if (( ${+DISPLAY} )); then
    export TERMINAL=xterm-kitty
    export TERM=xterm-kitty
fi
export PATH=$PATH:$HOME/.scripts:$HOME/bin:$HOME/.local/bin:$HOME/.emacs.d/bin
export ZSH=$HOME/.oh-my-zsh
# export DOTNET_CLI_TELEMETRY_OUTPUT=1
if type nvim > /dev/null; then
    export EDITOR="nvim"
    export VISUAL="nvim"
fi
export THCRAP_DIR="/mnt/HDD/game/touhou/game/thcrap"
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
export GTK_IM_MODULE=fcitx

# https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="philips"
# philips

ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="dd.mm.yyyy"

set -o extendedglob

plugins=(git autoupdate zshmarks zsh-autosuggestions zsh-completions colorize colored-man-pages zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

autoload -U compinit
compinit

export MANPATH="/usr/local/man:$MANPATH"
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='nvim'
fi

if type clipcat-menu >/dev/null 2>&1; then
    alias clipedit=' clipcat-menu --finder=builtin edit'
    alias clipdel=' clipcat-menu --finder=builtin remove'

    bindkey -s '^\' "^Q clipcat-menu --finder=builtin insert ^J"
    bindkey -s '^]' "^Q clipcat-menu --finder=builtin remove ^J"
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

PROMPT="%B%F{207}%n%f%b:%F{45}%d%f %B%F{yellow}$%f%b "
RPROMPT="[%F{40}%*%f]"

setopt HIST_IGNORE_DUPS
HISTSIZE=100000
SAVEHIST=$HISTSIZE

if [[ -f ~/.playlists ]]; then
    . ~/.playlists
fi

if [[ -f /usr/share/LS_COLORS/dircolors.sh ]]; then
    . "/usr/share/LS_COLORS/dircolors.sh"
fi

# For a full list of active aliases, run `alias`.

if [ "$TERMINAL" = "kitty" ]; then
    alias ssh="kitty +kitten ssh"
fi

lfcd () 
{
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}

bindkey -s '^o' 'lfcd\n'

alias zshcfg="$EDITOR ~/.zshrc"
alias vimcfg="$EDITOR ~/.config/nvim/init.vim"
alias i3cfg="$EDITOR ~/.config/i3/config"
alias i3statuscfg="$EDITOR ~/.config/i3status-rust/config.toml"
alias fstab="sudo $EDITOR /etc/fstab"
alias sudo="sudo "
alias piserver="ssh ubuntu@192.168.2.120 -p 255"
alias audiodevices="pacmd list-sinks | grep -e 'name:' -e 'index:'"
alias nano="nano --rcfile ~/.nanorc"
alias jp="LANG=ja_JP.UTF-8"
alias sdn="sudo shutdown now"
alias srn="sudo reboot now"
alias sus="systemctl suspend"
alias printeron="sudo systemctl start cups.service"
alias printeroff="sudo systemctl stop cups.service"
alias startx="startx ~/.xinitrc"
alias hg="kitty +kitten hyperlinked_grep"
alias ccat="highlight -O ansi"

alias goto="jump"
alias bm="bookmark"
alias d="deletemark"
alias p="showmarks"

bashcompinit

if [[ -f $HOME/.config/broot/launcher/bash/br ]]; then 
    source $HOME/.config/broot/launcher/bash/br
fi
