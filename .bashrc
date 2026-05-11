# .bashrc

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

# -- Custom Scripting Starts Here --

export EDITOR=zed
export VISUAL=zed

alias ls='ls --color --group-directories-first'

function cd() {
	if [ -n "$1" ]; then
		z "$@"
	else
		z ~
	fi
	ls
}

# Custom startup
if [ $(tput lines) -ge 30 ]; then
	fastfetch
	echo
fi
ls

eval "$(starship init bash)"
eval "$(zoxide init bash)"

. "$HOME/.cargo/env"
