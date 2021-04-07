#!/bin/bash

#CONFIG_IN=~/.cinnamon/configs/pomodoro@gregfreeman.org/pomodoro@gregfreeman.org.json.orig
CONFIG_IN=~/.cinnamon/configs/pomodoro@gregfreeman.org/pomodoro@gregfreeman.org.json
CONFIG_OUT=~/.cinnamon/configs/pomodoro@gregfreeman.org/pomodoro@gregfreeman.org.json

NEW_DURATION_MINS=$1

if [ -z "$NEW_DURATION_MINS" ]; then
  CURR_DURATION_MINS=$(cat $CONFIG_OUT | jq '.pomodoro_duration.value')
  read -p "Enter new pomododo duration (current [$CURR_DURATION_MINS min]): " NEW_DURATION_MINS
fi

NEW_CONFIG=$(cat $CONFIG_IN | jq 'setpath(["pomodoro_duration", "value"]; '$NEW_DURATION_MINS')')
echo "$NEW_CONFIG" >$CONFIG_OUT
