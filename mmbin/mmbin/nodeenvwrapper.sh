function lsnodeenv() {
 ( cd ~/.nodeenvs && find */bin/activate 2>/dev/null ) | sed -r 's|(.*)/bin/activate|\1|' | sort
}

function rmnodeenv() {
	local _nodeenv_name=$1
  local _nodeenv_dir=~/.nodeenvs/$1

	if [ -z "$_nodeenv_name"  ]; then
		echo "You must provide a nodeenv name.  Here are the current nodeenvs:"
		echo
		lsnodeenv
		return 1
	fi

	if lsnodeenv | grep -q "$_nodeenv_name"; then
		echo -n "Are you sure you want to delete nodeenv at [$_nodeenv_dir]?  Enter 'y' to confirm:  "
		read confirm
		if [ "$confirm" = "y" ]; then
			rm -rf "$_nodeenv_dir"
		else
			echo "Removal aborted"
		fi
  else
		echo "The nodeenv name you specified does not exist.  Here are the current nodeenvs:"
		echo
		lsnodeenv
  fi
}

function workon_node() {
  local _nodeenv_activate=~/.nodeenvs/$1/bin/activate

  if [ -f "$_nodeenv_activate" ]; then
    source "$_nodeenv_activate"
  else
    echo "You must specify a nodeenv name from:"
    echo
    lsnodeenv
  fi
}
