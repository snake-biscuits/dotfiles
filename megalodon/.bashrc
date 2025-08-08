#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


# Shell options
shopt -s checkwinsize


# History
HISTCONTROL=ignoreboth
shopt -s histappend
HISTSIZE=1000
HISTFILESIZE=2000


# Prompt
PROMPT_DIRTRIM=3

case "$TERM" in
	xterm-color|*-256color) color_prompt=yes;;
esac

if [ -n "$force_color_prompt" ]; then
	if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
		color_prompt=yes
	else
		color_prompt=
	fi
fi

# PS1='[\u@\h \W]\$ '  # default
if [[ -z "$SSH_CONNECTION" ]] && [ "$color_prompt" = yes ]; then
    # local user, colour
 	PS1="\[\e[01;32m\]\A \[\e[01;36m\]\u\[\e[00m\]:\[\e[01;35m\]\w\[\e[00m\] \$ "
elif [ "$color_prompt" = yes ]; then
    # remote user, colour
 	PS1="\[\e[01;32m\]\A \[\e[01;36m\]\u\[\e[00m\]@\[\e[01;33m\]\H\[\e[00m\]:\[\e[01;35m\]\w\[\e[00m\] \$ "
elif [[ -n "$SSH_CONNECTION" ]]; then
    # remote user, no colour
 	PS1="\A \u@\H:\w \$ "
else
    # local user, no colour
	PS1="\A \u:\w \$ "
fi
unset color_prompt force_color_prompt

# Terminal Emulator Title
case "$TERM" in
xterm*|rxvt*)
	PS1="\[\e]0;\A: \w\a\]$PS1"
	;;
*)
	;;
esac

# add user scripts to PATH
PATH="${PATH}:/home/bikkie/.scripts"


# Aliases
# ls
alias ls='ls --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# tree
alias tree='tree -C'

# grep
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# less
alias less='less --raw'

# pacman
alias pacman='pacman --color=always'

# yay
alias yay='yay --color=always'

# xxd
alias xxd='xxd -R always'


# Exports
export TERM="xterm-256color"
export EDITOR="/usr/bin/nvim"
export SUDO_EDITOR="nvim"
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
