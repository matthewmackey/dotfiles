#
# ssh.bash
#

# Will autocomplete any hosts found in known_hosts
# From: https://gist.github.com/peelman/1773863
complete -W "$(echo `cat ~/.ssh/known_hosts | cut -f 1 -d ' ' | sed -e s/,.*//g | uniq | grep -v "\["`;)" ssh


