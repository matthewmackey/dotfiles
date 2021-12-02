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
# export ZSH="$HOME/.oh-my-zsh"
# ZSH_THEME="robbyrussell"

# plugins=(copydir copyfile git kubectl vi-mode)
# VI_MODE_RESET_PROMPT_ON_MODE_CHANGE=true
# VI_MODE_SET_CURSOR=true
# MODE_INDICATOR="%F{yellow}<<<%f"

# source $ZSH/oh-my-zsh.sh

# Fix git paging issues w/ oh-my-zsh
# https://superuser.com/questions/820943/typing-git-log-oneline-in-oh-my-zsh-pipes-to-less
unset LESS


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
  # timer=$(($(date +%s%N)/1000000))
  source "$zsh_shell_file"
  # now=$(($(date +%s%N)/1000000))
  # elapsed=$(($now-$timer))
  # echo $elapsed
done

# Must be sourced after fzf.zsh is b/c that file puts `fzf` on the PATH, which
# this plugin requires to be on the PATH in order to be sourced properly
source "$FZF_MARKS_PLUGIN"

source ~/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Reload any completions that were loaded
autoload -U compinit && compinit

# Source LOCAL (files in local dir that can be source-controlled)
if [ -f ~/.local/dot/rc ]; then
  echo "Sourcing -> [~/.local/dot/rc]"
  # timer=$(($(date +%s%N)/1000000))
  source ~/.local/dot/rc
  # now=$(($(date +%s%N)/1000000))
  # elapsed=$(($now-$timer))
  # echo $elapsed
fi
if [ -f ~/.local/dot/aliases ]; then
  echo "Sourcing -> [~/.local/dot/aliases]"
  # timer=$(($(date +%s%N)/1000000))
  source ~/.local/dot/aliases
  # now=$(($(date +%s%N)/1000000))
  # elapsed=$(($now-$timer))
  # echo $elapsed
fi

# SPACESHIP
# fpath=( ~/.config/zsh/.zfunctions $fpath )

# if [ ! -L ~/.config/zsh/.zfunctions/prompt_spaceship_setup ]; then
#   ln -sf ~/.config/zsh/spaceship-prompt/spaceship.zsh ~/.config/zsh/.zfunctions/prompt_spaceship_setup
# fi
# autoload -U promptinit; promptinit
# prompt spaceship
# SPACESHIP_DIR_TRUNC_REPO=false
# SPACESHIP_KUBECTL_VERSION_SHOW=false
# SPACESHIP_KUBECTL_SHOW=true
# SPACESHIP_GCLOUD_SHOW=false
# SPACESHIP_VENV_PREFIX="("
# SPACESHIP_VENV_SUFFIX=")"

export STARSHIP_CONFIG=~/.config/starship/config.toml
eval "$(starship init zsh)"

