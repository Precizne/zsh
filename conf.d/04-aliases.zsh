# Precizne

# Navigation and system
alias ..='cd ..'
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'
alias mkdir='mkdir -p'
alias fastfetch='fastfetch --logo-type kitty'

# Kitty clear fixes & typos
alias clear="printf '\033[2J\033[3J\033[1;1H'"
if [[ "$TERM" == "xterm-kitty" ]]; then alias ssh='kitten ssh'; fi

# Tool wrappers
if command -v eza &>/dev/null; then
    alias ls='eza -1 --icons=auto'
    alias l='eza -lh --icons=auto'
    alias la='eza -lha --icons=auto --sort=name --group-directories-first'
    alias ld='eza -lhD --icons=auto'
    alias lt='eza --icons=auto --tree'
fi

if command -v bat &>/dev/null; then
    alias -g -- h='-h 2>&1 | bat --language=help --style=plain --paging=never'
    alias cat='bat --style=plain --paging=never --color auto'
fi

_df() {
    if [[ $# -ge 1 && -e "${@: -1}" ]]; then duf "${@: -1}"; else duf; fi
}
if command -v duf &>/dev/null; then alias df='_df'; fi

# Quick commands
alias ex='exit'
alias nv='nvim'
alias ff='clear && fastfetch --logo-type kitty'
alias cl="printf '\033[2J\033[3J\033[1;1H'"
alias cls="printf '\033[2J\033[3J\033[1;1H' && eza -1 --icons=auto"
