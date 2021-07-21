if command -v ~/.rbenv/bin/rbenv >/dev/null; then
  export RBENV_ROOT=~/.rbenv
  export PATH="$RBENV_ROOT/bin:$PATH"

  eval "$(~/.rbenv/bin/rbenv init - bash)"
fi
