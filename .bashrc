#-------------------------------------------------------------------------------
# Simply RETURN when .bashrc is NOT sourced in an interactive session
# (SCP will not work w/o this b/c I have 'echo' statements in my .bashrc)
#
# NOTE: Ansible runs in non-interactive session so this applies to Ansible as well
# SEE: https://unix.stackexchange.com/a/18647/408519
#-------------------------------------------------------------------------------
# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Use Ubuntu 20.04 as base .bashrc config
source ~/dotfiles/bash/20_04
source ~/dotfiles/bash/rc
source ~/dotfiles/bash/aliases
source ~/dotfiles/bash/path

source ~/dotfiles/bash/common/base16-shell.bash
source ~/dotfiles/bash/common/bashmarks.bash
source ~/dotfiles/bash/common/colors.bash
source ~/dotfiles/bash/common/git.bash
source ~/dotfiles/bash/common/ssh_completion.bash
source ~/dotfiles/bash/common/ssh_prompt.bash
source ~/dotfiles/bash/common/vim_prompt.bash

# Include any local changes
source ~/.local/bash/rc 2>/dev/null
source ~/.local/bash/aliases 2>/dev/null
