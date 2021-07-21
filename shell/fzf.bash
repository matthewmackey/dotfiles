# ------------------------
# Bash: Auto-completion
# ------------------------
[[ $- == *i* ]] && source "$HOME/.fzf/shell/completion.bash" 2> /dev/null

# ------------------------
# Bash: Key bindings
# ------------------------
source "$HOME/.fzf/shell/key-bindings.bash"
#declare -F |grep fzf
