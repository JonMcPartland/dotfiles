#!/bin/bash
# ####### #
# PATHing #
# ####### #

# Prepend timestamp to `history`
HISTTIMEFORMAT="%H:%M:%S "

# PATH
PATH="/Users/jon/.rvm/gems/ruby-2.1.0/bin:/Users/jon/.rvm/gems/ruby-2.1.0@global/bin:/Users/jon/.rvm/rubies/ruby-2.1.0/bin:/usr/local/mysql/bin:/usr/local/bin:/usr/local/git/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/Users/jon/.rvm/bin:${PATH}"

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

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

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
