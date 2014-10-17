#!/bin/bash
# ####### #
# PATHing #
# ####### #

# Prepend timestamp to `history`
HISTTIMEFORMAT="%H:%M:%S "

# PATH
PATH="/Users/Jon/.rvm/gems/ruby-2.1.3/bin:/Users/Jon/.rvm/gems/ruby-2.1.3@global/bin:/Users/Jon/.rvm/rubies/ruby-2.1.3/bin:/usr/local/mysql/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/local/git/bin:/Users/Jon/.rvm/bin:${PATH}"

if [ -n "$PATH" ]; then
  old_PATH=$PATH; PATH=
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
