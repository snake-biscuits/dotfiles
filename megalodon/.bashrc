# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac


# Shell options
shopt -s checkwinsize


# History
HISTCONTROL=ignoreboth
shopt -s histappend
HISTSIZE=1000
HISTFILESIZE=2000


# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi


# Prompt
PROMPT_DIRTRIM=3
export TERM="xterm-256color"

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

# TODO: include debianchroot
# PS1='[\u@\h \W]\$ '  # default
if [[ -z "$SSH_CONNECTION" ]] && [ "$color_prompt" = yes ]; then
    # local user, colour
 	PS1="\[\e[01;32m\]\A \[\e[01;33m\]\u\[\e[00m\]:\[\e[01;36m\]\w\[\e[00m\] \$ "
elif [ "$color_prompt" = yes ]; then
    # remote user, colour
 	PS1="\[\e[01;32m\]\A \[\e[01;33m\]\u\[\e[00m\]@\[\e[01;31m\]\H\[\e[00m\]:\[\e[01;36m\]\w\[\e[00m\] \$ "
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

# stackoverflow lines between prompts magic
PROMPT_COMMAND="export PROMPT_COMMAND=echo"
alias clear="clear; export PROMPT_COMMAND='export PROMPT_COMMAND='echo''"


# extend PATH
# rust binaries
# PATH="${PATH}:/home/bikkie/.cargo/bin"
# user scripts
PATH="${PATH}:/home/bikkie/.scripts"
PATH="$HOME/.nix-profile/bin:$PATH"

# add ~/.nix-profile/share to XDG_DATA_DIRS
XDG_DATA_DIRS="$HOME/.nix-profile/share:$XDG_DATA_DIRS"


# Aliases
alias ls='exa --colour=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# tree
alias tree='exa --colour=auto -T'
alias lt='exa -lT'  # ll + tree

# grep
alias grep='grep --colour=auto'
alias egrep='egrep --colour=auto'
alias fgrep='fgrep --colour=auto'

# less
alias less='less --raw'

# xxd
alias xxd='xxd -R always'

# vimwiki
alias vimwiki='vim -c "VimwikiIndex"'

# utils
alias bat='batcat'
alias fetch='pikafetch'

# Exports
export EDITOR="/usr/bin/nvim"
# export SUDO_EDITOR="nvim"
# export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

# colored GCC warnings and errors
# export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
