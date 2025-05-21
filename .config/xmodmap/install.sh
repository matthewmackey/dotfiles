#!/bin/sh

CONF_DIR=~/.config/xmodmap
SYSTEMD_DIR=~/.config/systemd/user

XMODMAP_RC=$CONF_DIR/.Xmodmap

XMODMAP_SWITCH_NO_ESCAPE=$CONF_DIR/.xmodmap-switch_no_escape
XMODMAP_SWITCH_RIGHT_CLICK_KEY=$CONF_DIR/.xmodmap-switch_right_click_key

XMODMAP_USER_SERVICE=$SYSTEMD_DIR/xmodmap-apply.service
XMODMAP_USER_TIMER=$SYSTEMD_DIR/xmodmap-apply.timer

setupXmodmapConf() {
  if [ ! -L $CONF_DIR ]; then
    ln -s ~/dotfiles/xmodmap $CONF_DIR
  fi

  cat $XMODMAP_SWITCH_NO_ESCAPE >$XMODMAP_RC
  # Disabling Right-key remapping as it doesn't work
  # cat $XMODMAP_SWITCH_RIGHT_CLICK_KEY >>$XMODMAP_RC

  echo
  cat $XMODMAP_RC
}

setupXmodmapUserSystemd() {
  if [ ! -d $SYSTEMD_DIR ]; then
    mkdir -p $SYSTEMD_DIR
  fi

  cat <<EOF >$XMODMAP_USER_SERVICE
  [Unit]
  Description=Apply custom xmodmap
  After=graphical-session.target

  [Service]
  Type=oneshot
  ExecStart=/usr/bin/xmodmap $XMODMAP_RC
  RemainAfterExit=true

  [Install]
  WantedBy=default.target
EOF

  cat <<EOF >$XMODMAP_USER_TIMER
  [Unit]
  Description=Timer to reapply xmodmap on boot and resume

  [Timer]
  OnBootSec=30
  OnUnitActiveSec=10min
  Persistent=true

  [Install]
  WantedBy=timers.target
EOF

  systemctl --user daemon-reexec
  systemctl --user enable xmodmap-apply.service
  systemctl --user enable --now xmodmap-apply.timer
}

setupXmodmapConf
setupXmodmapUserSystemd
