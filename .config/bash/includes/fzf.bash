#
# fzf.bash
#

# Source completions if `interactive` session
[[ $- == *i* ]] && source "$FZF_HOME/shell/completion.bash" 2>/dev/null

source "$FZF_HOME/shell/key-bindings.bash"

FZF_MARKS_DIR=~/.config/fzf-marks
FZF_MARKS_PLUGIN=$FZF_MARKS_DIR/fzf-marks.plugin.bash

if [[ ! -f "$FZF_MARKS_PLUGIN" ]]; then
  mkdir_if_not_exist $FZF_MARKS_DIR

  # Make silent if non-interactive
  _curl_opts=" "
  if [[ $- != *i* ]]; then
    _curl_opts="-s "
  fi

  curl https://raw.githubusercontent.com/urbainvaes/fzf-marks/master/fzf-marks.plugin.bash \
    "$_curl_opts" \
    -o "$FZF_MARKS_PLUGIN"

  unset _curl_opts
fi

# Must be after `fzf` is on PATH
source "$FZF_MARKS_PLUGIN"


# vim: ft=bash
