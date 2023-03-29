#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'


# \[ <whatever> \] won't count towards the character length of the prompt
PS1='\[\e[1;90m\][\[\e[1;91m\]\u\[\e[0m\]@\[\e[1;95m\]\h \[\e[1;96m\]\w\[\e[1;90m\]]\[\e[1;92m\]\$\[\e[0m\] '

alias la='ls -a --color=auto'

export QT_QPA_PLATFORMTHEME=qt5ct 
