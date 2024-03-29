#!/bin/bash

# -------------------------------------------------------------------------------
# Dependency Installation
# -------------------------------------------------------------------------------
installRemotePackages() {
  print_step "Installing REMOTE packages"
  sudo apt-get install -y curl vim zsh
}

installLocalPackages() {
  print_step "Installing LOCAL packages"
  sudo apt-get install -y tmux
}

installStarship() {
  print_step "Installing Starship terminal prompt"

  STARSHIP_EXEC=/usr/local/bin/starship
  if [ -f $STARSHIP_EXEC ]; then
    skipping "Starship already installed at [$STARSHIP_EXEC]"
  else
    sh -c "$(curl -fsSL https://starship.rs/install.sh)"
  fi
}

installNeovimPythonProvider() {
  print_step "Install Python 3 'neovim' module into default virtualenv if it exists yet"

  if [ ! -z ${DEFAULT_PYTHON+x} ]; then
    if [ -f $DEFAULT_PYTHON/bin/python3 ]; then
      msg "Virtualenv exists so installing/re-installing 'neovim' module"
      $DEFAULT_PYTHON/bin/pip3 install neovim
    else
      skipping "Python 3 default virtualenv does NOT exist so installing module"
      warn "Some parts of Neovim may not work; make sure you run Ansible to install your default Python 3"
    fi
  else
      warn "DEFAULT_PYTHON is not set in the environment so not installing Python 3 'neovim' provider"
  fi
}

# -------------------------------------------------------------------------------
# Dotfile Symlinking
# -------------------------------------------------------------------------------
STD_DOT_CONFIG_DIR=~/.config

CONFIG_DIR=$DOTDIR/.config

REMOTE_CONFIGS=(
  bash
  direnv
  git
  psql
  readline
  sh
  vim
  zsh
)

LOCAL_CONFIGS=(
  alacritty
  awesome
  parcellite
  nvim
  starship
  tmux
  xinput
  xmodmap
)

REMOTE_INCLUDES_ENABLED_SH=(
  fzf
  go
  python
)

LOCAL_INCLUDES_ENABLED_SH=(
  android
  asdf
  dotnet
  fzf
  go
  kubectl
  node
  python
  ssh
)

REMOTE_INCLUDES_ENABLED_BASH=(
  fzf
  prompt
)

LOCAL_INCLUDES_ENABLED_BASH=(
  asdf
  aws
  fzf
  kubernetes
  node
  prompt
  ruby
  ssh
)

REMOTE_INCLUDES_ENABLED_ZSH=(
  fzf
  pass
)

LOCAL_INCLUDES_ENABLED_ZSH=(
  fzf
  gcloud
  pass
)

# on new systems, like VMS, the Standard .config directory doesn't exist
ensureStdDotConfigDirExists() {
  print_step "Ensuring $STD_DOT_CONFIG_DIR exists"
  mkdir_if_not_exist $STD_DOT_CONFIG_DIR
}

#-------------------------------------------------------------------------------
# Config Dir Symlinks
#-------------------------------------------------------------------------------
setupRemoteConfigDirSymlinks() {
  print_step "Setting up REMOTE dotfile symlinks in $STD_DOT_CONFIG_DIR"
  for conf in ${REMOTE_CONFIGS[@]}; do
    create_symlink_with_backup $CONFIG_DIR/$conf $STD_DOT_CONFIG_DIR/$conf
  done
}

setupLocalConfigDirSymlinks() {
  print_step "Setting up LOCAL dotfile symlinks in $STD_DOT_CONFIG_DIR"
  for conf in ${LOCAL_CONFIGS[@]}; do
    create_symlink_with_backup $CONFIG_DIR/$conf $STD_DOT_CONFIG_DIR/$conf
  done
}

#-------------------------------------------------------------------------------
# Home Dir Symlinks
#-------------------------------------------------------------------------------
setupRemoteHomeDirSymlinks() {
  print_step "Setting up REMOTE dotfile symlinks in ~/ directory"
  create_symlink_with_backup $STD_DOT_CONFIG_DIR/bash/.bash_profile ~/.bash_profile
  create_symlink_with_backup $STD_DOT_CONFIG_DIR/bash/.bashrc       ~/.bashrc
  create_symlink_with_backup $STD_DOT_CONFIG_DIR/git/.gitconfig     ~/.gitconfig
  create_symlink_with_backup $STD_DOT_CONFIG_DIR/psql/.psqlrc       ~/.psqlrc
  create_symlink_with_backup $STD_DOT_CONFIG_DIR/readline/inputrc   ~/.inputrc
  create_symlink_with_backup $STD_DOT_CONFIG_DIR/vim                ~/.vim
  create_symlink_with_backup $STD_DOT_CONFIG_DIR/zsh/.zshenv        ~/.zshenv

}

setupLocalHomeDirSymlinks() {
  print_step "Setting up LOCAL dotfile symlinks in ~/ directory"
  create_symlink_with_backup $STD_DOT_CONFIG_DIR/tmux               ~/.tmux
  create_symlink_with_backup $STD_DOT_CONFIG_DIR/tmux/tmux.conf     ~/.tmux.conf
}

#-------------------------------------------------------------------------------
# Includes Enabled Symlinks
#-------------------------------------------------------------------------------
setupIncludesEnabledSymlinks() {
  # Valid values: remote|local
  local include_type=$1

  for shell in sh bash zsh; do
    includes_enabled_var=${include_type^^}_INCLUDES_ENABLED_${shell^^}[@]

    for conf in ${!includes_enabled_var}; do
      create_symlink_with_backup ~/.config/$shell/includes/$conf.$shell ~/.config/$shell/includes-enabled/$conf.$shell
    done
  done
}

#-------------------------------------------------------------------------------
# LOCAL Dotfiles
#-------------------------------------------------------------------------------
setupLocalDotfiles() {
  print_step "Setup local dotfiles directory if it does not exist"
  if [ ! -d $LOCAL_DOTDIR ]; then
    msg "Making local dotfiles directory $LOCAL_DOTDIR"
    mkdir -p $LOCAL_DOTDIR

    msg "Initializing local dotfiles directory as git repository"
    cd $LOCAL_DOTDIR
    git init

    msg "Creating empty 'desktop' directory in repo for .desktop files"
    mkdir desktop

    msg "Creating symlink to .desktop files directory in ~/.local/share/applications"
    create_symlink_with_backup $LOCAL_DOTDIR/desktop ~/.local/share/applications/local_dotdir

    msg "Creating empty local 'aliases' file in repo"
    touch aliases

    msg "Creating empty local 'rc' file in repo"
    touch rc

    msg "Committing empty local aliases/rc files"
    git add aliases rc
    git commit -m"Initial commit - adding empty aliases/rc files"
  else
    skipping "Local dotfiles directory at $LOCAL_DOTDIR already exists"
  fi
}


# -------------------------------------------------------------------------------
#  Dotfile "Profile" Methods
# -------------------------------------------------------------------------------
setupMinimalSystem() {
  ensureStdDotConfigDirExists
  setupRemoteConfigDirSymlinks
  setupRemoteHomeDirSymlinks
  setupIncludesEnabledSymlinks remote
}

setupPersonalSystem() {
  installRemotePackages
  installLocalPackages
  installStarship

  # .config Setup
  ensureStdDotConfigDirExists
  setupRemoteConfigDirSymlinks
  setupLocalConfigDirSymlinks
  setupRemoteHomeDirSymlinks
  setupLocalHomeDirSymlinks
  setupIncludesEnabledSymlinks local
  setupLocalDotfiles

  installNeovimPythonProvider

  .config/tmux/install.sh
  .config/git/install.sh

  desktop/install.sh

  gui/vscode/install.sh

  # NOT for remote machines - TODO figure out how to flag when to run these
  # ssh/install.sh
}
