#-------------------------------------------------------------------------------
# Logging
#-------------------------------------------------------------------------------
NC="\e[0m"

BOLD="\e[1m"
LIGHT="\e[2m"

GREEN="\e[0;32m"
GREEN_BOLD="\e[1;32m"

RED="\e[0;31m"
RED_BOLD="\e[1;31m"

YELLOW="\e[0;33m"
YELLOW_BOLD="\e[1;33m"

CLEAR_SCREEN="\e[2K"

print_step() {
  printf "\n"
  printf "#-------------------------------------------------------------------------------\n"
  printf "# %s\n" "$1"
  printf "#-------------------------------------------------------------------------------\n"
}

section() {
  printf "[${BOLD}%s${NC}]\n" $1
}

msg() {
  printf " ${LIGHT}%s${NC}\n" "$1"
}

ok() {
  printf "  [ ${GREEN_BOLD}OK${NC} ] $1\n"
}

skipping() {
  printf "  [ ${YELLOW}Skipping${NC} ] $1\n"
}

fail() {
  printf "  [ ${RED_BOLD}FAIL${NC} ] $1\n"
}

#-------------------------------------------------------------------------------
# File Operations
#-------------------------------------------------------------------------------
mkdir_if_not_exist() {
  local _dir=$1
  if [ ! -d $_dir ]; then
    msg "Making [$_dir]"
    mkdir -p $_dir
  fi
}


source_file_if_exists() {
  local _file=$1
  if [ -f $_file ]; then
    _tilde_unexpanded=$(cd $(dirname $_file); dirs | head -n 1)/$(basename $_file)

    msg "Sourcing -> [$_tilde_unexpanded]"
    # timer=$(($(date +%s%N)/1000000))
    source $_file
    # now=$(($(date +%s%N)/1000000))
    # elapsed=$(($now-$timer))
    # echo $elapsed
  fi
}

create_symlink_with_backup() {
  local _target=$1
  local _link_name=$2
  local _target_dir=${3:-$HOME}

  section "$_link_name"
  (
    cd "$_target_dir"

    # Create link if doesn't exist at all
    if [ ! -e "$_link_name" ]; then
      msg "[$_link_name] does not exist -> creating symlink"
      ln -s "$_target" "$_link_name"

    # If link exists & is symlink, then delete current symlink & create new symlink
    elif [ -L "$_link_name" ]; then
      msg "[$_link_name] exists AND is symlink"

      msg "Deleting [$(ls -al $_link_name)]"
      rm "$_link_name"

      ln -s "$_target" "$_link_name"
      msg "Created [$_link_name] symlink"

    # If link exists & is NOT symlink, then backup current file & create new symlink
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
