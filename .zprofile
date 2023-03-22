# PATH
#export GOPATH=$HOME/go
#export PATH=$PATH:$(go env GOPATH)/bin
#export PATH=$PATH:$HOME/.cargo/bin
export PATH=$PATH:$HOME/.scripts
export PATH=$PATH:$HOME/bin/

export GOPATH=/Users/$USER/go
export PATH=$GOPATH/bin:$PATH


export EDITOR="nvim"
export TERMINAL="kitty"
export BROWSER="google-chrome-stable"
export READER="zathura"
export PAGER="less"
export FILE="lf"
# Enable nota GPG support
export GPG=1
export PGP_EDITOR="nvim"
GPG_TTY=`tty`
export GPG_TTY
export XDG_CONFIG_HOME=~/.config/

export CLICOLOR=1

# less/man colors
export LESS=-R
export LESS_TERMCAP_mb="$(printf '%b' '[1;31m')"; a="${a%_}"
export LESS_TERMCAP_md="$(printf '%b' '[1;36m')"; a="${a%_}"
export LESS_TERMCAP_me="$(printf '%b' '[0m')"; a="${a%_}"
export LESS_TERMCAP_so="$(printf '%b' '[01;44;33m')"; a="${a%_}"
export LESS_TERMCAP_se="$(printf '%b' '[0m')"; a="${a%_}"
export LESS_TERMCAP_us="$(printf '%b' '[1;32m')"; a="${a%_}"
export LESS_TERMCAP_ue="$(printf '%b' '[0m')"; a="${a%_}"

#mpd >/dev/null 2>&1 &
#[ ! -f ~/.config/shortcutrc ] && shortcuts >/dev/null 2>&1

#echo "$0" | grep "bash$" >/dev/null && [ -f ~/.bashrc ] && source "$HOME/.bashrc"

# Start graphical server if i3 not already running.
#[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x i3 >/dev/null && exec startx

# Switch escape and caps if tty:
#sudo -n loadkeys ~/.local/bin/ttymaps.kmap 2>/dev/null

export PATH="$HOME/.cargo/bin:$PATH"
