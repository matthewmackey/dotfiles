#!/bin/bash

if [[ ! -d ~/.tmux/plugins/tpm/.git ]]; then
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi
