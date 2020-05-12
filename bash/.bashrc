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
    echo "Executing -> [$1]"
    source "$1"
  else
    echo "Non-existent -> [$1]"
  fi
}


#===================================================================================
# Source files
#===================================================================================
source_file ~/.bashrc.20_04             # this sources ~/.bash_aliases
source_file ~/.bashrc.custom
source_file ~/.bash_env
source_file ~/.bash_functions

# Override with any local changes
source_file ~/.local/.bashrc
source_file ~/.local/.bash_aliases
source_file ~/.local/.bash_env
source_file ~/.local/.bash_functions

EXTRA_BIN_DIRS_FILE=~/local/extra_bin_dirs
if [ -f "$EXTRA_BIN_DIRS_FILE" ]; then
  for dir in $(cat "$EXTRA_BIN_DIRS_FILE"); do
    [ -d $dir ] && PATH="$dir:$PATH"
  done
fi
