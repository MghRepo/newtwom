# Définition Historique
HISTFILE=~/.local/state/zsh/histfile
HISTSIZE=1000
SAVEHIST=1000

# Autoload
autoload -Uz compinit promptinit up-line-or-beginning-search down-line-or-beginning-search

# Completion
compinit -d ~/.local/state/zsh/zcompdump
zstyle ':completion:*' menu select
zstyle ':completion::complete:*' gain-privileges 1

# Prompt
promptinit
prompt walters

# Recherche dans l'historique
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
[[ -n "${key[up]}"       ]] && bindkey -- "${key[up]}"   up-line-or-beginning-search
[[ -n "${key[down]}"     ]] && bindkey -- "${key[down]}" down-line-or-beginning-search

# Plugins
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Aliases
alias ll='ls -l'
alias vim='nvim'
