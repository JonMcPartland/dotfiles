#!/bin/bash

# Prepend timestamp to `history`
HISTTIMEFORMAT="%d/%m/%y %T "

# sources
for file in ~/.bashfiles/.{path,locations,aliases,functions,gitinfo,notify,options,vhosts,bashrc}; do
  if [[ -r $file && -f $file ]]; then
    . $file
  fi
done;
unset file
