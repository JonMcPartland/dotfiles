#!/bin/bash

# Prepend timestamp to `history`
HISTTIMEFORMAT="%H:%M:%S "

# sources
for file in ~/.bashfiles/.{path,locations,aliases,gitinfo,notify,options,vhosts,bashrc}; do
  [ -r "$file" ] && [ -f "$file" ] && . "$file"
done;
unset file
