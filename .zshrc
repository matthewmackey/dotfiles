export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"

plugins=(git)

source $ZSH/oh-my-zsh.sh

# Source COMMON
source ~/dotfiles/.rc

# Source ZSH-specific
# for zsh_shell_file in ~/dotfiles/shell/*.zsh
# do
#   echo "Sourcing -> [$zsh_shell_file]"
#   source "$zsh_shell_file"
# done

# Source LOCAL (files in local dir that can be source-controlled)
if [ -f ~/.local/dot/rc ]; then
  echo "Sourcing -> [~/.local/dot/rc]"
  source ~/.local/dot/rc
fi
if [ -f ~/.local/dot/aliases ]; then
  echo "Sourcing -> [~/.local/dot/aliases]"
  source ~/.local/dot/aliases
fi
