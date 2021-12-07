#
# go.sh
#
if command -v /usr/local/go/bin/go >/dev/null; then
  export PATH="/usr/local/go/bin:$PATH"

  export GOPATH=$(go env GOPATH)
  export PATH="$GOPATH/bin:$PATH"
fi
