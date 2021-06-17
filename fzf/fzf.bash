if command -v fzf >/dev/null; then
  source /usr/share/doc/fzf/examples/completion.bash 2>/dev/null
  source /usr/share/doc/fzf/examples/key-bindings.bash 2>/dev/null

  # Use `--color=never` b/c otherwise Bash color escape codes show in fzf results
  export FZF_DEFAULT_COMMAND='fdfind --type f --follow --hidden --exclude .git --color=never'
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
  export FZF_ALT_C_COMMAND='fdfind --type d . --follow --hidden --exclude .git --color=never'

  export FZF_DEFAULT_OPTS='
    --height 75% --multi --reverse
    --bind ctrl-f:page-down,ctrl-b:page-up
  '
fi
