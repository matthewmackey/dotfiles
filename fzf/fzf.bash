if [ ! -d ~/.fzf ]; then
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  ~/.fzf/install --no-zsh --no-fish --key-bindings --completion --no-update-rc
fi

if [ -f ~/.fzf.bash ]; then
  source ~/.fzf.bash
fi

# Use `--color=never` b/c otherwise Bash color escape codes show in fzf results
export FZF_DEFAULT_COMMAND="fdfind --type f --follow --hidden --exclude '.git' --exclude 'node_modules' --color=never"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND='fdfind --type d . --follow --hidden --exclude .git --color=never'
export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND --type d"

# FROM:
# https://betterprogramming.pub/boost-your-command-line-productivity-with-fuzzy-finder-985aa162ba5d#451c
export FZF_DEFAULT_OPTS="
--layout=reverse
--info=inline
--height=80%
--multi
--preview-window=:hidden
--preview '([[ -f {} ]] && (batcat --style=numbers --color=always {} || cat {})) || ([[ -d {} ]] && (tree -C {} | less)) || echo {} 2> /dev/null | head -200'
--color='hl:148,hl+:154,pointer:032,marker:010,bg+:237,gutter:008'
--prompt='∼ ' --pointer='▶' --marker='✓'
--bind '?:toggle-preview'
--bind 'ctrl-a:select-all'
--bind 'ctrl-y:execute-silent(echo {+} | pbcopy)'
--bind 'ctrl-e:execute(echo {+} | xargs -o vim)'
--bind 'ctrl-v:execute(code {+})'
--bind 'ctrl-f:page-down,ctrl-b:page-up'
"
