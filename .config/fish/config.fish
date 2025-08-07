if status is-interactive

	# Enhanced navigation
	zoxide init fish | source
	alias cd='z && ls'

	alias ls='ls --color --group-directories-first'
	
	set -gx $EDITOR nvim
	alias vi='nvim'
	alias vim='nvim'

	# Prompt
	starship init fish | source

	# Yazi navigation shortcut
	function y
		set tmp (mktemp -t "yazi-cwd.XXXXXX")
		yazi $argv --cwd-file="$tmp"
		if read -z cwd < "$tmp"; and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
			builtin cd -- "$cwd"
		end
		rm -f -- "$tmp"
	end

	# Startup script
	set -g fish_greeting
	fastfetch
	echo
	ls
end
