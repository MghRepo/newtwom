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

# Keybindings hash compatible zkbd
typeset -g -A key

key[Home]="${terminfo[khome]}"
key[End]="${terminfo[kend]}"
key[Insert]="${terminfo[kich1]}"
key[Backspace]="${terminfo[kbs]}"
key[Delete]="${terminfo[kdch1]}"
key[Up]="${terminfo[kcuu1]}"
key[Down]="${terminfo[kcud1]}"
key[Left]="${terminfo[kcub1]}"
key[Right]="${terminfo[kcuf1]}"
key[PageUp]="${terminfo[kpp]}"
key[PageDown]="${terminfo[knp]}"
key[Shift-Tab]="${terminfo[kcbt]}"

# Mise en place des touches

[[ -n "${key[Home]}"            ]] && bindkey -- "${key[Home]}"         beginning-of-line
[[ -n "${key[End]}"             ]] && bindkey -- "${key[End]}"          end-of-line
#[[ -n "${}"                     ]] && bindkey -- "${}"         beginning-of-line

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
