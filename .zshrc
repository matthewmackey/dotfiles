#--------------------------------#
# Local File Config
#--------------------------------#
# See: https://scriptingosx.com/2019/06/moving-to-zsh-part-3-shell-options/
HISTFILE=${ZDOTDIR:-$HOME}/.zsh_history
SAVEHIST=5000
HISTSIZE=2000
setopt appendhistory
setopt autocd
setopt nocaseglob
setopt correct
setopt correctall
setopt extendedhistory
setopt incappendhistory
setopt histexpiredupsfirst
setopt histignoredups
setopt histreduceblanks
setopt histverify
setopt sharehistory

eval "$(zoxide init zsh)"

FZF_MARKS_PLUGIN=~/.fzf-marks.plugin.zsh
if [ ! -f "$FZF_MARKS_PLUGIN" ]; then
  curl https://raw.githubusercontent.com/urbainvaes/fzf-marks/master/fzf-marks.plugin.zsh \
    -o "$FZF_MARKS_PLUGIN"
fi


#--------------------------------#
# Oh My Zsh Config
#--------------------------------#
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"

plugins=(copydir copyfile git vi-mode)
VI_MODE_RESET_PROMPT_ON_MODE_CHANGE=true
VI_MODE_SET_CURSOR=true
MODE_INDICATOR="%F{yellow}<<<%f"

source $ZSH/oh-my-zsh.sh


#--------------------------------#
# Dotfiles Config
#--------------------------------#
DOT_DIR=~/dotfiles

# Source COMMON
source $DOT_DIR/.rc

# Source ZSH-specific aliases
source $DOT_DIR/shell/zsh.aliases

# Source ZSH-specific
for zsh_shell_file in $DOT_DIR/shell/*.zsh
do
  echo "Sourcing -> [$zsh_shell_file]"
  source "$zsh_shell_file"
done

# Must be sourced after fzf.zsh is b/c that file puts `fzf` on the PATH, which
# this plugin requires to be on the PATH in order to be sourced properly
source "$FZF_MARKS_PLUGIN"

# Source LOCAL (files in local dir that can be source-controlled)
if [ -f ~/.local/dot/rc ]; then
  echo "Sourcing -> [~/.local/dot/rc]"
  source ~/.local/dot/rc
fi
if [ -f ~/.local/dot/aliases ]; then
  echo "Sourcing -> [~/.local/dot/aliases]"
  source ~/.local/dot/aliases
fi
