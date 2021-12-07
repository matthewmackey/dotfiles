#
# fzf.zsh
#
[[ $- == *i* ]] && source "$FZF_HOME/shell/completion.zsh" 2> /dev/null
source "$FZF_HOME/shell/key-bindings.zsh"

FZF_MARKS_DIR=~/.config/fzf-marks
FZF_MARKS_PLUGIN=$FZF_MARKS_DIR/fzf-marks.plugin.zsh

if [[ ! -f "$FZF_MARKS_PLUGIN" ]]; then
  mkdir_if_not_exist $FZF_MARKS_DIR
  curl https://raw.githubusercontent.com/urbainvaes/fzf-marks/master/fzf-marks.plugin.zsh \
    -o "$FZF_MARKS_PLUGIN"
fi

# Must be after `fzf` is on PATH
source "$FZF_MARKS_PLUGIN"
