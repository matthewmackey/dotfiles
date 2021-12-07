#
# fzf.bash
#
[[ $- == *i* ]] && source "$FZF_HOME/shell/completion.bash" 2> /dev/null
source "$FZF_HOME/shell/key-bindings.bash"

FZF_MARKS_DIR=~/.config/fzf-marks
FZF_MARKS_PLUGIN=$FZF_MARKS_DIR/fzf-marks.plugin.bash

if [[ ! -f "$FZF_MARKS_PLUGIN" ]]; then
  mkdir_if_not_exist $FZF_MARKS_DIR
  curl https://raw.githubusercontent.com/urbainvaes/fzf-marks/master/fzf-marks.plugin.bash \
    -o "$FZF_MARKS_PLUGIN"
fi

# Must be after `fzf` is on PATH
source "$FZF_MARKS_PLUGIN"
