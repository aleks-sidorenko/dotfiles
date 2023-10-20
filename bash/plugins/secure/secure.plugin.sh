#!/usr/bin/env bash
 
export SECURE_ROOT=$HOME/.secure
export SECURE_PARTITION=/dev/sdc2


secure_mount() {
   sudo veracrypt --text --mount $SECURE_PARTITION $SECURE_ROOT
}

secure_unmount() {
  sudo veracrypt --text --dismount --slot 1
}

