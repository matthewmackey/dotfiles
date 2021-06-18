#!/bin/bash

ok() {
  printf "\r\033[2K  [ \033[00;32mOK\033[0m ] $1\n"
}

fail() {
  printf "\r\033[2K  [\033[0;31mFAIL\033[0m] $1\n"
}


is_command() {
  local _cmd="$1"
  if command -v "$_cmd" >/dev/null; then
    ok "$_cmd"
  else
    fail "$_cmd"
  fi
}

is_alias() {
  local _alias="$1"
  if alias "$_alias"; then
    ok "$_alias"
  else
    fail "$_alias"
  fi
}

check_commands() {
  for c in $@
  do
    is_command "$c"
  done
}

check_aliases() {
  for a in $@
  do
    is_alias "$a"
  done
}

COMMON_CMDS=(
  ack
  curl
  fdfind
  fzf
  git
  htop
  jq
  nvim
  p7zip
  rg
  tmux
  tree
  unzip
  vim
  zip
)

NET_CMDS=(
  arp
  dig
  nc
  netstat
  nmap
  nslookup
  ping
  route
  tracepath
  traceroute
  traceroute6
  tshark
  wget
)

LANG_CMDS=(
  go
  python3
  ruby
)

printf "Validating [General - COMMON] commands:\n"
check_commands ${COMMON_CMDS[@]}

printf "Validating [General - NET] commands:\n"
check_commands ${NET_CMDS[@]}

printf "Validating [Custom - Language] commands:\n"
check_commands ${LANG_CMDS[@]}
