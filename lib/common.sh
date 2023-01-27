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

safe_printf() {
  if [[ $- == *i* ]]; then
    return
  else
    printf "$@"
  fi
}

print_step() {
  safe_printf "\n"
  safe_printf "#-------------------------------------------------------------------------------\n"
  safe_printf "# %s\n" "$1"
  safe_printf "#-------------------------------------------------------------------------------\n"
}

section() {
  safe_printf "\n[${BOLD}%s${NC}]\n" "$1"
}

msg() {
  safe_printf " ${LIGHT}%s${NC}\n" "$1"
}

bold() {
  local _heading=$1
  local _msg=$2
  safe_printf " ${BOLD}$_heading${NC} -> $_msg\n"
}

ok() {
  safe_printf "  [${GREEN_BOLD}OK${NC}] $1\n"
}

warn() {
  safe_printf "  [${YELLOW}WARN${NC}] $1\n"
}

fail() {
  safe_printf "  [${RED_BOLD}FAIL${NC}] $1\n"
}

skipping() {
  safe_printf "  [${YELLOW}Skipping${NC}] $1\n"
}

alert() {
  local _heading=$1
  local _msg=$2
  safe_printf "  [${YELLOW_BOLD}$_heading${NC}] $_msg\n"
}

newline() {
  safe_printf "\n"
}


#-------------------------------------------------------------------------------
# File Operations
#-------------------------------------------------------------------------------
mkdir_if_not_exist() {
  local _dir=$1
  if [ ! -d $_dir ]; then
    msg "Making $_dir"
    mkdir -p $_dir
  else
    skipping "$_dir exists already so not creating"
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

# Define common function to be called after other main shell initializations
# complete (Bash, ZSH, etc.) that will source local dotfile overrides
#
# NOTE: this can only work if the local dotfiles are cross-shell-compatible
source_local_dotfiles() {
  section "Sourcing -> ~/.local/dotfiles"

  local _files_to_source=()
  _files_to_source+=($LOCAL_DOTDIR/rc)
  _files_to_source+=($LOCAL_DOTDIR/aliases)

  for _file in ${_files_to_source[@]}; do
    source_file_if_exists $_file
  done
}

create_symlink_with_backup() {
  local _target=$1
  local _link_name=$2
  local _target_dir=${3:-$HOME}

  bold "$_link_name" "creating symlink & backing up current file/dir if one exists"
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

    newline
  )
}

delete_symlink_or_create_backup() {
  local _file=$1

  if [ -L $_file ]; then
    msg "[$_file] exists AND is symlink"

    msg "Deleting [$(ls -al $_file)]"
    rm $_file
  else
    if [ -e $_file ]; then
      msg "[$_file] exists AND is NOT a symlink"
      local _backup=$_file.bak."$(date '+%F-%H%M%S')"

      msg "Moving existing [$_file] to -> [$_backup]"
      mv $_file $_backup
    fi
  fi
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


# vim: ft=bash  foldlevel=0 foldmarker={{{,}}} foldmethod=marker
