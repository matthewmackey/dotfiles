#-------------------------------------------------------------------------------
# rust.sh
#
# SAFE: all shells
# SAFE: proper conditionals
#-------------------------------------------------------------------------------
_RUST_BIN=$HOME/.cargo/bin

if command -v $_RUST_BIN/rustc >/dev/null; then
  export PATH="$_RUST_BIN:$PATH"
fi

unset _RUST_BIN
