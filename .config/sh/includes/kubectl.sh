if [ -d ~/.krew ]; then
  export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
fi
