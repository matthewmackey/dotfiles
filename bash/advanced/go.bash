if command -v go >/dev/null; then
  export PATH="/usr/local/go/bin:$PATH"
  export GOPATH=$(go env GOPATH)
  export PATH=$PATH:$GOPATH/bin
fi
