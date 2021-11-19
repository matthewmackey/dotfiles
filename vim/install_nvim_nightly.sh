#!/bin/bash

set -e
set -o pipefail

DOWNLOADS_DIR=~/downloads/srv
CURR_NIGHTLY_DOWNLOAD_FILE=$DOWNLOADS_DIR/nvim.appimage.tmp
NIGHTLY_URL=https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage

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
  versioned_download_file=~/downloads/srv/nvim-"${NVIM_NIGHTLY_VERSION}.appimage"

  if [ ! -e "${versioned_download_file}" ]; then
    mv "${CURR_NIGHTLY_DOWNLOAD_FILE}" "${versioned_download_file}"
    ls -l --color=always "${versioned_download_file}"
  else
    printf "Nightly version already existed and installed\nDONE\n"
    exit 0
  fi
}

symlink_global_nvim_to_nightly_version() {
  sudo rm /usr/bin/nvim 2>/dev/null || true
  sudo ln -s "${versioned_download_file}" /usr/bin/nvim
  printf "\nCreated symlink at:\n  "
  ls -l --color=always /usr/bin/nvim
}

remove_last_download_if_exists
download_current_nightly_version
NVIM_NIGHTLY_VERSION=$(get_current_nightly_version_number)
rename_nightly_version_to_real_version_number
symlink_global_nvim_to_nightly_version

