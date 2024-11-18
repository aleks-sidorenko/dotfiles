#!/usr/bin/env bash

# list open ports
alias list_ports="sudo lsof -i -P -n | grep LISTEN"

# clear syslog file
alias syslog_clear="sudo sh -c 'echo > /var/log/syslog'"

alias tar_unpack="tar -xvzf"
alias tar_pack="tar -cvzf"

