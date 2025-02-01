[[ $- == *i* ]] && source /usr/share/blesh/ble.sh

export XDG_RUNTIME_DIR=/tmp/xdg-runtime-$(id -u) && mkdir -p $XDG_RUNTIME_DIR
export FZF_DEFAULT_OPTS="--bind j:down,k:up"
export EDITOR='nvim'
export MANPAGER="less --RAW-CONTROL-CHARS --use-color --color=d+g --color=u+y"
export MANROFFOPT="-c"
export GTK_THEME=Adwaita:dark
export GTK2_RC_FILES=/usr/share/themes/Adwaita-dark/gtk-2.0/gtkrc
export QT_STYLE_OVERRIDE=Adwaita-Dark

PROMPT_DIRTRIM=2

HISTCONTROL="erasedups:ignoreboth"
HISTSIZE=500000
HISTFILESIZE=100000
HISTTIMEFORMAT='%F %T '
HISTIGNORE="&:[ ]*:exit:ls:bg:fg:history:clear:pwd:source"

bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
bind '"\e[C": forward-char'
bind '"\e[D": backward-char'

bind "set completion-ignore-case on"
bind "set completion-map-case on"
bind "set show-all-if-ambiguous on"
bind "set mark-symlinked-directories on"

shopt -s autocd 2> /dev/null
shopt -s dirspell 2> /dev/null
shopt -s cdspell 2> /dev/null
shopt -s checkwinsize

eval "$(zoxide init bash)"

source /usr/share/bash-completion/bash_completion

[[ ! ${BLE_VERSION-} ]] || ble-attach
