# .bashrc

alias ls='ls --color --group-directories-first'

function cd() {
	if [ -n "$1" ]; then
		z "$@"
	else
		z ~
	fi
	ls
}

export EDITOR=vim
export VISUAL=vim

# Startup Script
eval "$(starship init bash)"
eval "$(zoxide init bash)"

if [ $(tput lines) -ge 30 ]; then
	fastfetch
	echo
fi
ls

# -- Custom Scripting Ends Here --

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc

. "$HOME/.cargo/env"
