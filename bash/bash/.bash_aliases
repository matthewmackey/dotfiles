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
alias cdddddd="cd ../../../../../"

# Go up directories then do directory listing
alias cddl="cdd; cll "
alias cdddl="cddd; cll "
alias cddddl="cdddd; cll "
alias cdddddl="cddddd; cll"
alias cddddddl="cdddddd; cll "

# Go up directories then change to directory specified after alias on command-line
alias cddf="cdd; cd "
alias cdddf="cddd; cd "
alias cddddf="cdddd; cd "
alias cdddddf="cddddd; cd "
alias cddddddf="cdddddd; cd "

#-------------------------------------
# console - other
#-------------------------------------
alias cl="clear"
alias cll="cl; pwd; ll"
alias ct="cl; pwd; tree;"
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
alias fd="fdfind"
alias fr="file-roller"
alias image="eog"
alias lg="l | grep -i"                # search bashmarks
alias lgrep="lpass ls | grep -i"       # [LastPass]
alias op="xdg-open"
alias open="op"
alias pg="ps -efH | grep"
alias syslog="tail -f /var/log/syslog"
alias treea="cl; tree -a"
alias treee="cl;  tree -I '.git|build|dist|node_modules'"
alias treeea="cl; tree -I '.git|build|dist|node_modules' -a"
alias whatismyip="wget http://ipinfo.io/ip -qO -"
alias xdgo="op"
alias yq="docker run --name yqtmp --rm -v"${PWD}":/workdir mikefarah/yq"

#------------------------------------
# [systemctl]
#------------------------------------
alias ctl="sudo systemctl"
alias logs="sudo journalctl -u"
alias status="sudo systemctl status"

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
alias dps="cl; docker ps"
alias dpsa="cl; docker ps -a"
alias dpsaf="cl; dps -a --format 'table {{.Names}}\t{{.Image}}\t{{.Status}}\t{{.Ports}}'"
alias dpsf="cl; dps --format 'table {{.Names}}\t{{.Image}}\t{{.Status}}\t{{.Ports}}'"
alias dpsinfo="docker ps -q |xargs docker inspect --format '{{ printf \"%s\t\t|%s\t|%s\n\" .Name .Config.Hostname .HostConfig.NetworkMode }}'"
alias dpsl="docker ps -l"
alias drm="docker rm"
alias drmi="docker rmi"
alias drun="docker run"
alias dstart="docker start"
alias dstop="docker stop"
alias images="cl; docker images"
alias im="images"
alias up="docker-compose up"
alias upd="docker-compose up -d"

alias dpass="docker-credential-pass"

#-------------------------------------------------------------------------------
# [Dotfiles]
#-------------------------------------------------------------------------------
IS_GIT_STAGED='[ "$(git status -s | grep "^A" | wc -l)" != 0 ] && (echo -e "CANNOT: already staged files\n"; git status -s) ||'

alias commitaliases='cd ~/dotfiles/bash/bash; '$IS_GIT_STAGED' (git add .bash_aliases; git ci -m"bash_aliases: updated aliases"); cd -'
alias commitbashrc='cd ~/dotfiles/bash/;      '$IS_GIT_STAGED' (git add .bashrc; git ci -m"bashrc: updated"); cd -'
alias commitdesktop='cd ~/dotfiles/desktop;   '$IS_GIT_STAGED' (git add .local; git ci -m"desktop: updated .desktop shortcuts"); cd -'
alias commitgitconf='cd ~/dotfiles/git;       '$IS_GIT_STAGED' (git add .gitconfig; git ci -m"git: updated .gitconfig"); cd -'
alias committmux='cd ~/dotfiles/tmux;         '$IS_GIT_STAGED' (git add .tmux.conf; git ci -m"tmux: updated .tmux.conf"); cd -'
alias commitvimrc='cd ~/dotfiles/vim;         '$IS_GIT_STAGED' (git add .vimrc; git ci -m"vim: updated .vimrc"); cd -'
alias commitvscode='cd ~/dotfiles/vscode;     '$IS_GIT_STAGED' (git add .config; git ci -m"vscode: updated VSCode config settings"); cd -'

alias commitglb=''$IS_GIT_STAGED'       (git add .gitlab-ci.yml; git ci -m "Updated .gitlab-ci.yml")'
alias commitgitignore=''$IS_GIT_STAGED' (git add .gitignore; git ci -m "Updated .gitignore")'

alias cs="createshortcut"

#-------------------------------------------------------------------------------
# [Git]
#-------------------------------------------------------------------------------
# SEE: https://git-scm.com/docs/gitrevisions for help on HEAD^, HEAD^2~, etc.

MM_JS_GIT_EXCLUDES="':(exclude)package-lock.json' ':(exclude)yarn.lock'"

alias gitconf="vim ~/dotfiles/git/.gitconfig"
alias clrgit="cl; git"

# Add
alias ga="git a"

# Branch
alias gb="git b"
alias gba="git ba"
alias gbd="git bd"
alias gbD="git bD"
alias gbm="git bm"
alias gbM="git bM"

alias ngba="git ba"

# Commit
alias gci="git ci"

# Checkout
alias gco="git co"
alias gcob="git cob"

# Diff
alias gd="clrgit d"
  # Diff --staged
alias gds="clrgit ds"
  # Diff - exclude npm
alias gdn="clrgit dn"
  # Diff - --staged & exclude npm
alias gdsn="clrgit dsn"

alias ngd="git d"
alias ngds="git ds"
alias ngdn="git dn"
alias ngdsn="git dsn"

# Log
alias gl="clrgit l"
alias gln="clrgit ln"

# Log - Graph
alias glg="clrgit lg"
  # Quarter/Half/Full-screen
  alias glgq="glg 15"
  alias glgh="glg 22"
  alias glgf="glg 45"

  # Various sizes
  for i in {2..10} 20 25 30 40 45; do
    eval "alias glg${i}=\"glg ${i}\""
  done

  alias glgc="clrgit lgc"

# Log - Graph --all
alias glga="clrgit lga"
  # Quarter/Half/Full-screen
  alias glgaq="glg 15"
  alias glgah="glg 22"
  alias glgaf="glg 45"

  # Various sizes
  for i in {2..10} 20 25 30 40 45; do
    eval "alias glga${i}=\"glga ${i}\""
  done

  alias glgca="clrgit lgca"

# Shortlog
alias gsl="git sl"
alias gslcommits=" git slcommits"

# Push/Pull
alias pull="git pl"
alias push="git ps"

# Restore
alias rs="git rs"
alias rss="git rss"

# Show
alias gsh="clrgit sh"
alias ngsh="git sh"

# Status
alias gst="clrgit st"
alias gss="clrgit ss"

alias ngst="git st"
alias ngss="git ss"

# MISCELLANEOUS
alias remotes="clrgit remote -v"
alias stash="git stash"

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
alias pxoff="tmuxsendall '. proxytoggle off'"
alias pxon="tmuxsendall '. proxytoggle on'"
alias pxon8090="tmuxsendall '. proxytoggle on 127.0.0.1 8090'"

alias pxoff=". proxytoggle off"
alias pxon=". proxytoggle on"
alias pxon8090=". proxytoggle on 127.0.0.1 8090"
alias pxs="proxystatus"
alias pxt="proxytoggle"
alias ssx='printf "USE: alias \"ssxp\" to specify <src_port>\n\nsudo ss -lp sport = :domain\n"; sudo ss -lp sport = :domain'
alias ssxp='sudo ss -lp sport = '

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
alias tmconf="vi ~/.tmux.conf"
alias vimrc="vim ~/dotfiles/vim/.vimrc"

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
alias tmrenamesession='tmux rename-session -t "$(tmux display-message -p "#S")"'
alias tmrenamewindow='tmux rename-window -t "$(tmux display-message -p "#{window_id}")"'
alias tmrs="tmrenamesession"
alias tmrw="tmrenamewindow"

#-------------------------------------------------------------------------------
# [Vagrant]
# [VirtualBox]
# [VMs]
#-------------------------------------------------------------------------------
alias mpls="multipass ls"
alias mp="multipass"
alias mpsh="multipass shell"
alias vms="ll ~/virtualbox_vms"

