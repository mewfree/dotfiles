# Basic stuff...
HISTFILE=$HOME/.zsh_history # Note to self: the MAJ are actually really important
HISTSIZE=5000
SAVEHIST=5000
export KEYTIMEOUT=10
export editor="vim"

# Vi mode :)
bindkey -v
bindkey -M viins 'jk' vi-cmd-mode
bindkey -M viins 'kj' vi-cmd-mode
zstyle :compinstall filename '/home/damien/.zshrc'
stty stop '^-' start '^-' # don't freeze terminal if I type CTRL-S
autoload -Uz compinit promptinit
compinit
promptinit

# My own prompt theme
prompt mew blue

# Options
setopt AUTO_CD # no need to cd in dir, just type dir
setopt RM_STAR_WAIT # 10 sec wait if you rm *
setopt NO_BEEP
setopt AUTO_LIST # show suggests if ambiguous completion
setopt AUTO_PARAM_SLASh
setopt COMPLETE_ALIASEs
setopt COMPLETE_IN_WORd
setopt HIST_IGNORE_DUPs
setopt EXTENDED_HISTORy
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
alias ls="ls --color=auto --human-readable"
alias ll="ls -l"
alias la="ls -lA"

alias yu="yaourt -Syua --devel --noconfirm"

alias gc="git commit"
alias gca="git commit -a"
alias gcm="git commit -a -m"
alias gps="git push"
alias gpsh="git push"
alias gpl="git pull"
alias gpll="git pull"

alias proxyon="gsettings set org.gnome.system.proxy mode 'manual'"
alias proxyoff="gsettings set org.gnome.system.proxy mode 'none'"
alias whatismyip="curl http://ipecho.net/plain; echo;"

alias Misc="cd /home/damien/Seafile/Personal/Misc"
alias Seafile="cd /home/damien/Seafile/Personal/"
alias NCCU="cd /home/damien/Seafile/Personal/NCCU"
alias to-do="vim /home/damien/Seafile/Personal/Misc/todo.txt"
alias todo="vim /home/damien/Seafile/Personal/Misc/todo.txt"
alias note="vim /home/damien/Seafile/Personal/Misc/notes.txt"
alias notes="vim /home/damien/Seafile/Personal/Misc/notes.txt"

alias reboot="sudo systemctl reboot"
alias shutdown="sudo systemctl poweroff"
alias poweroff="sudo systemctl poweroff"
alias halt="sudo systemctl halt"

# Plugins
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

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
