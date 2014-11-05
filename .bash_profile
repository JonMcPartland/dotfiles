#!/bin/bash
# ####### #
# PATHing #
# ####### #

# Prepend timestamp to `history`
HISTTIMEFORMAT="%H:%M:%S "

# PATH
PATH="/usr/local/mysql/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/local/git/bin:/Users/Jon/.rvm/bin:${PATH}"

# rbenv
export RBENV_ROOT=/usr/local/var/rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

if [ -n "$PATH" ]; then
  old_PATH=$PATH:; PATH=
  while [ -n "$old_PATH" ]; do
    x=${old_PATH%%:*}
    case $PATH: in
      *:"$x":*) ;;
      *) PATH=$PATH:$x;;
    esac
    old_PATH=${old_PATH#*:}
  done
  PATH=${PATH#:}
  unset old_PATH x
fi

# load BASH autocomplete from homebrew
if [ -f $(brew --prefix)/share/bash-completion/bash_completion ]; then
  . $(brew --prefix)/share/bash-completion/bash_completion
fi

# ####### #
# Saucing #
# ####### #
. ~/.bashfiles/.bashaliases     # alias file
. ~/.bashfiles/.bashnotify      # growl/osa notifications
. ~/.bashfiles/.bashcontacts    # address book
. ~/.bashfiles/.bashmessage     # imessage
. ~/.bashfiles/.bashgit         # git info
. ~/.bashfiles/.bashvhosts      # apache hosts
. ~/.bashrc                     # ps1/prompt
