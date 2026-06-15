# Precizne

# Text editing shortcuts
bindkey '\e[H' beginning-of-line
bindkey '\e[F' end-of-line

# Load the cursor-to-end wrapper
autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end

# Arrow key prefix searching (forces cursor to end of line)
bindkey '^[[A' history-beginning-search-backward-end
bindkey '^[[B' history-beginning-search-forward-end

# Fallback bindings for some terminal emulators
bindkey '^[OA' history-beginning-search-backward-end
bindkey '^[OB' history-beginning-search-forward-end

# Source shortcuts from End4 config
if [ -f ~/.config/zshrc.d/shortcuts.zsh ]; then
    source ~/.config/zshrc.d/shortcuts.zsh
fi
