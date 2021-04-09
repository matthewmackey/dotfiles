#!/bin/sh

DOWNLOAD_FILE=~/downloads/srv/nvim.appimage
NIGHTLY_URL=https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage

if [ -e "${DOWNLOAD_FILE}" ]; then
  printf "nvim already downloaded at [${DOWNLOAD_FILE}]; delete then re-run\n"
  exit 1
fi

curl -L -o "${DOWNLOAD_FILE}" "${NIGHTLY_URL}"
chmod +x "${DOWNLOAD_FILE}"
printf "\nDownloaded: [${DOWNLOAD_FILE}]\n"

nvim_nightly_version=$("${DOWNLOAD_FILE}" --version | head -n1 | cut -d ' ' -f2)
printf "Nightly Version downloaded: [${nvim_nightly_version}]\n"

versioned_download_file=~/downloads/srv/nvim-"${nvim_nightly_version}.appimage"
rm "${versioned_download_file}" 2>/dev/null
ln -s "${DOWNLOAD_FILE}" "${versioned_download_file}"
printf "\nCreated versioned symlink at:\n  "
ls -l --color=always "${versioned_download_file}"

sudo rm /usr/bin/nvim 2>/dev/null
sudo ln -s "${versioned_download_file}" /usr/bin/nvim
printf "\nCreated symlink at:\n  "
ls -l --color=always /usr/bin/nvim
