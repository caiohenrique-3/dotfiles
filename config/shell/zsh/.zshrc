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

# # Enable colors and change prompt
autoload -U colors && colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

# Vi mode
bindkey -v
export KEYTIMEOUT=5

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# Quick command examples
cheatsh() {
    curl cheat.sh/"$1" | bat
}

# Command history
HISTFILE=~/.histfile
HISTSIZE=7777
SAVEHIST=7777

setopt hist_ignore_all_dups
setopt hist_reduce_blanks

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
source ~/.config/zsh/plugins/git/git.plugin.zsh
source ~/.config/zsh/plugins/extract/extract.plugin.zsh
source ~/.config/zsh/plugins/you-should-use/you-should-use.plugin.zsh
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
