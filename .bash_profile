#!/bin/bash
# ####### #
# PATHing #
# ####### #

# Prepend timestamp to `history`
HISTTIMEFORMAT="%H:%M:%S "

# PATH
PATH="/usr/local/bin:/usr/local/git/bin:/usr/local/mysql/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:${PATH}"

# rbenv
export RBENV_ROOT=/usr/local/var/rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

if [ -n "$PATH" ]; then
  old_PATH=$PATH:; PATH=
  while [ -n "$old_PATH" ]; do
    x=${old_PATH%%:*}       # the first remaining entry
    case $PATH: in
      *:"$x":*) ;;          # already there
      *) PATH=$PATH:$x;;    # not there yet
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
