#!/bin/bash

set -e
set -o pipefail

SCRIPT_DIR=$(cd $(dirname $0); pwd)

source $SCRIPT_DIR/lib/common.sh

#-------------------------------#
# MAIN                          #
#-------------------------------#

# NOT for remote machines - TODO figure out how to flag when to run these
#./ssh/install.sh
