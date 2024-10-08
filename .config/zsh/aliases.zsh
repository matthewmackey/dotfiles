#
# ~/.config/zsh/aliases.zsh
#

# This file contains aliases specifc to ZSH, like global and suffix aliases

#-------------------------------------------------------------------------------
# FROM: https://blog.sebastian-daschner.com/entries/zsh-aliases
#-------------------------------------------------------------------------------
# blank aliases
typeset -a baliases
baliases=()

balias() {
  alias $@
  args="$@"
  args=${args%%\=*}
  baliases+=(${args##* })
}

# ignored aliases
typeset -a ialiases
ialiases=()

ialias() {
  alias $@
  args="$@"
  args=${args%%\=*}
  ialiases+=(${args##* })
}

# functionality
expand-alias-space() {
  [[ $LBUFFER =~ "\<(${(j:|:)baliases})\$" ]]; insertBlank=$?
  if [[ ! $LBUFFER =~ "\<(${(j:|:)ialiases})\$" ]]; then
    zle _expand_alias
  fi
  zle self-insert
  if [[ "$insertBlank" = "0" ]]; then
    zle backward-delete-char
  fi
}
zle -N expand-alias-space

bindkey " " expand-alias-space
bindkey -M isearch " " magic-space

# starts one or multiple args as programs in background
background() {
  for ((i=2;i<=$#;i++)); do
    ${@[1]} ${@[$i]} &> /dev/null &
  done
}

#----------------------------------#
# Global Aliases                   #
#----------------------------------#
alias -g B='| base64 -d'
alias -g b0='| base64 --wrap=0'
alias -g B0='base64 --wrap=0'
alias -g C='| xclip -sel clip /dev/stdin'
alias -g G='| grep'
alias -g gi='| grep -i'
alias -g j,='| jq'
alias -g L='| less'
alias -g N='> /dev/null 2>&1'
alias -g P="':!package-lock.json'"
alias -g PP="PYTHONPATH=./"
alias -g jp="-ojsonpath='{.data."
alias -g R="-o jsonpath='{.spec.containers[0].resources}' | jq"
alias -g so="| sort"
alias -g s,="| sops -d --input-type yaml --output-type yaml /dev/stdin"
alias -g y='| yh'
alias -g Y='-oyaml| yh'
alias -g W='| wc -l'
alias -g 1.='../'
alias -g 2.='../../'
alias -g 3.='../../../'
alias -g 4.='../../../../'
alias -g 5.='../../../../'
#
#----------------------------------#
# Suffix Aliases                   #
#----------------------------------#
alias -s html='background google-chrome-stable'
alias -s {pdf,PDF}='background mupdf'
