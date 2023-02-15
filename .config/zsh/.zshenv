EDITOR="nvim"
VISUAL=$EDITOR
TERMINAL="alacritty"
BROWSER="firefox"
XDG_CURRENT_DESKTOP="Sway"

typeset -U path PATH
path=(~/.local/bin $path)
export PATH
