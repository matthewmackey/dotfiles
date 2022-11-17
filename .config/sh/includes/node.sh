#
# node.sh
#

export NVM_HOME=$HOME/.nvm

# Create alias to lazy load NVM to keep shell load time down
# This loads NVM
#
# "source nvm"
alias sn='[ -s "$NVM_HOME/nvm.sh" ] && source "$NVM_HOME/nvm.sh"'
