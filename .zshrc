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
setopt sharedhistory

#--------------------------------#
# Oh My Zsh Config
#--------------------------------#
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"

plugins=(git)

source $ZSH/oh-my-zsh.sh


#--------------------------------#
# Dotfiles Config
#--------------------------------#
DOT_DIR=~/dotfiles

# Source COMMON
source $DOT_DIR/.rc

# Source ZSH-specific
for zsh_shell_file in $DOT_DIR/shell/*.zsh
do
  echo "Sourcing -> [$zsh_shell_file]"
  source "$zsh_shell_file"
done

# Source LOCAL (files in local dir that can be source-controlled)
if [ -f ~/.local/dot/rc ]; then
  echo "Sourcing -> [~/.local/dot/rc]"
  source ~/.local/dot/rc
fi
if [ -f ~/.local/dot/aliases ]; then
  echo "Sourcing -> [~/.local/dot/aliases]"
  source ~/.local/dot/aliases
fi