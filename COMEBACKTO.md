* in .bashrc, fix the .local/ansible_bash loop so that if the ansible_bash dir
  is empty that the .bashrc script won't report an error to the console every
  time `exec $SHELL` is run

