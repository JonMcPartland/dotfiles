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
  # qty of items in current dir
  local files=$(ls -l | grep -v ^l | wc -l)
  # system uptime
  local uptime=$(uptime | awk '{print $3}' | sed 's/,//g')
  # system time
  local timestamp=$(date +"%H:%M")
  local theday=$(date +"%a %e`daySuffix`")
  local themonth=$(date +"%b")
  local theyear=$(date +"%Y")

  # grab git status
  read isGit isBranch isStatus <<< $(isInGit 2> /dev/null)
  # if is git repo
  if [[ $isGit ]]; then
    # set branch name and cute apple
    BRANCH="$isBranch"
    STATUS="  "
    # if clean repo
    if [[ $isStatus == "" ]]; then
      # green apple
      CLR=$GREEN
    # if dirty repo
    else
      # red apple
      CLR=$RED
    fi
  # if not git repo
  else
    # make branch and status empty
    BRANCH=""
    STATUS=""
  fi

  # strip whitespace from wc output,
  # and append context string
  local DIRITEMS="${files//[[:space:]]/} items in ${PWD##*/}"

  local UPTIME="Up for ${uptime}hrs"
  local DATETIME="${timestamp}hrs on $theday $themonth $theyear"

  local THEUSER="\u: "
  local PROMPT=" » "


# BASH prompt customisation
PS1="\
\[$MAGENTA\]$THEUSER\
\[$DIM$WHITE\]$BRANCH\
\[$RESET$CLR\]$STATUS\
\[$BLUE\]$DIRITEMS\
$BREAK\
\[$BOLD$WHITE\][\
\[$BLACK\]$timestamp\
\[$WHITE\]]\
\[$RESET$YELLOW\]$PROMPT\
\[$RESET\]\
"
}

# make BASH awesome
PROMPT_COMMAND=awesomeify
