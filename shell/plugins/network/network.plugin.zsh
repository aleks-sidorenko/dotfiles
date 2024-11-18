#!/usr/bin/env bash

# Wait for 1C to finish
iface_ip() {
    ip -o -4 addr show dev $1 | cut -d' ' -f7 | cut -d'/' -f1
}

external_ip() {
    dig +short myip.opendns.com @resolver1.opendns.com
}


ROUTER=router

ROUTER_FIREWALL_RULE_DROP_TV=14
function tv_inet_on() {
    ssh $ROUTER /ip firewall filter disable $ROUTER_FIREWALL_RULE_DROP_TV
}

function tv_inet_off() {
    ssh $ROUTER /ip firewall filter enable $ROUTER_FIREWALL_RULE_DROP_TV
}







