# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/main/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Plugins
source ~/.config/zsh/zsh-autocomplete/zsh-autocomplete.plugin.zsh
source ~/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Custom scripting starts here
eval "$(zoxide init zsh)"
# Bash Prompt
eval "$(starship init zsh)"

alias cd='z'
alias ls='ls --color --group-directories-first'

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
fastfetch
echo
ls
