#===================================================================================
# Disable running rest of .bashrc when NOT sourced in an interactive session
# (SCP will not work w/o this b/c I have 'echo' statements in my .bashrc)
#
# SEE: https://unix.stackexchange.com/a/18647/408519
#===================================================================================
[[ $- != *i* ]] && return


#===================================================================================
# NOTES
#===================================================================================
#--------------------------------------------------------------
# NOTE about "global" environment variables
#--------------------------------------------------------------
# To make env vars accessible by GUI/window manager, they need to be set on login??
#
# To achieve this, you can put a file in /etc/profile.d/<file_to_source>.sh.
# I did this to get JAVA_HOME configured for IntelliJ


#===================================================================================
# Helper Functions
#===================================================================================
# Show FDs:
#   lsof +f g -ap $BASHPID -d 0,1,2 2>/dev/null
source_file() {
  exec 3>/dev/null

  # Should be 1 or 3 -> not using `exec 2>/dev/null` above so that any errors
  # that occur in sourced files will still appear
  BASHRC_OUT_FD=1

  if [ -f "$1" ]; then
    printf "OK        -> ["~"/${1##${HOME}/}]\n" >&"$BASHRC_OUT_FD"
    source "$1"
  else
    printf "NOT FOUND -> ["~"/${1##${HOME}/}]\n" >&"$BASHRC_OUT_FD"
  fi

  exec 3>&-
}

#===================================================================================
# Source files
#===================================================================================
BASH_DOT_HOME=~/bash
source_file ${BASH_DOT_HOME}/.bashrc.20_04
source_file ${BASH_DOT_HOME}/.bash_env
source_file ${BASH_DOT_HOME}/.bashrc.custom
source_file ${BASH_DOT_HOME}/.bash_functions
source_file ${BASH_DOT_HOME}/.bash_aliases

# Override with any local changes
source_file ~/.local/.bashrc
source_file ~/.local/.bash_aliases
source_file ~/.local/.bash_env
source_file ~/.local/.bash_functions

# Source language/tool specific setup files
for _bashrc in $(find ${BASH_DOT_HOME}/ -name 'lang-*')
do
  source_file $_bashrc
done

# Source any Ansible-generated Bash files
ANSIBLE_BASHRC_DIR=~/.local/ansible_bash
if [ -d "$ANSIBLE_BASHRC_DIR" ]; then
  for _ansible_bashrc_file in $(ls $ANSIBLE_BASHRC_DIR/*)
  do
    source_file $_ansible_bashrc_file
  done
fi

# Source any custom LOCAL Bash files
LOCAL_CUSTOM_BASH_DIR=~/.local/bash_custom
if [ -d "$LOCAL_CUSTOM_BASH_DIR" ]; then
  for _local_custom_bashfile in $(ls $LOCAL_CUSTOM_BASH_DIR/*)
  do
    source_file $_local_custom_bashfile
  done
fi

