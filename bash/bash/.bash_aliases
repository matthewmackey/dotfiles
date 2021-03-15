#-------------------------------------------------------------------------------
# [Bash]
#-------------------------------------------------------------------------------
BASH_DOT_HOME=~/bash

#-------------------------------------
# Bash - [Aliases]
#-------------------------------------
alias al="vi ${BASH_DOT_HOME}/.bash_aliases"
alias lal="vi ~/.local/.bash_aliases"
alias showal="command -v"
alias srca="source ${BASH_DOT_HOME}/.bash_aliases; \
  [ -f ~/.local/.bash_aliases ] && source ~/.local/.bash_aliases"
alias sa="srca"

#-------------------------------------
# Bash - [Env]
#-------------------------------------
alias bashenv="vi ${BASH_DOT_HOME}/.bash_env"
alias bashenvl="vi ~/.local/.bash_env"
alias srce="source ${BASH_DOT_HOME}/.bash_env; \
  [ -f ~/.local/.bash_env ] && source ~/.local/.bash_env"

#-------------------------------------
# Bash - [rc] files
#-------------------------------------
alias bashrc="vi ~/.bashrc"
alias bashrcc="vi ${BASH_DOT_HOME}/.bashrc.custom"
alias bashrcl="vi ~/.local/.bashrc"
alias srcrc="source ~/.bashrc"

#-------------------------------------
# [bin]
#-------------------------------------
alias bin="cd ~/bin"
alias lbin="cd ~/.local/bin"
alias mmbin="cd ~/mmbin"

#-------------------------------------
# [cd]
#-------------------------------------
alias debs="cd ~/downloads/debs"
alias cdb="cd -; cll"
alias cdl="cd -"
alias cdd="cd ../"
alias cddd="cd ../../"
alias cdddd="cd ../../../"
alias cddddd="cd ../../../../"

#-------------------------------------
# console - other
#-------------------------------------
alias cl="clear"
alias cll="clear; pwd; ll"
alias ct="clear; pwd; tree;"
alias h="history | grep "
alias ll="ls -alh"
alias mx="chmod +x"

################################################################################

#-------------------------------------------------------------------------------
# [tools]
#-------------------------------------------------------------------------------
alias ack-grep="ack"                  # backwards-compatibility for some scripts
alias clip="xclip -sel clip <"        # Copy flie contents to clipboard
alias cmv="command -v"
alias fr="file-roller"
alias image="eog"
alias lg="l | grep -i"                # search bashmarks
alias lgrep="lpass ls | grep -i"       # [LastPass]
alias op="xdg-open"
alias open="op"
alias syslog="tail -f /var/log/syslog"
alias treea="clear; tree -a"
alias treee="clear; tree -I .git"
alias treeea="clear; tree -I .git -a"
alias xdgo="op"
alias whatismyip="wget http://ipinfo.io/ip -qO -"

################################################################################

#-------------------------------------------------------------------------------
# [Ansible]
#-------------------------------------------------------------------------------
alias cows="export ANSIBLE_NOCOWS=0"
alias galaxy="ansible-galaxy"
alias nocows="export ANSIBLE_NOCOWS=1"
alias play="ansible-playbook"
alias rmretry="find . -name '*.retry' -exec rm {} \;"
alias vaulta="ansible-vault"

#-------------------------------------------------------------------------------
# [Chef]
#-------------------------------------------------------------------------------
_CHEFDK_BIN=/opt/chefdk/embedded/bin
alias be="bundle exec"
alias cu="cucumber"
alias food="chef exec $_CHEFDK_BIN/foodcritic -f any ."
alias rb="rbenv"
alias rubo="chef exec $_CHEFDK_BIN/rubocop -D"
#alias rs="$_CHEFDK_BIN -fd -c"

#-------------------------------------------------------------------------------
# [Deb]
#-------------------------------------------------------------------------------
alias apti="sudo apt-get install"
alias aptu="sudo apt-get update"
alias grepdpkg="dpkg -l | grep ^ii | grep"

#-------------------------------------------------------------------------------
# [Docker]
#-------------------------------------------------------------------------------
alias comp="docker-compose"
alias dclean="docker run -v /var/run/docker.sock:/var/run/docker.sock -v /var/lib/docker:/var/lib/docker --rm martin/docker-cleanup-volumes"
alias dcleandry="docker run -v /var/run/docker.sock:/var/run/docker.sock -v /var/lib/docker:/var/lib/docker --rm martin/docker-cleanup-volumes --dry-run"
alias dexec="docker exec -i -t"
alias dk="docker"
alias dps="clear; docker ps"
alias dpsa="clear; docker ps -a"
alias dpsaf="clear; dps -a --format 'table {{.Names}}\t{{.Image}}\t{{.Status}}\t{{.Ports}}'"
alias dpsf="clear; dps --format 'table {{.Names}}\t{{.Image}}\t{{.Status}}\t{{.Ports}}'"
alias dpsinfo="docker ps -q |xargs docker inspect --format '{{ printf \"%s\t\t|%s\t|%s\n\" .Name .Config.Hostname .HostConfig.NetworkMode }}'"
alias dpsl="docker ps -l"
alias drm="docker rm"
alias drmi="docker rmi"
alias drun="docker run"
alias dstart="docker start"
alias dstop="docker stop"
alias images="clear; docker images"
alias im="images"

#-------------------------------------------------------------------------------
# [Dotfiles]
#-------------------------------------------------------------------------------
alias commitaliases='cd ~/dotfiles/bash/bash; [ "$(git status -s | grep \"^A\" | wc -l)" != 0 ] && echo "Already staged files" || (git add .bash_aliases; git ci -m".bash_aliases: updated aliases")'
alias commitdesktop='cd ~/dotfiles/desktop; git add .local; git ci -m"desktop: updated .desktop shortcuts"'
alias commitgitignore='[ "$(git status -s | grep \"^A\" | wc -l)" != 0 ] && echo "Already staged files" || (git add .gitignore; git ci -m "Updated .gitignore")'
alias commitvimrc='cd ~/dotfiles/vim; git add .vimrc; git ci -m"vim: updated .vimrc"'
alias commitvscode='cd ~/dotfiles/vscode; git add .config; git ci -m"vscode: updated VSCode config settings"'

alias cs="createshortcut"

#-------------------------------------------------------------------------------
# [Git]
#-------------------------------------------------------------------------------
# SEE: https://git-scm.com/docs/gitrevisions for help on HEAD^, HEAD^2~, etc.
alias add="git add"
alias ga="git add"
alias gba="git branch -a"
alias gbav="git branch -av"
JS_GIT_EXCLUDES="':(exclude)package-lock.json' ':(exclude)yarn.lock'"
alias gdf="clear && git diff"
alias gdfj="clear && git diff -- $JS_GIT_EXCLUDES"
alias gdiff="gdf"
alias gd="clear && git diff --cached"
alias gdj="clear && git diff --cached -- $JS_GIT_EXCLUDES"
alias gg="git log --all --graph --decorate --oneline"
alias ggc="git log --all --graph --pretty=format:'%C(red)%h%C(reset) -%C(yellow)%d%C(reset) %s %C(green)(%cr) %C(bold blue)<%an>%Creset'"
alias glo="clear & git log"
alias gsh="clear && git show"
alias gst="clear && git status"
alias gl="git log --pretty=oneline"
alias pull="git pull"
alias push="git push"
alias remotes="clear; git remote -v"
alias rs="git restore"
alias rss="git restore --staged"


#-------------------------------------------------------------------------------
# [Maven]
#-------------------------------------------------------------------------------
alias mvcc="mvn clean compile"
alias mvci="mvn clean install"
alias mvcist="mvn clean install -DskipTests=true"
alias sbr="mvn spring-boot:run"

#-------------------------------------------------------------------------------
# [MySQL]
#-------------------------------------------------------------------------------
alias lmysql="mysql -h 0.0.0.0 -P 3306 -u root -ppw"

#-------------------------------------------------------------------------------
# [networking]
#-------------------------------------------------------------------------------
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
alias ssx='echo sudo ss -lp "sport = :domain"; sudo ss -lp "sport = :domain"'

#-------------------------------------------------------------------------------
# [node]
# [npm]
#-------------------------------------------------------------------------------
alias npml="npm ls --depth=0"

#-------------------------------------------------------------------------------
# [PHP]
#-------------------------------------------------------------------------------
alias php='docker run -it --rm --name php-cli-tmp php:latest php -a'
alias phpcli='php'
alias phpscript='docker run -it --rm --name php-script-tmp -v $PWD:/usr/src/myapp -w /usr/src/myapp php:latest php'

#-------------------------------------------------------------------------------
# [Python]
#-------------------------------------------------------------------------------
alias cleanpyc="find . -name '*.pyc' -print -exec rm {} \;"
alias wo="workon"

#-------------------------------------------------------------------------------
# [shortcuts]
#-------------------------------------------------------------------------------
alias down="cd ~/downloads"
alias desk="cd ~/Desktop"
alias glb="vi .gitlab-ci.yml"
alias openhome="xdg-open $HOME/srv/html/index.html >/dev/null 2>&1"
alias projects="vi ~/notes/projects.list"
alias vimrc="vi ~/.vimrc"

#-------------------------------------------------------------------------------
# [SSH]
#-------------------------------------------------------------------------------
alias sconf="vi ~/.ssh/config"
alias sconfl="vi ~/.ssh/config-local"
alias sdir="cd ~/.ssh"
alias rmsock="rm -rf ~/.ssh/sockets/*"

#-------------------------------------------------------------------------------
# [Terminals]
#-------------------------------------------------------------------------------
alias dark="setTermColor solarized-dark"
alias default="setTermColor Default"
alias light="setTermColor solarized-light"
alias tango="setTermColor Tango"

#-------------------------------------------------------------------------------
# [tmux]
#-------------------------------------------------------------------------------
# See ~/bin/tm
alias tml="tmux ls"
alias tmls="tmux ls"
alias tma="tmux attach -t"
alias tmd="tmux detach"
alias tmk="tmux kill-session"
alias 1="tmux select-window -t 1"
alias 2="tmux select-window -t 2"
alias 3="tmux select-window -t 3"
alias 4="tmux select-window -t 4"
alias 5="tmux select-window -t 5"
alias 6="tmux select-window -t 6"
alias 7="tmux select-window -t 7"
alias 8="tmux select-window -t 8"
alias 9="tmux select-window -t 9"

#-------------------------------------------------------------------------------
# [Vagrant]
# [VirtualBox]
# [VMs]
#-------------------------------------------------------------------------------
alias mpls="multipass ls"
alias mp="multipass"
alias mpsh="multipass shell"
alias vms="ll ~/virtualbox_vms"

