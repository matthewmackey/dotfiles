#
# kubernetes.zsh
#

[[ $commands[kubectl] ]] && source <(kubectl completion zsh)

KUBE_PS1_SH=~/.local/bin/kube-ps1.sh
if [[ ! -f $KUBE_PS1_SH ]]; then
  printf "Installing [$KUBE_PS1_SH]\n"
  curl -L https://raw.githubusercontent.com/jonmosco/kube-ps1/v0.7.0/kube-ps1.sh \
    -o $KUBE_PS1_SH
fi

source $KUBE_PS1_SH
PROMPT='$(kube_ps1)'$PROMPT
