echo "Sourcing -> ~/.config/zsh/.zprofile"

# Temp workaround for places like remote servers where xmodmap is not installed
if command -v xmodmap >/dev/null; then
  echo "Setting up Xmodmap"
  echo "  DISPLAY=$DISPLAY"
  if [ -f ~/.config/xmodmap/.Xmodmap ]; then
    xmodmap ~/.config/xmodmap/.Xmodmap
  else
    echo "  No ~/.config/xmodmap/.Xmodmap file found"
  fi
fi
