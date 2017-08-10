#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='\[\033[38;5;10m\]\u@\h\[$(tput sgr0)\]\[\033[38;5;15m\]:[\W]: \\$ \[$(tput sgr0)\]'
