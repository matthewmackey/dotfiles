#
# arduino.zsh
#
ARDUINO_COMP_FILE=$ZSH_COMP_DIR/_arduino-cli

if [[ ! -f $ARDUINO_COMP_FILE ]]; then
  echo Making file
  arduino-cli completion zsh > $ARDUINO_COMP_FILE
fi
