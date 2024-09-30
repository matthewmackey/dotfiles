#!/bin/bash

set -e
set -o pipefail

#-------------------------------#
# Install Nerd Fonts            #
#-------------------------------#
# This direct download method is much faster than the `git clone` w/ `install.sh`
# method which takes forever at least on the initial clone (about 5-10 minutes).
# `install.sh` also seems to take forever on a dedup method it uses
#
# Newer fonts are also no longer stored in the git repo so we can't use the
# `install.sh` method for those.

NERD_FONTS_RELEASE=v3.2.1
# NERD_FONT_ARCHIVE_TYPE=.zip
NERD_FONT_ARCHIVE_TYPE=tar.xz
NERD_FONT=(
  0xProto
  # 3270
  # Agave
  # AnonymousPro
  # Arimo
  # AurulentSansMono
  # BigBlueTerminal
  # BitstreamVeraSansMono
  # CascadiaCode
  # CodeNewRoman
  # ComicShannsMono
  # CommitMono
  # Cousine
  # D2Coding
  # DaddyTimeMono
  DejaVuSansMono
  DroidSansMono
  # EnvyCodeR
  # FantasqueSansMono
  # FiraCode
  # FiraMono
  # GeistMono
  Go-Mono
  # Gohu
  # Hack
  # Hasklig
  # HeavyData
  # Hermit
  iA-Writer
  # IBMPlexMono
  Inconsolata
  InconsolataGo
  InconsolataLGC
  # Iosevka
  JetBrainsMono
  # Lekton
  # LiberationMono
  # Meslo
  # Monofur
  Monoid
  Mononoki
  # MPlus
  Noto
  # OpenDyslexic
  # Overpass
  # ProFont
  # ProggyClean
  # RobotoMono
  # ShareTechMono
  # SourceCodePro
  # SpaceMono
  # Terminus
  # Tinos
  Ubuntu
  UbuntuMono
  UbuntuSans
  # VictorMono
)

NERD_FONTS_DIR=~/.local/share/nerdfonts
if [ ! -d $NERD_FONTS_DIR ]; then
  mkdir -p $NERD_FONTS_DIR
fi

{
  cd $NERD_FONTS_DIR

  for nf in ${NERD_FONT[@]}; do
    nf_archive=$nf.$NERD_FONT_ARCHIVE_TYPE

    printf "PROCESSING -> [$nf_archive]\n\n"

    if [ ! -f "$nf_archive" ]; then
      curl -L -O -s "https://github.com/ryanoasis/nerd-fonts/releases/download/$NERD_FONTS_RELEASE/$nf_archive"

      if [ "$NERD_FONT_ARCHIVE_TYPE" = "tar.xz" ]; then
        tar xf "$nf_archive"
      elif [ "$NERD_FONT_ARCHIVE_TYPE" = "zip" ]; then
        uznip "$nf_archive"
      fi

      printf "INSTALLED Successfully\n\n"
    else
      printf "  Font already INSTALLED\n\n"
    fi
  done
}

LOCAL_SHARE_FONTS_DIR=~/.local/share/fonts
{
  if [ ! -d $LOCAL_SHARE_FONTS_DIR ]; then
    mkdir -p $LOCAL_SHARE_FONTS_DIR
  fi
  cd ~/.local/share/fonts
  find ../nerdfonts \
    \( -name '*.otf' -o -name '*.ttf' -o -name '*.TTF' -type f \) \
    -exec sh -c \
    'B=$(basename "$0"); if [ -L "$B" ]; then echo "Symlink already exists for [$B]"; else echo "Creating symlink for [$B]"; ln -s "$0" . ; fi' \
    {} \;

  printf "\nUpdating font cache with 'fc-cache'\n"
  fc-cache -f .
}

printf "\nDONE\n"
