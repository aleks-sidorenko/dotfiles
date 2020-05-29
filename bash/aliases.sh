#!/usr/bin/env bash

# Update
alias update-all="sudo apt update && sudo apt -y upgrade && sudo apt dist-upgrade && sudo apt -y autoremove && snap refresh"


# git
alias git-br-delete="git branch | grep -v "master" | xargs git branch -D"
