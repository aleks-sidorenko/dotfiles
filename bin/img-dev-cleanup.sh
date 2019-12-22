#!/bin/bash

DIR=$(dirname "${BASH_SOURCE[0]}")
. "$DIR/img.sh"

main() {
    # device_folders=("/storage/$MOBILE_SDCARD_ID/DCIM/Camera" "/sdcard/DCIM/Camera" "/sdcard/DCIM/Video\ Editor")
    device_folders=("/storage/self/primary/youcut" "/storage/self/primary/DCIM/Camera" "/storage/self/primary/DCIM/Google Photos")
    img_dev_cleanup $device_folders
}

main
