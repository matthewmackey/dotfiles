#-------------------------------------------------------------------------------
# Bash
#-------------------------------------------------------------------------------
# Aliases
alias al="vi ~/.bash_aliases"
alias lal="vi ~/.local/.bash_aliases"
alias srca="source ~/.bash_aliases; source ~/.local/.bash_aliases"
alias sa="srca"

# cd
alias debs="cd ~/downloads/debs"

# Bin
alias bin="cd ~/bin"
alias lbin="cd ~/local/bin"
alias mbin="mmbin"
alias mmbin="cd ~/mmbin"

# Env
alias srce="source ~/.bash_env; source ~/local/.bash_env"
alias lenv="vi ~/.local/.bash_env"

# rc file
alias rc="vi ~/.bashrc"
alias crc="vi ~/.bashrc.custom"
alias lrc="vi ~/.local/.bashrc"

# Term
alias dark="setTermColor solarized-dark"
alias default="setTermColor Default"
alias light="setTermColor solarized-light"
alias tango="setTermColor Tango"

# Other
alias cl="clear"
alias cll="clear; pwd; ll"
alias cleanpyc="find . -name '*.pyc' -print -exec rm {} \;"
alias ct="clear; pwd; tree;"
alias down="cd ~/downloads"
alias fr="file-roller"
alias h="history | grep "
alias ll="ls -alh"
alias treeg="tree -I .git"
alias whatismyip="wget http://ipinfo.io/ip -qO -"

#-------------------------------------------------------------------------------
# Tools
#-------------------------------------------------------------------------------
alias image="eog"

#-------------------------------------------------------------------------------
# Ansible
#-------------------------------------------------------------------------------
alias cows="export ANSIBLE_NOCOWS=0"
alias galaxy="ansible-galaxy"
alias nocows="export ANSIBLE_NOCOWS=1"
alias play="ansible-playbook"
alias rmretry="find . -name '*.retry' -exec rm {} \;"

#-------------------------------------------------------------------------------
# Chef
#-------------------------------------------------------------------------------
_CHEFDK_BIN=/opt/chefdk/embedded/bin
alias be="bundle exec"
alias cu="cucumber"
alias food="chef exec $_CHEFDK_BIN/foodcritic -f any ."
alias rb="rbenv"
alias rubo="chef exec $_CHEFDK_BIN/rubocop -D"
alias rs="$_CHEFDK_BIN -fd -c"

#-------------------------------------------------------------------------------
# Docker
#-------------------------------------------------------------------------------
alias comp="docker-compose"
alias dclean="docker run -v /var/run/docker.sock:/var/run/docker.sock -v /var/lib/docker:/var/lib/docker --rm martin/docker-cleanup-volumes"
alias dcleandry="docker run -v /var/run/docker.sock:/var/run/docker.sock -v /var/lib/docker:/var/lib/docker --rm martin/docker-cleanup-volumes --dry-run"
alias dexec="docker exec -i -t"
alias dk="docker"
alias dps="docker ps"
alias dpsa="docker ps -a"
alias dpsl="docker ps -l"
alias drm="docker rm"
alias drun="docker run"
alias dstart="docker start"
alias dstop="docker stop"
alias images="docker images"

#-------------------------------------------------------------------------------
# Git
#-------------------------------------------------------------------------------
alias gba="git branch -a"
alias gbav="git branch -av"
alias gdf="clear && git diff"
alias gdfc="clear && git diff --cached"
alias gl="git log"
alias gst="clear && git status"
alias glogo="git log --pretty=oneline"
alias remotes="git remote -v"

#-------------------------------------------------------------------------------
# Linux
#-------------------------------------------------------------------------------
alias apti="sudo apt-get install"
alias aptu="sudo apt-get update"
alias grepdpkg="dpkg -l | grep ^ii | grep"

#-------------------------------------------------------------------------------
# Python
#-------------------------------------------------------------------------------
alias wo="workon"

#-------------------------------------------------------------------------------
# SSH
#-------------------------------------------------------------------------------
alias sconf="vi ~/.ssh/config"
alias sdir="cd ~/.ssh"
alias rmsock="rm -rf ~/.ssh/sockets/*"

#-------------------------------------------------------------------------------
# tmux
#-------------------------------------------------------------------------------
# See ~/bin/tm
alias tml="tmux ls"
alias tmls="tmux ls"
alias tma="tmux attach -t"
alias tmd="tmux detach"
alias tms="tmux switch -t"

#-------------------------------------------------------------------------------
# Vagrant / VirtualBox
#-------------------------------------------------------------------------------
alias vms="ll ~/VirtualBox\ VMs"

