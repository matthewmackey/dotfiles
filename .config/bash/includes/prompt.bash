#
# prompt.bash
#

#---------------------------#
# PROMPT - SSH              #
#---------------------------#
# Change prompt if session is remote
if [ -n "$BASH" ]; then
  # See: https://unix.stackexchange.com/a/9607/408519
  if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
    SESSION_TYPE=remote/ssh
  else
    case $(ps -o comm= -p $PPID) in
      sshd|*/sshd) SESSION_TYPE=remote/ssh;;
    esac
  fi

  ESC_START="\033["
  PURPLE="${ESC_START}0;35m"
  NC="${ESC_START}0m"

  #  Search '/PROMPTING' in `man bash` for info on PS1 prompt variables
  if [ "$SESSION_TYPE" = "remote/ssh" ]; then
    # Change Green (32) -> Purple (35) or Red (31)
    #  export PS1=$(echo "$PS1" | sed 's/1;32m/1;31m/')
    export PS1="${PURPLE}[ssh]${NC}${PS1}"
  fi
fi


#---------------------------#
# PROMPT - Vim              #
#---------------------------#
# Change prompt if entering Shell from Vim `:sh`
if [ -n "$BASH" ]; then
  ESC_START="\033["
  RED="${ESC_START}0;31m"
  NC="${ESC_START}0m"

  # Alter prompt if in SHELL via Vim
  # SEE: https://stackoverflow.com/a/19124531/14209903
  if [ "$VIM" ]; then
    PS1="${RED}(vim)${NC}${PS1}"
  fi
fi
