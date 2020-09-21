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
source_file() {
  if [ -f "$1" ]; then
    echo -e "OK        -> ["~"/${1##/home/mmackey/}]"
    source "$1"
  else
    echo -e "NOT FOUND -> ["~"/${1##/home/mmackey/}]"
  fi
}


#===================================================================================
# Source files
#===================================================================================
BASH_DOT_HOME=~/bash
source_file ${BASH_DOT_HOME}/.bashrc.20_04
source_file ${BASH_DOT_HOME}/.bashrc.custom
source_file ${BASH_DOT_HOME}/.bash_env
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

