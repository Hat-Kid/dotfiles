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

plugins=(git autoupdate zshmarks zsh-autosuggestions colorize colored-man-pages zsh-syntax-highlighting)
fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src
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

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

PROMPT="%B%F{207}%n%f%b:%F{45}%d%f %B%F{yellow}$%f%b "
RPROMPT="[%F{40}%*%f]"

setopt HIST_IGNORE_DUPS
HISTSIZE=1000000
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
alias autoexec="$EDITOR ~/.steam/steam/steamapps/common/team\ fortress\ 2/tf/cfg/overrides/autoexec.cfg"
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
alias task="go-task"
alias vpn="mullvad-exclude"
alias thunar="vpn thunar"
alias jakdebug="cd /home/philip/code/git/pcsx2/release/pcsx2-qt; ./pcsx2-qt"
alias winepfx="export WINEPREFIX=$(pwd)"
alias tfl="cd /home/philip/code/git/jak-clones/TFL/jak-project"
alias ptraceoff="echo 1 | sudo tee /proc/sys/kernel/yama/ptrace_scope"
alias ptraceon="echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope"
alias tfsrv_start="sudo systemctl start tfsrv"
alias tfsrv_restart="sudo systemctl restart tfsrv"
alias tfsrv_stop="sudo systemctl stop tfsrv"

unalias gk

alias goto="jump"
alias bm="bookmark"
alias d="deletemark"
alias p="showmarks"

# devkitpro vars
DEVKITPRO=/opt/devkitpro
DEVKITARM=/opt/devkitpro/devkitARM
DEVKITPPC=/opt/devkitpro/devkitPPC

bashcompinit

if [[ -f $HOME/.config/broot/launcher/bash/br ]]; then 
    source $HOME/.config/broot/launcher/bash/br
fi

export MANGOHUD=1
export CMAKE_CXX_COMPILER_LAUNCHER=ccache
export WEBKIT_DISABLE_DMABUF_RENDERER=1 # https://bugs.webkit.org/show_bug.cgi?id=259644
export BROWSER=firefox

# opam configuration
[[ ! -r /home/philip/.opam/opam-init/init.zsh ]] || source /home/philip/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null
source /usr/share/nvm/init-nvm.sh

zstyle ':completion:*:*:update-gsrc:*' file-patterns '%p:globbed-files'

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/usr/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/usr/etc/profile.d/conda.sh" ]; then
        . "/usr/etc/profile.d/conda.sh"
    else
        export PATH="/usr/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

