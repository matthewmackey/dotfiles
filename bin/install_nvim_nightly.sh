#!/bin/bash

set -e
set -o pipefail

DOWNLOADS_DIR=~/downloads/srv
CURR_NIGHTLY_DOWNLOAD_FILE=$DOWNLOADS_DIR/nvim.appimage.tmp
NIGHTLY_URL=https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage

_VERSIONED_DOWNLOAD_FILE=

mkdir -p $DOWNLOADS_DIR 2>/dev/null || true

remove_last_download_if_exists() {
  if [ -e "${CURR_NIGHTLY_DOWNLOAD_FILE}" ]; then
    rm ${CURR_NIGHTLY_DOWNLOAD_FILE}
    printf "Deleting last download of [${CURR_NIGHTLY_DOWNLOAD_FILE}]\n"
  fi
}

download_current_nightly_version() {
  printf "\nDownloading: [${NIGHTLY_URL}]\n\n"
  curl -L -o "${CURR_NIGHTLY_DOWNLOAD_FILE}" "${NIGHTLY_URL}"
  chmod +x "${CURR_NIGHTLY_DOWNLOAD_FILE}"
  printf "\nDownloaded: [${CURR_NIGHTLY_DOWNLOAD_FILE}]\n\n"
}

get_current_nightly_version_number() {
  "${CURR_NIGHTLY_DOWNLOAD_FILE}" --version | head -n1 | cut -d ' ' -f2
}

rename_nightly_version_to_real_version_number() {
  printf "Nightly Version downloaded: [${NVIM_NIGHTLY_VERSION}]\n"
  _VERSIONED_DOWNLOAD_FILE=~/downloads/srv/nvim-"${NVIM_NIGHTLY_VERSION}.appimage"

  if [ ! -e "${_VERSIONED_DOWNLOAD_FILE}" ]; then
    mv "${CURR_NIGHTLY_DOWNLOAD_FILE}" "${_VERSIONED_DOWNLOAD_FILE}"
    ls -l --color=always "${_VERSIONED_DOWNLOAD_FILE}"
  else
    printf "Nightly version already existed and installed\nDONE\n"
    exit 0
  fi
}

symlink_global_nvim_to_nightly_version() {
  replace_global_symlink /usr/bin/nvim "${_VERSIONED_DOWNLOAD_FILE}"
}

replace_global_symlink() {
  local _link=$1
  local _new_target=$2

  sudo rm $_link 2>/dev/null || true
  sudo ln -s $_new_target $_link
  printf "\nCreated symlink at:\n  "
  ls -l --color=always $_link
}



remove_last_download_if_exists
download_current_nightly_version
NVIM_NIGHTLY_VERSION=$(get_current_nightly_version_number)
rename_nightly_version_to_real_version_number
symlink_global_nvim_to_nightly_version
