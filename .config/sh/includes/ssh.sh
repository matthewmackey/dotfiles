# ------------------------------------------------------------------------------
#
# Note that X starts an SSH agent by default if one does not exist (event if we
# disable GNOME Session's SSH agent it seems).  This is controlled by a
# `use-ssh-agent` option in `/etc/X11/Xsession.options` (see man Xsession.options)
#
# root        6149    1953  0 Aug31 ?        00:00:00     gdm-session-worker [pam/gdm-password]
# mmachaj     8068    6149  0 Aug31 tty2     00:00:00       /usr/lib/gdm3/gdm-x-session --run-script env GNOME_SHELL_SESSION_MODE=ubuntu /usr/bin/gnome-session --systemd --session=ubuntu
# root        8071    8068  0 Aug31 tty2     00:04:34         /usr/lib/xorg/Xorg vt2 -displayfd 3 -auth /run/user/1000/gdm/Xauthority -background none -noreset -keeptty -verbose 3
# mmachaj     9193    8068  0 Aug31 tty2     00:00:00         /usr/libexec/gnome-session-binary --systemd --systemd --session=ubuntu
# mmachaj     9352    9193  0 Aug31 ?        00:00:00           /usr/bin/ssh-agent /usr/bin/im-launch env GNOME_SHELL_SESSION_MODE=ubuntu /usr/bin/gnome-session --systemd --session=ubuntu
#
# Therefore, we are just going to always create our own SSH agent instance, even
# if that means we are running 2x SSH agent instances.  This was done because I
# don't know how to grab the SSH agent info for th X11 ssh-agent.
#
# ------------------------------------------------------------------------------
_CUSTOM_SSH_AGENT_ENV="$XDG_RUNTIME_DIR/ssh-agent.env"
_KEY_UNLOCK_TIMEOUT="2h"

# if ! pgrep -u "$USER" ssh-agent > /dev/null; then
if [ ! -f $_CUSTOM_SSH_AGENT_ENV ]; then
  ssh-agent -t "$_KEY_UNLOCK_TIMEOUT" > "$XDG_RUNTIME_DIR/ssh-agent.env"
else
  # Always seem to need to source b/c in tmux a new pane will inherit
  # SSH_AUTH_SOCK from prior pane however that inheritance doesn't seem to be
  # enough to properly connect clients (like `ssh-add`) to the agent so the
  # sourcing in the if-block below will not properly occur & clients cannot
  # connect to the agent in new tmux panes
  source "$XDG_RUNTIME_DIR/ssh-agent.env" >/dev/null
  # if [ ! "$SSH_AUTH_SOCK" ]; then
  #   source "$XDG_RUNTIME_DIR/ssh-agent.env" >/dev/null
  # fi
fi

unset _CUSTOM_SSH_AGENT_ENV
unset _KEY_UNLOCK_TIMEOUT
