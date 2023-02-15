#!/bin/bash

SSH_PASS_ENTER_PAUSE_SECS=3

SSH_KEY_COMMENT=$1
if [ -z "$SSH_KEY_COMMENT" ]; then
  echo "You must provide: SSH_KEY_COMMENT"
  exit 1
fi

gpg --gen-key

GPG_KEY_ID=$(gpg --list-keys | grep 'pub   rsa' -A 1 | tail -n 1 | tr -d ' ')

echo
echo
echo "Found GPG key ID: [$GPG_KEY_ID]"

echo
echo "Confirm correct key ID was found from the list of keys:"
echo
gpg --list-keys

echo
read -p "Was the correct GPG ID found (y/n)? " ANS
if [ "$ANS" != 'y' ]; then
  echo "Exiting."
  exit 1
fi

echo
echo
pass init $GPG_KEY_ID

echo
echo
pass git init

# -c is just so it doesn't print out (an error will be shown though)
echo
echo
pass generate ssh/default -c 20

# Capture SSH password, which will also allow GPG unlock dialog to be displayed
# before the following step which causes issues with the display clobbering the
# `script` command when the unlock doesn't happen first.
SSH_PASS=$(pass show ssh/default)

# 2nd sleep not strictly necessary but it makes viewing the script output easier
echo
echo
{ sleep $SSH_PASS_ENTER_PAUSE_SECS; echo $SSH_PASS; sleep $SSH_PASS_ENTER_PAUSE_SECS; echo $SSH_PASS; } \
  | script -q -c 'ssh-keygen -t rsa -b 4096 -C "'$SSH_KEY_COMMENT'" -f ~/.ssh/id_rsa' /dev/null
