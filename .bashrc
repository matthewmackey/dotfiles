#--------------------------------#
# Local File Config
#--------------------------------#
source ~/dotfiles/shell/bashrc-20_04
source ~/dotfiles/shell/bashrc

eval "$(zoxide init bash)"


#--------------------------------#
# Dotfiles Config
#--------------------------------#

# Source COMMON
source ~/dotfiles/.rc

# Source BASH-specific
for bash_shell_file in ~/dotfiles/shell/*.bash
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
