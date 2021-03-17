#!/bin/bash

ANSIBLE_ROOT=~/pc-setup/ansible_root

ROLE=$1
[ -z "$ROLE" ] && { echo "You must provide: <role_name>"; exit 1; }

ROLE_TASK_DIR="$ANSIBLE_ROOT/roles/$ROLE/tasks"
mkdir -p "$ROLE_TASK_DIR"

TASK_MAIN_YML="$ROLE_TASK_DIR/main.yml"
[ -f "$TASK_MAIN_YML" ] && { echo "Main task file [$TASK_MAIN_YML] already exists"; exit 1; }
echo -e "---\n" > "$TASK_MAIN_YML"
vi "$TASK_MAIN_YML"

