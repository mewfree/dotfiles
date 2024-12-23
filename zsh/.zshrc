# Basic stuff...
HISTFILE=$HOME/.zsh_history # Note to self: the uppercase are actually really important
HISTSIZE=100000
SAVEHIST=100000
export KEYTIMEOUT=1
export EDITOR="nvim"
export VISUAL="nvim"

# Vi mode :)
bindkey -v
bindkey -M viins 'jk' vi-cmd-mode
bindkey -M viins 'kj' vi-cmd-mode
stty stop '^-' start '^-' # don't freeze terminal if I type CTRL-S
autoload -Uz compinit promptinit
compinit
promptinit

# My own prompt theme
prompt suse

# Options
setopt AUTO_CD # no need to cd in dir, just type dir
setopt RM_STAR_WAIT # 10 sec wait if you rm *
setopt NO_BEEP
setopt AUTO_LIST # show suggests if ambiguous completion
setopt AUTO_PARAM_SLASH
setopt COMPLETE_ALIASES
setopt COMPLETE_IN_WORD
setopt HIST_IGNORE_DUPS
setopt EXTENDED_HISTORY
setopt APPEND_HISTORY

# Completion
# Faster! (?)
zstyle ':completion::complete:*' use-cache 1
# case insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format '%B%d%b'
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format 'No matches for: %d'
zstyle ':completion:*' group-name ''
# generate descriptions with magic.
zstyle ':completion:*' auto-description 'specify: %d'
# Don't prompt for a huge list, page it!
zstyle ':completion:*:default' list-prompt '%S%M matches%s'
# Don't prompt for a huge list, menu it!
zstyle ':completion:*:default' menu 'select=0'
# Have the newer files last so I see them first
zstyle ':completion:*' file-sort modification reverse
# color code completion!!!!  Wohoo!
zstyle ':completion:*' list-colors "=(#b) #([0-9]#)*=36=31"

# Aliases
alias ls="ls -Gph"
alias ll="ls -l"
alias la="ls -lA"

alias whatismyip="curl http://ipecho.net/plain"

alias rsp='rsync -rvP --ignore-existing'
alias rsa='rsync -avP'

case "$OSTYPE" in
  darwin*)
    alias killaudio="sudo kill -9 `ps ax|grep 'coreaudio[a-z]' | awk '{print $1}'`"
  ;;
esac

# Plugins
case "$OSTYPE" in
  darwin*)
    [ -d $TMPDIR/zsh-501/ ] && rm -rf $TMPDIR/zsh-501/*
  ;;
  linux*)
    [ -d /tmp/zsh-1000/ ] && rm -rf /tmp/zsh-1000/*
  ;;
esac
source ~/.zpm/zpm.zsh
zpm load zsh-users/zsh-syntax-highlighting
zpm load zsh-users/zsh-history-substring-search
zpm load zsh-users/zsh-autosuggestions

bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

bindkey '^f' vi-forward-word
bindkey '^e' end-of-line

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=3"

# Auto ls after cd
function chpwd() {
  emulate -L zsh
  ls -a
}

# Show the mode in vi-mode
precmd() {
  RPROMPT=""
}
zle-keymap-select() {
  RPROMPT=""
  [[ $KEYMAP = vicmd ]] && RPROMPT="(CMD)"
  () { return $__prompt_status }
  zle reset-prompt
}
zle-line-init() {
  typeset -g __prompt_status="$?"
}
zle -N zle-keymap-select
zle -N zle-line-init

# mise
eval "$(mise activate zsh)"

# ghcup
case "$OSTYPE" in
  darwin*)
    [ -f "/Users/damien/.ghcup/env" ] && source "/Users/damien/.ghcup/env" # ghcup-env
  ;;
  linux*)
    [ -f "/home/damien/.ghcup/env" ] && source "/home/damien/.ghcup/env" # ghcup-env
  ;;
esac
