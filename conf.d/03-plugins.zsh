# Precizne

# Directory aware suggestions
export HISTDB_FILE="${XDG_STATE_HOME:-$HOME/.local/state}/zsh/zsh-history.db"
[ ! -d "$(dirname "$HISTDB_FILE")" ] && mkdir -p "$(dirname "$HISTDB_FILE")"

_zsh_autosuggest_strategy_histdb_top() {
    local query="
        select commands.argv from history
        left join commands on history.command_id = commands.rowid
        left join places on history.place_id = places.rowid
        where places.dir like '$(sql_escape $PWD)'
        and commands.argv like '$(sql_escape $1)%'
        group by commands.argv
        order by max(history.rowid) desc limit 1
    "
    suggestion=$(_histdb_query "$query" 2>/dev/null)
}
ZSH_AUTOSUGGEST_STRATEGY=(histdb_top history completion)
