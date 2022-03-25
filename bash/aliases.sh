#!/usr/bin/env bash

# Update
alias update_all="sudo apt update && sudo apt -y upgrade && sudo apt dist-upgrade && sudo apt -y autoremove && snap refresh"


# git
alias git_br_delete="git branch | grep -v "master" | xargs git branch -D"

# list open ports
alias list_ports="sudo lsof -i -P -n | grep LISTEN"