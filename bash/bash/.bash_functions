print_step() {
  echo
  echo "#---------------------------------------------------------------------------"
  echo "# Step: $1"
  echo "#---------------------------------------------------------------------------"
} 

# Excerpt from: http://5thpeephole.blogspot.com/2013/10/an-ssh-session-management-trick-with.html
setTermColor() {

	# Function with first argument be the name of color scheme
	dbus-send --session /net/sf/roxterm/Options net.sf.roxterm.Options.SetColourScheme string:$ROXTERM_ID string:$1
}

error_and_exit() {
  echo "[ERROR] $1"
  exit -1
}

replace-with-lower() {
  local from="$1"
  local to="${from,,}"

  [ -n "$from" ] || { echo "You must provide: <from>"; return -1; }

  echo "Replacing [$from] with [$to]"

  replace-text "$from" "$to"
}

replace-with-upper() {
  local from="$1"
  local to="${from^^}"

  [ -n "$from" ] || { echo "You must provide: <from>"; return -1; }
  replace-text "$from" "$to"
}

# Replaces text in all files in the current directory. 'from' is replaced with 'to'
replace-text() {
  local from="$1"
  local to="$2"

  [ -n "$from" ] || { echo "You must provide: <from> <to>"; return -1; }
  [ -n "$to" ] || { echo "You must provide: <from> <to>"; return -1; }

  echo 
  echo "#---------------------------------------------------------------------------"
  echo "# Files to change:"
  echo "#---------------------------------------------------------------------------"
  ack-grep -l "$from"

  local files_to_change
  files_to_change=($(ack-grep -l "$from"))

  for _file in "${files_to_change[@]}"
  do
    [ -f "$_file" ] || continue

    echo 
    echo "#---------------------------------------------------------------------------"
    echo "# Changes to: [$_file]"
    echo "#---------------------------------------------------------------------------"
    sed -r 's|'$from'|'$to'|g' "$_file"
    sed -i -r 's|'$from'|'$to'|g' "$_file"
  done
} 

