Requirements
============

- I want to be able to do a `git pull` from any machine to get the latest
  updates and have them work on that machine.

- I want to be able to make changes to the latest version of the repo on ANY
  machine it is deployed to, push those changes back to the remote repo, and
  ensure that those changes work on any other machine that pulls the changes
  down.

- I want some sort of install script that IDEMPOTENTLY applies that latest
  changes (though not necessarily deleting any previous changes that it no
  longer knows about) so I can run it whenever I pull down the latest changes.

- I think I may want a "simple" install that will just setup the things I would
  want at any terminal:

    - Bash (general config & aliases)
    - Bashmarks
    - Vim
    - Git
    - Tmux

- I want to be able to run this on both servers and desktops with GUIs so the
  GUI-related stuff needs to be able to be separated and left out when not
  applicable.


All of these requirements indicate that the install script and the dotfiles
contained in the repo must be very robust and aware of the environment in
which they are either deployed in or which changes are going to be deployed
into.


Implementation
==============

There seem to be two parts to get this project implemented:

1. Symlinking .bashrc and non-Bash-related files into the right places on the
   filesystem
2. Setting up the Bash-related files and then sourcing them (via .bashrc)


Bugs/Improvements
=================

- Update main install.sh so that it will pull in ANY *.bash file in the
  subdirectories
- Fix ssh_completion.bash so `cat known_hosts` doesn't cause issue on hosts w/o
  that file
- Remove installation of base16-shell from simple/remote machine logins, OR
  consider how that will work on remote machines where shell is defined by my
  Lenovo terminal colors already
