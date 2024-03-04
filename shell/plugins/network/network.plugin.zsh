#!/usr/bin/env bash

# Wait for 1C to finish
iface_ip() {
    ip -o -4 addr show dev $1 | cut -d' ' -f7 | cut -d'/' -f1
}

external_ip() {
    dig +short myip.opendns.com @resolver1.opendns.com
}
