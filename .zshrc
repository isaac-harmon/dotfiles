export EDITOR=zed
export VISUAL=zed

export CLICOLOR=1

# Navigation QoL Changes
alias cd=z

chpwd() {
    echo
    ls
}

# Startup prompt
if [[ $(tput lines) -ge 27 ]]; then
    fastfetch
    echo
fi
ls

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
