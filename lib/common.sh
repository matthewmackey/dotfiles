#-------------------------------------------------------------------------------
# Logging
#-------------------------------------------------------------------------------
ok() {
  printf "\r\033[2K  [ \033[00;32mOK\033[0m ] $1\n"
}

fail() {
  printf "\r\033[2K  [\033[0;31mFAIL\033[0m] $1\n"
}

msg() {
  printf "%s\n" "$1"
}

#-------------------------------------------------------------------------------
# Validation
#-------------------------------------------------------------------------------
is_command() {
  local _cmd="$1"
  if command -v "$_cmd" >/dev/null; then
    ok "$_cmd"
  else
    fail "$_cmd"
  fi
}

is_alias() {
  local _alias="$1"
  if alias "$_alias"; then
    ok "$_alias"
  else
    fail "$_alias"
  fi
}

check_commands() {
  for c in $@
  do
    is_command "$c"
  done
}

check_aliases() {
  for a in $@
  do
    is_alias "$a"
  done
}

#-------------------------------------------------------------------------------
# File Operations
#-------------------------------------------------------------------------------
create_symlink_with_backup() {
  local _target=$1
  local _link_name=$2
  local _target_dir=${3:-$HOME}

  (
    cd "$_target_dir"
    if [ ! -e "$_link_name" ]; then
      msg "[$_link_name] does not exist -> creating symlink"
      ln -s "$_target" "$_link_name"

    elif [ -L "$_link_name" ]; then
      msg "[$_link_name] exists AND is symlink"

      msg "Deleting [$(ls -al $_link_name)]"
      rm "$_link_name"

      ln -s "$_target" "$_link_name"
      msg "Created [$_link_name] symlink"

    else
      msg "[$_link_name] exists AND is NOT a symlink"
      local _backup=$_link_name.bak."$(date '+%F-%H%M%S')"

      msg "Moving existing [$_link_name] to -> [$_backup]"
      mv "$_link_name" "$_backup"

      ln -s "$_target" "$_link_name"
      msg "Created [$_link_name] symlink"
    fi

    echo
  )
}
