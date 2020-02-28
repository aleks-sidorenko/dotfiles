#!/usr/bin/env bash

_1C_HOME=/opt/1C/v8.3/x86_64
vm=MultiKey

# Start 1C
start_1c() {
    vboxmanage startvm $vm --type headless
    $_1C_HOME/1cestart
    sleep 30
    vboxmanage controlvm $vm savestate
}