#!/bin/bash

set -e
set -o pipefail

#-------------------------------#
# Install Nerd Fonts            #
#-------------------------------#
# This direct download method is much faster than the `git clone` w/ `install.sh`
# method which takes forever (at least it seems that way). `install.sh` seems to
# take forever on a dedup method it uses

NERD_FONTS_RELEASE=v2.1.0
NERD_FONT_FILES=(
  3270.zip
  Agave.zip
  AnonymousPro.zip
  Arimo.zip
  AurulentSansMono.zip
  BigBlueTerminal.zip
  BitstreamVeraSansMono.zip
  CascadiaCode.zip
  CodeNewRoman.zip
  Cousine.zip
  DaddyTimeMono.zip
  DejaVuSansMono.zip
  DroidSansMono.zip
  FantasqueSansMono.zip
  FiraCode.zip
  FiraMono.zip
  Go-Mono.zip
  Gohu.zip
  Hack.zip
  Hasklig.zip
  HeavyData.zip
  Hermit.zip
  iA-Writer.zip
  IBMPlexMono.zip
  Inconsolata.zip
  InconsolataGo.zip
  InconsolataLGC.zip
  Iosevka.zip
  JetBrainsMono.zip
  Lekton.zip
  LiberationMono.zip
  Meslo.zip
  Monofur.zip
  Monoid.zip
  Mononoki.zip
  MPlus.zip
  Noto.zip
  OpenDyslexic.zip
  Overpass.zip
  ProFont.zip
  ProggyClean.zip
  RobotoMono.zip
  ShareTechMono.zip
  SourceCodePro.zip
  SpaceMono.zip
  Terminus.zip
  Tinos.zip
  Ubuntu.zip
  UbuntuMono.zip
  VictorMono.zip
)

NERD_FONTS_DIR=~/.local/share/nerdfonts
if [ ! -d $NERD_FONTS_DIR ]; then
  mkdir -p $NERD_FONTS_DIR
fi

{
  cd $NERD_FONTS_DIR

  for nff in ${NERD_FONT_FILES[@]}; do
    printf "PROCESSING -> [$nff]\n\n"

    if [ ! -f "$nff" ]; then
      curl -L -O -s "https://github.com/ryanoasis/nerd-fonts/releases/download/$NERD_FONTS_RELEASE/$nff"
      unzip $nff

      printf "INSTALLED Successfully\n\n"
    else
      printf "  Font already INSTALLED\n\n"
    fi
  done
}

{
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

