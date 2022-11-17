# -------------------------------------------------------------------------------
# fzf.sh
# -------------------------------------------------------------------------------
export FZF_HOME=$HOME/.config/fzf

if [[ ! "$PATH" == *$FZF_HOME/bin* ]]; then
  export PATH="$FZF_HOME/bin:$PATH"
fi

# Use `--color=never` b/c otherwise Bash color escape codes show in fzf results
export FZF_DEFAULT_COMMAND="fdfind --follow --hidden --exclude '.git' --exclude 'node_modules' --color=never --type f"
export FZF_ALT_C_COMMAND="fdfind --follow --hidden --exclude '.git' --exclude 'node_modules' --color=never   --type d"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# FROM: https://betterprogramming.pub/boost-your-command-line-productivity-with-fuzzy-finder-985aa162ba5d#451c
export FZF_DEFAULT_OPTS="
--layout=reverse
--info=inline
--height=80%
--multi
--preview-window=:hidden
--preview '([[ -f {} ]] && (cat {})) || ([[ -d {} ]] && (tree -C {} | less)) || echo {} 2> /dev/null | head -200'
--color='hl:148,hl+:154,pointer:032,marker:010,bg+:237,gutter:008'
--prompt='∼ ' --pointer='▶' --marker='✓'
--bind '?:toggle-preview'
--bind 'ctrl-a:select-all'
--bind 'ctrl-y:execute-silent(echo {+} | xclip -i -sel clip)'
--bind 'ctrl-e:execute(echo {+} | xargs -o vim)'
--bind 'ctrl-v:execute(code {+})'
--bind 'ctrl-f:page-down,ctrl-b:page-up'
"
# --preview '([[ -f {} ]] && (batcat --style=numbers --color=always {} || cat {})) || ([[ -d {} ]] && (tree -C {} | less)) || echo {} 2> /dev/null | head -200'

# vim: ft=bash
