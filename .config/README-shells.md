Summary
=======

All of this is explained here:

  - https://shreevatsa.wordpress.com/2008/03/30/zshbash-startup-files-loading-order-bashrc-zshrc-etc/


Login Shells
============

Bash - Login, Interactive
-------------------------

```
/etc/profile
  -> ~/.bash_profile, if not exists:
    -> ~/.bash_login, if not exists:
    -> ~/.profile
  ->
  -> ~/.bash_logout
```

Bash does *not* load `.bashrc` for login shells.


Zsh - Login, Interactive
------------------------

```
/etc/.zshenv
  -> ~/.zshenv
  -> /etc/zprofile
  -> ~/.zprofile
  -> /etc/zshrc
  -> ~/.zshrc
  -> /etc/zlogin
  -> ~/.zlogin
  ->
  -> ~/.zlogout
  -> /etc/zlogout
```


Non-Login Shells
================


Bash - Non-Login, Interactive (terminal)
----------------------------------------

```
/etc/bash.bashrc
  -> .bashrc
```


Zsh - Non-Login, Interactive (terminal)
---------------------------------------

```
/etc/.zshenv
  -> ~/.zshenv
  -> /etc/zprofile
  -> /etc/zshrc
  -> ~/.zshrc
```


Non-Interactive Shells (scripts)
================================

Bash - Non-Interactive
-----------------------------

```
source $BASH_ENV
```


Zsh - Non-Interactive
----------------------------

```
/etc/.zshenv
  -> ~/.zshenv
```

