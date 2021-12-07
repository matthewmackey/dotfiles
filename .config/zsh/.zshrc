#
# .zshrc
#

[[ -f ~/.config/sh/rc ]] && source ~/.config/sh/rc

# Must be after interactive shell confirmation
printf "Sourcing -> [~/.config/zsh/.zshrc]\n"


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
  DIRS=(
    $ZSH_COMP_DIR
    ~/.config/zsh/functions
    $ZSH_PLUGIN_DIR
  )

  for d in ${DIRS[@]}; do
    mkdir_if_not_exist $d
  done

  autoload -Uz compinit && compinit
# }}}


#---------------------------------------
# [Plugins] {{{
#---------------------------------------

  installZshPlugin() {
    local _gh_plugin_repo=$1
    local _plugin_source_file=$2

    _plugin_dir=$ZSH_PLUGIN_DIR/${_gh_plugin_repo}

    if [ ! -d $_plugin_dir ]; then
      _gh_url="https://github.com/${_gh_plugin_repo}.git"
      printf "Cloning [$_gh_url] into [$_plugin_dir]\n\n"
      git clone $_gh_url $_plugin_dir
    fi
    source $_plugin_dir/$_plugin_source_file
  }

  installZshPlugin zsh-users/zsh-syntax-highlighting zsh-syntax-highlighting.zsh
# }}}


#---------------------------------------
# [Miscellaneous] {{{
#---------------------------------------
  eval "$(zoxide init zsh)"

  export STARSHIP_CONFIG=~/.config/starship/config.toml
  eval "$(starship init zsh)"

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
  FILES_TO_SOURCE+=($DOTDIR/.config/zsh/aliases)
  FILES_TO_SOURCE+=($(find $DOTDIR/.config/zsh/includes -type f))
  FILES_TO_SOURCE+=($LOCAL_DOTDIR/zshrc)
  FILES_TO_SOURCE+=($LOCAL_DOTDIR/aliases.zsh)

  for _file in ${FILES_TO_SOURCE[@]}; do
    source_file_if_exists $_file
  done
# }}}


# Reload any completions that were loaded
autoload -U compinit && compinit

# vim: ft=sh  foldlevel=0 foldmarker={{{,}}} foldmethod=marker
