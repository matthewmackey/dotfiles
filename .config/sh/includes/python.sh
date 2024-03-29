#
# python.sh
#

export DEFAULT_PYTHON=~/pythons/default

_default_python_bin=$DEFAULT_PYTHON/bin

# Add Default Python BIN directory w/ python/pip & base modules to PATH
if [[ -d "$_default_python_bin" ]]; then
  export PATH=$_default_python_bin:$PATH
fi

#--------------------------#
# Virtualenvwrapper setup
#--------------------------#
if [[ -f $_default_python_bin/virtualenvwrapper.sh ]]; then
  export WORKON_HOME=$HOME/virtualenvs
  export VIRTUALENVWRAPPER_PYTHON=$_default_python_bin/python
  export VIRTUALENVWRAPPER_VIRTUALENV=$_default_python_bin/virtualenv
  export VIRTUALENVWRAPPER_VIRTUALENV_ARGS='--always-copy'
fi

# Create alias to load Virtualenvwrapper so we can lazy load it to decrease
# shell startup time
#
# Short for: "source pyenv"
alias sp="source $_default_python_bin/virtualenvwrapper.sh"

alias w="workon"


unset _default_python_bin
