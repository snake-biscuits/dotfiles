#
# ~/.bash_profile
#

export GDK_DISABLE=vulkan  # GTK4 fix

[[ -f ~/.bashrc ]] && . ~/.bashrc

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
    export XDG_CURRENT_DESKTOP=sway
	sway
fi
