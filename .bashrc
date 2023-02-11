#
# ~/.bashrc
#
export EDITOR="nvim"
export VISUAL=$EDITOR
export TERMINAL="alacritty"
export BROWSER="firefox"
export XDG_CURRENT_DESKTOP="Sway"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias ll='ls -lh'
alias vim='nvim'

PS1='[\u@\h \W]\$ '
export PATH="/home/hugo/.local/bin:"$PATH

. "$HOME/.cargo/env"
