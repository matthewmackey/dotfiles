[[ $commands[kubectl] ]] && source <(kubectl completion zsh)

if [ ! -f ~/.local/bin/kube-ps1.sh ]; then
  curl -L https://raw.githubusercontent.com/jonmosco/kube-ps1/v0.7.0/kube-ps1.sh \
    -o ~/.local/bin/kube-ps1.sh
fi
source ~/.local/bin/kube-ps1.sh
PROMPT='$(kube_ps1)'$PROMPT
