# Precizne

# SSH and GPG agents
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
export GPG_TTY=$(tty)

# End4 terminal colors
if [ -f ~/.config/zshrc.d/dots-hyprland.zsh ]; then
    source ~/.config/zshrc.d/dots-hyprland.zsh
fi

# Zoxide
eval "$(zoxide init zsh --cmd cd)"

# Starship prompt
if command -v starship &>/dev/null; then
    eval "$(starship init zsh)"
fi
