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
source ~/dotfiles/bash/bashrc-20_04
source ~/dotfiles/bash/bashrc
source ~/dotfiles/bash/env
source ~/dotfiles/bash/aliases

# Include any local changes
source ~/.local/bash/bashrc 2>/dev/null
source ~/.local/bash/env 2>/dev/null
source ~/.local/bash/aliases 2>/dev/null
