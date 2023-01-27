#
# kubernetes.bash
#
[ $(command -v kubectl) ] && source <(kubectl completion bash)
alias k=kubectl
complete -F __start_kubectl k

if [ ! -f ~/.local/bin/kube-ps1.sh ]; then
  # Make silent if non-interactive
  _curl_opts=" "
  if [[ $- != *i* ]]; then
    _curl_opts="-s "
  fi

  curl -L https://raw.githubusercontent.com/jonmosco/kube-ps1/v0.7.0/kube-ps1.sh \
    "$_curl_opts" \
    -o ~/.local/bin/kube-ps1.sh

  unset _curl_opts
fi

if [ -f ~/.local/bin/kube-ps1.sh ]; then
  source ~/.local/bin/kube-ps1.sh
  PS1='$(kube_ps1) '$PS1
fi
