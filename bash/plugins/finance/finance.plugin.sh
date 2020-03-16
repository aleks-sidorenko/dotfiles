#!/usr/bin/env bash

_1C_HOME=/opt/1C/v8.3/x86_64
_1C_PROC_NAME=1cv8c
vm=MultiKey

# Wait for 1C to finish
wait_1c() {
    while true; do
        sleep 10
        if [[ -z "$(pidof $_1C_PROC_NAME)" ]]; then
            echo "1C is not running, exiting"
            break
        fi
    done
}


# Start 1C
start_1c() {
    vboxmanage startvm $vm --type headless
    $_1C_HOME/1cestart
    wait_1c
    vboxmanage controlvm $vm savestate
}