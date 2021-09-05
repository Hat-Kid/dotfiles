export PATH=$PATH:$HOME/.scripts:$HOME/bin
export ZSH="/home/philip/.oh-my-zsh"

# https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="philips"
# philips

ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="dd.mm.yyyy"

set -o extendedglob

plugins=(git zshmarks colorize colored-man-pages)
source $ZSH/oh-my-zsh.sh

export MANPATH="/usr/local/man:$MANPATH"
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nano'
else
  export EDITOR='nano'
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

#. ~/.dir_bookmarks
. ~/.playlists
. "/usr/share/LS_COLORS/dircolors.sh"

# For a full list of active aliases, run `alias`.
alias zshcfg="$EDITOR ~/.zshrc"
alias i3cfg="$EDITOR ~/.config/i3/config"
alias i3statuscfg="$EDITOR ~/.config/i3status-rust/config.toml"
alias sudo="sudo "
alias piserver="ssh ubuntu@192.168.2.120 -p 255"
alias audiodevices="pacmd list-sinks | grep -e 'name:' -e 'index:'"
alias nano="nano --rcfile ~/.nanorc"
alias jp="LANG=ja_JP.UTF-8"
alias sdn="sudo shutdown now"
alias srn="sudo reboot now"
alias printeron="sudo systemctl start cups.service"
alias printeroff="sudo systemctl stop cups.service"
alias startx="startx ~/.xinitrc"

alias goto="jump"
alias bm="bookmark"
alias d="deletemark"
alias p="showmarks"
