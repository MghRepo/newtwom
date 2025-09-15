# Définition Historique
HISTFILE=~/.local/state/zsh/histfile
HISTSIZE=1000
SAVEHIST=1000

precmd(){print -Pn "\e]0;{%~}\a"}

bindkey -v
bindkey '^R' history-incremental-search-backward
bindkey '^A' beginning-of-line
bindkey '^E' end-of-line

# Autoload
autoload -Uz compinit \
                up-line-or-beginning-search \
                down-line-or-beginning-search \
                run-help \
                run-help-git \
                run-help-ip \
                run-help-openssl \
                run-help-sudo

# Completion
compinit -d ~/.local/state/zsh/zcompdump
zstyle ':completion::complete:*' gain-privileges 1

# Prompt
PROMPT='%~ %F{13}>%F{14}>%f> '
RPROMPT='[%F{11}%?%f]'

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
key[Control-Left]="${terminfo[kLFT5]}"
key[Control-Right]="${terminfo[kRIT5]}"

# Mise en place des touches

[[ -n "${key[Home]}"        ]] && bindkey -- "${key[Home]}"         beginning-of-line
[[ -n "${key[End]}"         ]] && bindkey -- "${key[End]}"          end-of-line
[[ -n "${key[Insert]}"      ]] && bindkey -- "${key[Insert]}"       overwrite-mode
[[ -n "${key[Backspace]}"   ]] && bindkey -- "${key[Backspace]}"    backward-delete-char
[[ -n "${key[Delete]}"      ]] && bindkey -- "${key[Delete]}"       delete-char
[[ -n "${key[Up]}"          ]] && bindkey -- "${key[Up]}"           up-line-or-history
[[ -n "${key[Down]}"        ]] && bindkey -- "${key[Down]}"         down-line-or-history
[[ -n "${key[Left]}"        ]] && bindkey -- "${key[Left]}"         backward-char
[[ -n "${key[Right]}"       ]] && bindkey -- "${key[Right]}"        forward-char
[[ -n "${key[PageUp]}"      ]] && bindkey -- "${key[PageUp]}"       beginning-of-buffer-or-history
[[ -n "${key[PageDown]}"    ]] && bindkey -- "${key[PageDown]}"     end-of-buffer-or-history
[[ -n "${key[Shift-Tab]}"   ]] && bindkey -- "${key[Shift-Tab]}"    reverse-menu-complete
[[ -n "${key[Control-Left]}"    ]] && bindkey -- "${key[Control-Left]}"     backward-word
[[ -n "${key[Control-Right]}"   ]] && bindkey -- "${key[Control-Right]}"    forward-word

# Terminal en mode application quand zle actif.
if (( ${+terminfo[smkx]} && ${+terminfo[rmkx]} )); then
    autoload -Uz add-zle-hook-widget
    function zle_application_mode_start { echoti smkx }
    function zle_application_mode_stop { echoti rmkx }
    add-zle-hook-widget -Uz zle-line-init zle_application_mode_start
    add-zle-hook-widget -Uz zle-line-finish zle_application_mode_stop
fi

# Recherche dans l'historique
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
[[ -n "${key[up]}"       ]] && bindkey -- "${key[up]}"   up-line-or-beginning-search
[[ -n "${key[down]}"     ]] && bindkey -- "${key[down]}" down-line-or-beginning-search

# Commandes d'aide
(( ${+aliases[run-help]} )) && unalias run-help
alias help=run-help

# Plugins
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Aliases
alias ll='exa -l'
alias vim='nvim'
