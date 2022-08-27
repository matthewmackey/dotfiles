ASDF_HOME=~/.asdf
ASDF_VERSION=v0.10.2

if [ ! -d ${ASDF_HOME} ]; then
  git clone https://github.com/asdf-vm/asdf.git ${ASDF_HOME} --branch ${ASDF_VERSION}

  # Install Node.js plugin pre-requisites
  #   https://github.com/asdf-vm/asdf-nodejs
  #   https://github.com/nodejs/node/blob/main/BUILDING.md#unix-prerequisites
  sudo apt-get install python3 g++ make python3-pip

  # Install Python plugin pre-requisites
  #   https://github.com/asdf-community/asdf-python
  #   https://github.com/pyenv/pyenv/wiki#suggested-build-environment
  sudo apt-get install make build-essential libssl-dev zlib1g-dev \
    libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm \
    libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev

  # Install Ruby plugin pre-requisites
  #   https://github.com/asdf-vm/asdf-ruby
  #   https://github.com/rbenv/ruby-build/wiki#suggested-build-environment
  sudo apt-get install autoconf bison build-essential libssl-dev libyaml-dev \
    libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm6 libgdbm-dev \
    libdb-dev uuid-dev
fi

source $ASDF_HOME/asdf.sh

ASDF_PLUGIN_HOME=$ASDF_HOME/plugins

if [ ! -d $ASDF_PLUGIN_HOME/python ]; then
  asdf plugin add python https://github.com/asdf-community/asdf-python.git
fi

if [ ! -d $ASDF_PLUGIN_HOME/nodejs ]; then
  asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
fi

if [ ! -d $ASDF_PLUGIN_HOME/ruby ]; then
  asdf plugin add ruby https://github.com/asdf-vm/asdf-ruby.git
fi

unset ASDF_PLUGIN_HOME
unset ASDF_VERSION
