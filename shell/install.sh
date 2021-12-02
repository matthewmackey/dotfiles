#!/bin/bash

# Install oh-my-zsh
if [ ! -d ~/.oh-my-zsh ]; then
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Install `yh` YAML formatter
#go get github.com/andreazorzetto/yh

# Install kubectx
if [ ! -f ~/bin/kubectx -a ! -f ~/bin/kubens ]; then
  curl -L https://github.com/ahmetb/kubectx/releases/download/v0.9.4/kubectx_v0.9.4_linux_x86_64.tar.gz -o /tmp/kubectx-0.9.4.tar.gz
  curl -L https://github.com/ahmetb/kubectx/releases/download/v0.9.4/kubens_v0.9.4_linux_x86_64.tar.gz -o /tmp/kubens-0.9.4.tar.gz
  {
    cd ~/bin
    tar xzf /tmp/kubectx-0.9.4.tar.gz
    tar xzf /tmp/kubens-0.9.4.tar.gz
    rm LICENSE
  }
fi

DIRS=(
  ~/.config/bash
  ~/.config/zsh/.zfunctions
)

for d in ${DIRS[@]}; do
  if [ ! -d $d ]; then
    mkdir -p $d
    echo "Created dir: [$d]"
  fi
done
