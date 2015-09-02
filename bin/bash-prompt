#!/usr/local/bin/bash

awesomeify() {
  PS1=""

  # set scheme vars
  local BLACK=$(tput setaf 0)
  local RED=$(tput setaf 1)
  local GREEN=$(tput setaf 2)
  local YELLOW=$(tput setaf 3)
  local BLUE=$(tput setaf 4)
  local MAGENTA=$(tput setaf 5)
  local CYAN=$(tput setaf 6)
  local WHITE=$(tput setaf 7)
  local BOLD=$(tput bold)
  local DIM=$(tput dim)
  local RESET=$(tput sgr0)
  local BREAK="\n"


  # timestamp
  PS1+="\[$BOLD$WHITE\][\[$BLACK\]$(date +"%H:%M")\[$BOLD$WHITE\]]"
  # user name
  PS1+="\[$RESET$MAGENTA\] \u "


  # pwd prefix
  PS1+="\[$RESET$WHITE\]in \[$BLUE\]"

  # pwd
  if [[ ${PWD##*/} == "" ]]; then
    PS1+="/"
  elif [[ ${PWD##*/} == $(whoami) ]]; then
    PS1+="~"
  else
    PS1+="${PWD##*/}"
  fi


  # grab git info
  read ISGIT BRANCH STATUS <<< $(isInGit 2> /dev/null)

  # if is git repo
  if [[ $ISGIT ]]; then
    # if clean repo
    if [[ $STATUS == "" ]]; then
      # green status
      CLR=$GREEN
    # if dirty repo
    else
      # red status
      CLR=$RED
    fi

    # set branch name
    PS1+="\[$RESET$WHITE\] on \[$DIM$CLR\]$BRANCH"
  fi


  # the prompt itself
  PS1+="$BREAK\[$RESET$YELLOW\]» \[$RESET\]"
}

# make BASH awesome
PROMPT_COMMAND=awesomeify
