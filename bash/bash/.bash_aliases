#-------------------------------------------------------------------------------
# Bash
#-------------------------------------------------------------------------------
BASH_DOT_HOME=~/bash

# Bash - Aliases
alias al="vi ${BASH_DOT_HOME}/.bash_aliases"
alias lal="vi ~/.local/.bash_aliases"
alias srca="source ${BASH_DOT_HOME}/.bash_aliases; \
  [ -f ~/.local/.bash_aliases ] && source ~/.local/.bash_aliases"
alias sa="srca"

# Bash - Env
alias bashenv="vi ${BASH_DOT_HOME}/.bash_env"
alias bashenvl="vi ~/.local/.bash_env"
alias srce="source ${BASH_DOT_HOME}/.bash_env; \
  [ -f ~/.local/.bash_env ] && source ~/.local/.bash_env"

# Bash - rc files
alias bashrc="vi ~/.bashrc"
alias bashrcc="vi ${BASH_DOT_HOME}/.bashrc.custom"
alias bashrcl="vi ~/.local/.bashrc"
alias srcrc="source ~/.bashrc"

# Bin
alias bin="cd ~/bin"
alias lbin="cd ~/.local/bin"
alias mmbin="cd ~/mmbin"

# cd
alias debs="cd ~/downloads/debs"
alias cdb="cd -; cll"
alias cdl="cd -"
alias cdd="cd ../"
alias cddd="cd ../../"
alias cdddd="cd ../../../"
alias cddddd="cd ../../../../"

#-------------------------------------
# Dotfiles-related
#-------------------------------------
alias commitaliases='cd ~/dotfiles/bash/bash; git add .bash_aliases; git ci -m".bash_aliases: updated aliases"'
alias commitdesktop='cd ~/dotfiles/desktop; git add .local; git ci -m"desktop: updated .desktop shortcuts"'
alias commitvimrc='cd ~/dotfiles/vim; git add .vimrc; git ci -m"vim: updated .vimrc"'

# LastPass
alias lgrep="lpass ls | grep -i"

# SHORTCUTS
alias cs="createshortcut"
alias cmv="command -v"
alias down="cd ~/downloads"
alias desk="cd ~/Desktop"
alias openhome="xdg-open $HOME/srv/html/index.html >/dev/null 2>&1"
alias projects="vi ~/notes/projects.list"

#---------------------------------
# Networking
#---------------------------------
alias hosts="cat /etc/hosts"
alias ns="sudo netstat -tlpn"
alias nsg="sudo netstat -tlpn | grep"
alias n8="nsproc 8080; echo; pxs"
alias proxyoff='proxytoggle off; { unset http_proxy; unset https_proxy; echo; proxystatus ; }'
alias proxyon='proxytoggle on; { . ~/mmbin/.proxy_env ; export http_proxy="http://$LOCAL_PROXY_HOST:$LOCAL_PROXY_PORT"; export https_proxy="http://$LOCAL_PROXY_HOST:$LOCAL_PROXY_PORT"; echo; proxystatus ; }'
alias pxoff="proxyoff"
alias pxon="proxyon"
alias pxs="proxystatus"
alias pxt="proxytoggle"

# Term
alias dark="setTermColor solarized-dark"
alias default="setTermColor Default"
alias light="setTermColor solarized-light"
alias tango="setTermColor Tango"

# Other
alias ack-grep="ack" # backwards-compatibility for some scripts
alias cl="clear"
alias cll="clear; pwd; ll"
alias cleanpyc="find . -name '*.pyc' -print -exec rm {} \;"
alias ct="clear; pwd; tree;"
alias fr="file-roller"
alias h="history | grep "
alias ll="ls -alh"
# search bashmarks
alias lg="l | grep -i"
alias op="xdg-open"
alias open="op"
alias treee="clear; tree -I .git"
alias treeea="clear; tree -I .git -a"
alias vimrc="vi ~/.vimrc"
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
alias vaulta="ansible-vault"

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
alias add="git add"
alias ga="git add"
alias gba="git branch -a"
alias gbav="git branch -av"
alias gdf="clear && git diff"
alias gd="clear && git diff --cached"
alias gdp="clear && git diff --cached -- ':(exclude)package-lock.json'"
alias gdiff="clear && git diff --cached"
alias glo="clear && git log"
alias gsh="clear && git show"
alias gst="clear && git status"
alias gl="clear && git log --pretty=oneline"
alias pull="git pull"
alias push="git push"
alias remotes="git remote -v"
alias rs="git restore --staged"

#-------------------------------------------------------------------------------
# Linux
#-------------------------------------------------------------------------------
alias apti="sudo apt-get install"
alias aptu="sudo apt-get update"
alias grepdpkg="dpkg -l | grep ^ii | grep"


#-------------------------------------------------------------------------------
# Maven
#-------------------------------------------------------------------------------
alias mvi="mvn clean install"
alias sbr="mvn spring-boot:run"

#-------------------------------------------------------------------------------
# MySQL
#-------------------------------------------------------------------------------
alias lmysql="mysql -h 0.0.0.0 -P 3306 -u root -ppw"

#-------------------------------------------------------------------------------
# node/npm
#-------------------------------------------------------------------------------
alias npml="npm ls --depth=0"

#-------------------------------------------------------------------------------
# PHP
#-------------------------------------------------------------------------------
alias php='docker run -it --rm --name php-cli-tmp php:latest php -a'
alias phpcli='php'
alias phpscript='docker run -it --rm --name php-script-tmp -v $PWD:/usr/src/myapp -w /usr/src/myapp php:latest php'

#-------------------------------------------------------------------------------
# Python
#-------------------------------------------------------------------------------
alias wo="workon"

#-------------------------------------------------------------------------------
# SSH
#-------------------------------------------------------------------------------
alias sconf="vi ~/.ssh/config"
alias sconfl="vi ~/.ssh/config-local"
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
alias tmk="tmux kill-session"
alias tms="tmux switch -t"

#-------------------------------------------------------------------------------
# Vagrant / VirtualBox
#-------------------------------------------------------------------------------
alias vms="ll ~/virtualbox_vms"

#-------------------------------------------------------------------------------
# VMs
#-------------------------------------------------------------------------------
alias mpls="multipass ls"
alias mp="multipass"
alias mpsh="multipass shell"
