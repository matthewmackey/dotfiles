[ $(command -v kubectl) ] && source <(kubectl completion bash)
alias k=kubectl
complete -F __start_kubectl k

if [ ! -f ~/.local/bin/kube-ps1.sh ]; then
  curl -L https://raw.githubusercontent.com/jonmosco/kube-ps1/v0.7.0/kube-ps1.sh \
    -o ~/.local/bin/kube-ps1.sh
fi
source ~/.local/bin/kube-ps1.sh
PS1='$(kube_ps1) '$PS1
