#
# pass.zsh
#
if [[ -f /usr/share/zsh/vendor-completions/_pass ]]; then
  mkdir_if_not_exist $ZSH_COMP_DIR
  cp /usr/share/zsh/vendor-completions/_pass $ZSH_COMP_DIR
fi
