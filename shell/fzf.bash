# Setup fzf
# ---------
if [[ ! "$PATH" == */home/mmackey/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/mmackey/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/mmackey/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/home/mmackey/.fzf/shell/key-bindings.bash"
