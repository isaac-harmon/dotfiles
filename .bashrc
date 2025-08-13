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

# Enhanced navigation
eval "$(zoxide init bash)"

cd() {
	if [ -n "$1" ]; then
		z "$@"
	else
		z ~
	fi
	ls
}

alias ls='ls --color --group-directories-first'

# Bash Prompt
eval "$(starship init bash)"

# Editor settings
export EDITOR="nvim"
alias vi='nvim'
alias vim='nvim'

# Yazi cd to directory on exit
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd" && echo && ls
	rm -f -- "$tmp"
}

# Startup Script
ls
