#!/bin/bash

SESSION_NAME=$1

[ ! -z "$SESSION_NAME" ] || {
  echo "You must provide a session name."
  exit -1
}

tmux new-session -s "$SESSION_NAME"
