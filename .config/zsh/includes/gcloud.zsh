#
# gcloud.zsh
#
_GCLOUD_ZSH_COMP=/usr/share/google-cloud-sdk/completion.zsh.inc

if [[ -f $_GCLOUD_ZSH_COMP ]]; then
  mkdir_if_not_exist $ZSH_COMP_DIR
  cp $_GCLOUD_ZSH_COMP $ZSH_COMP_DIR/gcloud.zsh
fi

unset _GCLOUD_ZSH_COMP
