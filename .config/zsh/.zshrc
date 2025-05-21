#-------------------------------------------------------------------------------
# .zshrc
#-------------------------------------------------------------------------------
[ -f ~/.config/sh/env ] && source ~/.config/sh/env

[ -f ~/.config/sh/rc ] && source ~/.config/sh/rc

[ -f ~/.config/zsh/.zprofile ] && source ~/.config/zsh/.zprofile

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

  installOhMyZshPluginDirectly() {
    local _ohmyzsh_plugin_name=$1

    local _plugin_clone_dir=$ZSH_PLUGIN_DIR/ohmyzsh/${_ohmyzsh_plugin_name}
    local _plugin_source_file=${_plugin_clone_dir}/${_ohmyzsh_plugin_name}.plugin.zsh

    local _ohmyzsh_plugin_source_file_url=https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/${_ohmyzsh_plugin_name}/${_ohmyzsh_plugin_name}.plugin.zsh

    if [ ! -d $_plugin_clone_dir ]; then
      mkdir_if_not_exist $_plugin_clone_dir
    fi

    if [ ! -f $_plugin_source_file ]; then
      msg "Installing OhMyZsh plugin source file directly from: [${_ohmyzsh_plugin_source_file_url}]"
      curl -o $_plugin_source_file $_ohmyzsh_plugin_source_file_url
    fi

    source_file_if_exists $_plugin_source_file
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
# [OhMyZsh vi-mode without OhMyZsh ] {{{
#---------------------------------------

  #-----------------------------------------------------------------------------------
  # These are the manual steps needed to get the MODE_INDICATORs to work without
  # the full OhMyZsh library:
  #
  # 1. Inject $MODE_INDICATOR into PROMPT.
  #
  # 2. Add zle-keymap-select to auto-refresh prompt.
  #
  # 3. Customize colors with VI_MODE_* vars.
  #-----------------------------------------------------------------------------------

  #--------------------------------------------
  # 1. Inject $MODE_INDICATOR into PROMPT.
  #--------------------------------------------

  #--------------------------------------------
  # 2. Add zle-keymap-select to auto-refresh prompt.
  #--------------------------------------------
  function zle-keymap-select {
    zle reset-prompt
  }
  zle -N zle-keymap-select

  # Also for exiting the line editor
  function zle-line-finish {
    zle reset-prompt
  }
  zle -N zle-line-finish

  #--------------------------------------------
  # 3. Customize colors with VI_MODE_* vars.
  #--------------------------------------------

  # VI_MODE_RESET_PROMPT_ON_MODE_CHANGE: controls whether the prompt is redrawn when switching
  # to a different input mode. If this is unset, the mode indicator will not be updated when changing
  # to a different mode. Set it to true to enable it.
  #
  # The default value is unset, unless `vi_mode_prompt_info` is used, in which case it'll automatically be set to true.
  VI_MODE_RESET_PROMPT_ON_MODE_CHANGE=true

  # VI_MODE_DISABLE_CLIPBOARD: If set, disables clipboard integration on yank/paste
  # VI_MODE_DISABLE_CLIPBOARD=true

  # MODE_INDICATOR: controls the string displayed when the shell is in normal mode.
  # MODE_INDICATOR="%F{yellow}<<<%f"
  MODE_INDICATOR="%F{red}<<<+%f"
  MODE_INDICATOR="🔴 NORMAL"

  # INSERT_MODE_INDICATOR: controls the string displayed when the shell is in insert mode.
  INSERT_MODE_INDICATOR="%F{yellow}+%f"
  INSERT_MODE_INDICATOR="🟢 INSERT"

  # VI_MODE_SET_CURSOR: controls whether the cursor style is changed when switching to a different input mode.
  # Set it to true to enable it (default: unset).
  #
  # 0, 1 - Blinking block
  # 2 - Solid block
  # 3 - Blinking underline
  # 4 - Solid underline
  # 5 - Blinking line
  # 6 - Solid line
  VI_MODE_SET_CURSOR=true
  VI_MODE_CURSOR_NORMAL=2
  VI_MODE_CURSOR_VISUAL=6
  VI_MODE_CURSOR_INSERT=6
  VI_MODE_CURSOR_OPPEND=0

  installOhMyZshPluginDirectly vi-mode

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

# Fix git paging issues w/ oh-my-zsh
# https://superuser.com/questions/820943/typing-git-log-oneline-in-oh-my-zsh-pipes-to-less
#unset LESS

  # Setup `envman` - used by `webi` (see https://webinstall.dev)
  [ -f ~/.config/envman/load.sh ] && source ~/.config/envman/load.sh

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

# }}}


#---------------------------------------
# [COMPLETIONS]] {{{
#---------------------------------------
fpath=(${ASDF_DIR}/completions $fpath)

# AWS completer
# See: https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-completion.html
_AWS_COMPLETER=/usr/local/bin/aws_completer
if [ -f $_AWS_COMPLETER ]; then
  autoload bashcompinit && bashcompinit
  autoload -Uz compinit && compinit
  complete -C '/usr/local/bin/aws_completer' aws
else
  autoload -Uz compinit && compinit
fi
unset _AWS_COMPLETER

# }}}



# vim: ft=bash  foldmarker={{{,}}} foldmethod=marker
