#-------------------------------------------------------------------------------
# ~/.bashrc
#-------------------------------------------------------------------------------

# Source env vars we always want in either an interactive OR non-interactive session
#
# NOTE: needed here b/c Bash doesn't have a .zshenv analog where this gets
#       sourced in a ZSH shell
source ~/.config/sh/env

#-------------------------------------------------------------------------------
# Simply RETURN when this is NOT sourced in an interactive session
# (SCP will not work w/o this b/c there are 'echo' statements in my .rc's)
#
# NOTE: Ansible runs in non-interactive session so this applies to Ansible as well
# SEE: https://unix.stackexchange.com/a/18647/408519
#-------------------------------------------------------------------------------
# If not running interactively, don't do anything
[[ $- != *i* ]] && return


[[ -f ~/.config/sh/rc ]] && source ~/.config/sh/rc

# Must be after interactive shell confirmation
printf "Sourcing -> [~/.config/bash/.bashrc]\n"


#---------------------------------------
# [GENERAL] {{{
#---------------------------------------
set -o vi

# Auto "cd" when entering just a path
shopt -s autocd 2> /dev/null

# Line wrap on window resize
shopt -s checkwinsize 2> /dev/null

# Case-insensitive tab completetion
bind 'set completion-ignore-case on'

# When displaying tab completion options, show just the remaining characters
bind 'set completion-prefix-display-length 2'

# Show tab completion options on the first press of TAB
bind 'set show-all-if-ambiguous on'
bind 'set show-all-if-unmodified on'


PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    source /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    source /etc/bash_completion
  fi
fi
# }}}


#---------------------------------------
# [HISTORY] {{{
#---------------------------------------
# append to the history file, don't overwrite it
shopt -s histappend

export HISTCONTROL="ignorespace:erasedups"
export HISTSIZE=10000
export HISTFILESIZE=10000

# Give history timestamps.
export HISTTIMEFORMAT="[%F %T] "
# }}}


#---------------------------------------
# [bashmarks] {{{
#---------------------------------------
BASHMARKS_SH=~/.local/bin/bashmarks.sh

[[ $(command -v l | grep alias) ]]  && unalias l
if [[ ! -f ~/.local/bin/bashmarks.sh ]]; then
  mkdir_if_not_exist ~/.local/bin
  curl -o $BASHMARKS_SH "https://raw.githubusercontent.com/huyng/bashmarks/master/bashmarks.sh"
fi
source $BASHMARKS_SH
# }}}


#---------------------------------------
# [directory management] {{{
#---------------------------------------
if which zoxide >&/dev/null; then
  eval "$(zoxide init bash)"
fi
# }}}


#---------------------------------------
# [SOURCE Bash Includes] {{{
#---------------------------------------
FILES_TO_SOURCE=()
FILES_TO_SOURCE+=($(find ~/.config/bash/includes-enabled -name '*.bash'))
FILES_TO_SOURCE+=($LOCAL_DOTDIR/bashrc)
FILES_TO_SOURCE+=($LOCAL_DOTDIR/aliases.bash)

for _file in ${FILES_TO_SOURCE[@]}; do
  # echo "[SKIPPING] source_file_if_exists $_file"
  source_file_if_exists $_file
done
# }}}


# [OTHER]
#source_local_dotfiles


# vim: ft=sh  foldlevel=0 foldmarker={{{,}}} foldmethod=marker
