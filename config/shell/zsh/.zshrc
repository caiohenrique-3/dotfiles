# Paths
PATH=$PATH:~/.local/bin
PATH=$PATH:~/.cargo/bin/

# Exports
export FZF_DEFAULT_OPTS="--bind j:down,k:up"
export EDITOR='nvim'
export MANPAGER="less --RAW-CONTROL-CHARS --use-color --color=d+g --color=u+y"
export MANROFFOPT="-c"

# Aliases
source ~/.aliases

# Enable colors and change prompt
autoload -U colors && colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

# Command history
HISTFILE=~/.histfile
HISTORY_IGNORE="(ls|pwd|exit|source|clear|history)"
HISTSIZE=50000
SAVEHIST=50000

setopt HIST_IGNORE_ALL_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_REDUCE_BLANKS
setopt INC_APPEND_HISTORY_TIME
setopt EXTENDED_HISTORY

# zsh-history-substring-search
HISTORY_SUBSTRING_SEARCH_ENSURE_UNIQUE=1

# Command completion 
autoload -Uz compinit 

# Arrow-key interface
zstyle ':completion:*' menu select

# Case insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

compinit

# Zoxide
eval "$(zoxide init zsh)"

# Keybinds
bindkey '^I'   complete-word                    # tab          | complete
bindkey '^[[Z' autosuggest-accept               # shift + tab  | autosuggest
bindkey '^[[A' history-substring-search-up      # up arrow     | history 
bindkey '^[[B' history-substring-search-down    # down arrow   | history

# Plugins
source /usr/share/zsh/plugins/you-should-use/you-should-use.plugin.zsh
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh
