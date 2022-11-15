#!/bin/bash

set -e
set -o pipefail

# Override any DOTDIR currently set in environment since we are doing an install
# that is changing the DOTDIR to the standard set for this repository
export DOTDIR=~/.personal/dotfiles

source $DOTDIR/lib/common.sh
source $DOTDIR/lib/install.sh


usage() {
  cat <<EOF

NAME

  $0 - install dotfiles

DESCRIPTION

  -h  print this help message

  -m  setup a system with a minimal remote configuration

  -p setup a system with a full personal, local GUI configuration

EOF
}

# -------------------------------------------------------------------------------
#  MAIN
# -------------------------------------------------------------------------------
while getopts ":hmp" opt; do
  case "$opt" in
    h)
      usage
      ;;
    m)
      setupMinimalSystem
      ;;
    p)
      setupPersonalSystem
      ;;
    *)
      usage
      ;;
  esac
done
