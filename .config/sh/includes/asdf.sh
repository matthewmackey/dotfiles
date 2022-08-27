ASDF_HOME=~/.asdf
ASDF_VERSION=v0.10.2

if [ ! -d ${ASDF_HOME} ]; then
  git clone https://github.com/asdf-vm/asdf.git ${ASDF_HOME} --branch ${ASDF_VERSION}
fi

source $ASDF_HOME/asdf.sh

unset ASDF_VERSION
