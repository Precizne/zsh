# Precizne

# ==============================
# Main ZSH Configuration Loader
# ==============================

# Clock start
zmodload zsh/datetime
ZSH_BOOT_START=$EPOCHREALTIME

# =================
# Oh My Zsh Engine
# =================
export ZSH="$HOME/.local/share/oh-my-zsh"

# Disable OMZ themes so Starship can take over seamlessly
ZSH_THEME=""

# Load OMZ Plugins
plugins=(sudo git zsh-completions fzf fzf-tab zsh-histdb zsh-autosuggestions F-Sy-H)
source $ZSH/oh-my-zsh.sh

# =============================
# Modular Configuration Loader
# =============================
# Source all configuration modules dynamically
for file in "${ZDOTDIR:-$HOME/.config/zsh}/conf.d/"*.zsh; do
    [ -f "$file" ] && [ -r "$file" ] && source "$file"
done

# =========================
# Post-Load & Integrations
# =========================
# Clock stop
export ZSH_BOOT_TIME_MS=$(printf "%.0f" $(( (EPOCHREALTIME - ZSH_BOOT_START) * 1000 )))

# Self destruct boot timer variable
autoload -Uz add-zsh-hook
_hide_boot_time() {
    unset ZSH_BOOT_TIME_MS
    add-zsh-hook -d preexec _hide_boot_time
}
add-zsh-hook preexec _hide_boot_time

# Trigger End4's automatic Hyprland startup
# if [ -f ~/.config/zshrc.d/auto-Hypr.sh ]; then
#     source ~/.config/zshrc.d/auto-Hypr.sh
# fi
