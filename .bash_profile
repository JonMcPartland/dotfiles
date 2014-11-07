#!/bin/bash
# ####### #
# PATHing #
# ####### #

# Prepend timestamp to `history`
HISTTIMEFORMAT="%H:%M:%S "

# PATH
<<<<<<< HEAD
PATH="/usr/local/mysql/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/local/git/bin:/Users/Jon/.rvm/bin:${PATH}"

# rbenv
export RBENV_ROOT=/usr/local/var/rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
=======
PATH="/Users/jon/.rvm/gems/ruby-2.1.0/bin:/Users/jon/.rvm/gems/ruby-2.1.0@global/bin:/Users/jon/.rvm/rubies/ruby-2.1.0/bin:/usr/local/mysql/bin:/usr/local/bin:/usr/local/git/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/Users/jon/.rvm/bin:${PATH}"
>>>>>>> 020226e3f5a5c821de56a33655d48abead950020

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
