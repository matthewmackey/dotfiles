# Temp workaround for places like remote servers where xmodmap is not installed
if command -v xmodmap >/dev/null; then
  xmodmap ~/.config/xmodmap/.xmodmap-switch_no_escape
fi
