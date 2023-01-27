#-------------------------------------------------------------------------------
# .zshrc
#-------------------------------------------------------------------------------

[[ -f ~/.config/sh/rc ]] && source ~/.config/sh/rc

# Must be after interactive shell confirmation
section "Sourcing -> ~/.config/zsh/.zshrc"

#---------------------------------------
# [General] {{{
#---------------------------------------
  # See: https://scriptingosx.com/2019/06/moving-to-zsh-part-3-shell-options/
  HISTFILE=${ZDOTDIR}/.zsh_history
  SAVEHIST=10000
  HISTSIZE=10000
  setopt appendhistory
  setopt autocd
  setopt nocaseglob
  setopt correct
  setopt correctall
  setopt extendedhistory
  setopt incappendhistory
  setopt histexpiredupsfirst
  setopt histignoredups
  setopt histreduceblanks
  setopt histverify
  setopt sharehistory

  export ZSH_COMP_DIR=~/.config/zsh/completions
  export ZSH_PLUGIN_DIR=~/.config/zsh/plugins

  # Needed for some oh-my-zsh plugins
  export ZSH_CACHE_DIR=~/.cache/zsh

  DIRS=(
    $ZSH_CACHE_DIR
    $ZSH_COMP_DIR
    ~/.config/zsh/functions
    $ZSH_PLUGIN_DIR
  )

  for d in ${DIRS[@]}; do
    mkdir_if_not_exist $d
  done

# }}}


#---------------------------------------
# [Plugins] {{{
#---------------------------------------

  installZshPlugin() {
    local _gh_plugin_repo=$1
    local _plugin_source_file=$2

    _plugin_clone_dir=$ZSH_PLUGIN_DIR/${_gh_plugin_repo}

    if [ ! -d $_plugin_clone_dir ]; then
      _gh_url="https://github.com/${_gh_plugin_repo}.git"
      msg "Cloning [$_gh_url] into [$_plugin_clone_dir]"
      git clone $_gh_url $_plugin_clone_dir
    fi

    if [ ! -f $_plugin_clone_dir/$_plugin_source_file ]; then
      (
        cd $_plugin_clone_dir
        git pull >/dev/null
      )
    fi
    source_file_if_exists $_plugin_clone_dir/$_plugin_source_file
  }

  # installZshPlugin ohmyzsh/ohmyzsh plugins/kubectl/kubectl.plugin.zsh
  installZshPlugin zsh-users/zsh-syntax-highlighting zsh-syntax-highlighting.zsh
  installZshPlugin matthewmackey/shell-plugins plugins/docker/common.sh
  installZshPlugin matthewmackey/shell-plugins plugins/gcloud/common.sh
  installZshPlugin matthewmackey/shell-plugins plugins/kubectl/common.sh
  installZshPlugin matthewmackey/shell-plugins plugins/node/common.sh
  installZshPlugin matthewmackey/shell-plugins plugins/systemctl/common.sh
  installZshPlugin matthewmackey/shell-plugins plugins/terraform/common.sh
# }}}


#---------------------------------------
# [Miscellaneous] {{{
#---------------------------------------
  if which zoxide >&/dev/null; then
    eval "$(zoxide init zsh)"
  fi

  export STARSHIP_CONFIG=~/.config/starship/config.toml
  if which starship >&/dev/null; then
    eval "$(starship init zsh)"
  fi

  # Setup `asdf-direnv` shell integration
  # SEE: https://github.com/asdf-community/asdf-direnv
  #
  # This will run end up running `eval "$(direnv hook zsh)"` so we don't need to
  # explicitly do that in .zshrc as well.
  #
  # WARNING: you must manually run `asdf direnv setup` again if the `direnv` binary ever changes
  source "${XDG_CONFIG_HOME:-$HOME/.config}/asdf-direnv/zshrc"

# plugins=(copydir copyfile git kubectl vi-mode)
# VI_MODE_RESET_PROMPT_ON_MODE_CHANGE=true
# VI_MODE_SET_CURSOR=true
# MODE_INDICATOR="%F{yellow}<<<%f"

# Fix git paging issues w/ oh-my-zsh
# https://superuser.com/questions/820943/typing-git-log-oneline-in-oh-my-zsh-pipes-to-less
#unset LESS

# }}}


#---------------------------------------
# [SOURCE Zsh Includes] {{{
#---------------------------------------
  FILES_TO_SOURCE=()
  FILES_TO_SOURCE+=(~/.config/zsh/aliases.zsh)
  FILES_TO_SOURCE+=($(find ~/.config/zsh/includes-enabled -name '*.zsh'))
  FILES_TO_SOURCE+=($LOCAL_DOTDIR/zshrc)
  FILES_TO_SOURCE+=($LOCAL_DOTDIR/aliases.zsh)

  for _file in ${FILES_TO_SOURCE[@]}; do
    source_file_if_exists $_file
  done
# }}}


#---------------------------------------
# [OTHER] {{{
#---------------------------------------
source_local_dotfiles
xmswitch

# }}}


#---------------------------------------
# [COMPLETIONS]] {{{
#---------------------------------------
fpath=(${ASDF_DIR}/completions $fpath)
autoload -Uz compinit && compinit

# }}}


# vim: ft=bash  foldlevel=0 foldmarker={{{,}}} foldmethod=marker
