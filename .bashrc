#--------------------------------#
# Local File Config
#--------------------------------#
set -o vi
eval "$(zoxide init bash)"

# Bashmarks
[ $(command -v l | grep alias) ] && unalias l
if [ ! -f ~/.local/bin/bashmarks.sh ]; then
  mkdir -p ~/.local/bin 2>/dev/null
  curl -o ~/.local/bin/bashmarks.sh "https://raw.githubusercontent.com/huyng/bashmarks/master/bashmarks.sh"
fi
source ~/.local/bin/bashmarks.sh


#--------------------------------#
# Dotfiles Config
#--------------------------------#
DOT_DIR=~/dotfiles

source ~/dotfiles/shell/bashrc-20_04

# Source COMMON
source $DOT_DIR/.rc

# Source BASH-specific
for bash_shell_file in $DOT_DIR/shell/*.bash
do
  echo "Sourcing -> [$bash_shell_file]"
  source "$bash_shell_file"
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
