# -------------------------------------------------------------------------------
# CONSTANTS
# -------------------------------------------------------------------------------
# TODO: figure out a better spot to put these b/c they are duplicated in the
# bootstrap repo as well
DEFAULT_GITHUB_NAME="Matthew Mackey"
DEFAULT_GITHUB_EMAIL="21043873+matthewmackey@users.noreply.github.com"

# -------------------------------------------------------------------------------
# Dependency Installation
# -------------------------------------------------------------------------------
installRemotePackages() {
  print_step "Installing REMOTE packages"
  sudo apt-get install -y curl tmux vim zsh
}

installLocalPackages() {
  print_step "Installing LOCAL packages"
  msg "NONE to install"
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

# -------------------------------------------------------------------------------
# Dotfile Symlinking
# -------------------------------------------------------------------------------
STD_DOT_CONFIG_DIR=~/.config

CONFIG_DIR=$DOTDIR/.config

REMOTE_CONFIGS=(
  bash
  direnv
  git
  go
  psql
  readline
  sh
  tmux
  vim
  zsh
)

LOCAL_CONFIGS=(
  alacritty
  awesome
  fontconfig
  parcellite
  # nvim
  starship
  tmux
  xinput
  xmodmap
)

REMOTE_INCLUDES_ENABLED_SH=(
  fzf
  go
  hacker
  python
  rust
)

LOCAL_INCLUDES_ENABLED_SH=(
  android
  asdf
  dotnet
  fzf
  go
  kubectl
  pnpm
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
setupRemoteDotConfigDirSymlinks() {
  print_step "Setting up REMOTE dotfile symlinks in $STD_DOT_CONFIG_DIR"
  for conf in ${REMOTE_CONFIGS[@]}; do
    create_symlink_with_backup $CONFIG_DIR/$conf $STD_DOT_CONFIG_DIR/$conf
  done
}

setupLocalDotConfigDirSymlinks() {
  print_step "Setting up LOCAL dotfile symlinks in $STD_DOT_CONFIG_DIR"
  for conf in ${LOCAL_CONFIGS[@]}; do
    create_symlink_with_backup $CONFIG_DIR/$conf $STD_DOT_CONFIG_DIR/$conf
  done
}

#-------------------------------------------------------------------------------
# Home Dir Symlinks
#-------------------------------------------------------------------------------
setupRemoteHomeDirSymlinks() {
  print_step "Setting up REMOTE dotfile symlinks in \$HOME directory"
  create_symlink_with_backup $STD_DOT_CONFIG_DIR/bash/.bash_profile ~/.bash_profile
  create_symlink_with_backup $STD_DOT_CONFIG_DIR/bash/.bashrc ~/.bashrc
  create_symlink_with_backup $STD_DOT_CONFIG_DIR/git/.gitconfig ~/.gitconfig
  create_symlink_with_backup $STD_DOT_CONFIG_DIR/psql/.psqlrc ~/.psqlrc
  create_symlink_with_backup $STD_DOT_CONFIG_DIR/readline/inputrc ~/.inputrc
  create_symlink_with_backup $STD_DOT_CONFIG_DIR/vim ~/.vim
  create_symlink_with_backup $STD_DOT_CONFIG_DIR/zsh/.zshenv ~/.zshenv
  create_symlink_with_backup $STD_DOT_CONFIG_DIR/tmux ~/.tmux
  create_symlink_with_backup $STD_DOT_CONFIG_DIR/tmux/tmux.conf ~/.tmux.conf
}

setupLocalHomeDirSymlinks() {
  print_step "Setting up LOCAL dotfile symlinks in \$HOME directory"
  msg "NONE to setup"
}

#-------------------------------------------------------------------------------
# Includes Enabled Symlinks
#-------------------------------------------------------------------------------
setupIncludesEnabledSymlinks() {
  # Valid values: remote|local
  local include_type=$1

  print_step "Setting up [$include_type] includes-enabled symlinks"

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

    msg "Setting local git config for [user.name]"
    git config --local user.name "$DEFAULT_GITHUB_NAME"

    msg "Setting local git config for [user.email]"
    git config --local user.email "$DEFAULT_GITHUB_EMAIL"

    msg "Creating empty 'desktop' directory in repo for .desktop files"
    mkdir desktop

    msg "Creating symlink to .desktop files directory in ~/.local/share/applications"
    _LOCAL_SHARE_APP_DIR=~/.local/share/applications
    if [ ! -d $_LOCAL_SHARE_APP_DIR ]; then
      msg "Creating directory: $_LOCAL_SHARE_APP_DIR"
      mkdir -p $_LOCAL_SHARE_APP_DIR
    fi
    create_symlink_with_backup $LOCAL_DOTDIR/desktop $_LOCAL_SHARE_APP_DIR/local_dotdir
    unset _LOCAL_SHARE_APP_DIR

    msg "Creating empty local 'aliases' file in repo"
    touch aliases

    msg "Creating empty local 'rc' file in repo"
    touch rc

    # TODO: fix dependency with .config/tmux/install.sh in the dotfiles repo that
    # needs this local tmux.conf file to exist or that script will fail; that
    # script script (or actually tmux.conf that sources this file) should be
    # more robust
    msg "Creating empty local 'tmux.conf' file in repo"
    touch tmux.conf

    msg "Committing empty local aliases/rc/tmux.conf files"
    git add aliases rc tmux.conf
    git commit -m"Initial commit - adding empty aliases/rc/tmux.conf files"

    msg "Renaming 'master' branch to 'main'"
    git branch -m main
  else
    skipping "Local dotfiles directory at $LOCAL_DOTDIR already exists"
  fi
}

# -------------------------------------------------------------------------------
#  Dotfile "Profile" Methods
# -------------------------------------------------------------------------------
setupMinimalSystem() {
  installRemotePackages

  # .config Setup
  ensureStdDotConfigDirExists

  setupRemoteDotConfigDirSymlinks
  setupRemoteHomeDirSymlinks

  setupIncludesEnabledSymlinks remote
}

setupMinimalGuiSystem() {
  installRemotePackages
  installStarship

  # .config Setup
  ensureStdDotConfigDirExists

  setupRemoteDotConfigDirSymlinks
  setupRemoteHomeDirSymlinks

  setupLocalDotConfigDirSymlinks
  setupLocalHomeDirSymlinks

  setupIncludesEnabledSymlinks remote

  setupLocalDotfiles

  $DOTDIR/.config/tmux/install.sh
}

setupPersonalSystem() {
  installRemotePackages
  installLocalPackages
  installStarship

  # .config Setup
  ensureStdDotConfigDirExists

  setupRemoteDotConfigDirSymlinks
  setupRemoteHomeDirSymlinks

  setupLocalDotConfigDirSymlinks
  setupLocalHomeDirSymlinks

  setupIncludesEnabledSymlinks local

  setupLocalDotfiles

  $DOTDIR/.config/tmux/install.sh
  $DOTDIR/.config/git/install.sh

  $DOTDIR/desktop/install.sh

  $DOTDIR/lib/setup_dirs.sh

  # NOT for remote machines - TODO figure out how to flag when to run these
  # ssh/install.sh
}
