#!/usr/local/bin/bash
# ####### #
# BASHing #
# ####### #
# calculate day suffix
daySuffix() {
  case `date +%d` in
    1|21|31) echo "st";;
    2|22)    echo "nd";;
    3|23)    echo "rd";;
    *)       echo "th";;
  esac
}

awesomeify() {
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


  # ######### #
  # init vars #
  # ######### #
  local TIMESTAMP=$(date +"%H:%M")
  local THEUSER=" \u: "
  local PROMPT="» "

  # grab git status
  read isGit isBranch isStatus <<< $(isInGit 2> /dev/null)
  # if is git repo
  if [[ $isGit ]]; then
    # set branch name and cute apple
    BRANCH=" $isBranch"
    # if clean repo
    if [[ $isStatus == "" ]]; then
      # green status
      CLR=$GREEN
    # if dirty repo
    else
      # red status
      CLR=$RED
    fi
  # if not git repo
  else
    # make branch and status empty
    BRANCH=""
  fi


# BASH prompt customisation
PS1="\
\[$BOLD$WHITE\][\
\[$BLACK\]$TIMESTAMP\
\[$WHITE\]]\
\[$RESET$MAGENTA\]$THEUSER\
\[$BLUE\]${PWD##*/}\
\[$DIM$CLR\]$BRANCH\
$BREAK\
\[$RESET$YELLOW\]$PROMPT\
\[$RESET\]\
"
}

# make BASH awesome
PROMPT_COMMAND=awesomeify

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
