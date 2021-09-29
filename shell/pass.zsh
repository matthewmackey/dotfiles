COMP_DIR=~/.oh-my-zsh/completions

if [ -f /usr/share/zsh/vendor-completions/_pass ]; then
  if [ ! -d "$COMP_DIR" ]; then
    mkdir -p "$COMP_DIR"
  fi
  cp /usr/share/zsh/vendor-completions/_pass "$COMP_DIR"/
fi
