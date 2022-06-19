_KEY_UNLOCK_TIMEOUT="2h"

if ! pgrep -u "$USER" ssh-agent > /dev/null; then
  ssh-agent -t "$_KEY_UNLOCK_TIMEOUT" > "$XDG_RUNTIME_DIR/ssh-agent.env"
fi

# Always seem to need to source b/c in tmux a new pane will inherit
# SSH_AUTH_SOCK from prior pane however that inheritance doesn't seem to be
# enough to properly connect clients (like `ssh-add`) to the agent so the
# sourcing in the if-block below will not properly occur & clients cannot
# connect to the agent in new tmux panes
source "$XDG_RUNTIME_DIR/ssh-agent.env" >/dev/null
# if [ ! "$SSH_AUTH_SOCK" ]; then
#   source "$XDG_RUNTIME_DIR/ssh-agent.env" >/dev/null
# fi

unset _KEY_UNLOCK_TIMEOUT
