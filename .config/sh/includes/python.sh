#
# python.sh
#
default_python_bin=~/pythons/default/bin

# Add Default Python BIN directory w/ python/pip & base modules to PATH
if [[ -d "$default_python_bin" ]]; then
  export PATH=$default_python_bin:$PATH
fi

#--------------------------#
# Virtualenvwrapper setup
#--------------------------#
if [[ -f $default_python_bin/virtualenvwrapper.sh ]]; then
  export WORKON_HOME=$HOME/virtualenvs
  export VIRTUALENVWRAPPER_PYTHON=$default_python_bin/python
  export VIRTUALENVWRAPPER_VIRTUALENV=$default_python_bin/virtualenv
  export VIRTUALENVWRAPPER_VIRTUALENV_ARGS='--always-copy'
fi

# Create alias to load Virtualenvwrapper so we can lazy load it to decrease
# shell startup time
#
# "source pyenv"
alias sp="source $default_python_bin/virtualenvwrapper.sh"

alias w="workon"
