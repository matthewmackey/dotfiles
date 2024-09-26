#
# python.sh
#

# Add Default Python BIN directory w/ python/pip & base modules to PATH
if [ -d "$DEFAULT_ASDF_PYTHON_BIN_DIR" ]; then
  export PATH="$DEFAULT_ASDF_PYTHON_BIN_DIR:$PATH"
fi
