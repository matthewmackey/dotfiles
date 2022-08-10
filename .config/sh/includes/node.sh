#
# node.sh
#

export NVM_DIR=$HOME/.nvm

if [ ! -f $NVM_DIR/nvm.sh ]; then
  if [ ! -d $NVM_DIR ]; then
    mkdir -p $NVM_DIR
  fi
   curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
fi

# Create alias to lazy load NVM to keep shell load time down
# This loads NVM
#
# "source nvm"
alias sn='[ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"'
