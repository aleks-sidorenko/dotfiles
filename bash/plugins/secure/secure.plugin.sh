#!/usr/bin/env bash
 
export SECURE_ROOT=$HOME/.secure
export SECURE_PARTITION=/dev/sdc2

SLOT=1


secure_mount() {
   sudo veracrypt --text --mount $SECURE_PARTITION $SECURE_ROOT --pim 0  --keyfiles "" --slot $SLOT --protect-hidden no --verbose
}

secure_unmount() {
  sudo veracrypt --text --dismount --slot $SLOT
}

