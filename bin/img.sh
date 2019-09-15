#!/bin/bash

FORMAT=%Y%m%d_%H%M%S%%-c.%%e

extensions=("jpg" "mp4" "mov")

print_error() {
    printf " [✖] %s\n" "$1"
}

img_canonicalize() {
    src=$1
    dir=$(pwd)
    cd $src
    echo "Canonicalizing images from $src"

    for ext in "${extensions[@]}"
    do
        EXT=$(echo $ext | awk '{print toupper($0)}')
        echo "Processing *.$EXT and *.$ext..."
        rename 's/'\.$EXT'$/'.$ext'/' *.$EXT

        exiftool -ext $ext '-createdate<filemodifydate' -overwrite_original -if '(not $createdate or ($createdate eq "0000:00:00 00:00:00"))' .
        exiftool -ext $ext '-filename<createdate' -overwrite_original -d $FORMAT *.$ext
    done
    cd $dir

    echo "Canonicalized images from $src"
}

img_fixdate() {
    src=$1
    dir=$(pwd)
    echo "Fixing date of images from $src"

    cd $src
    for ext in "${extensions[@]}"
    do   
        echo "Fixing *.$ext..."
        exiftool -ext $ext '-createdate<filename' -overwrite_original -if '(not $createdate)' -d $FORMAT *.$ext
    done
    cd $dir

    echo "Fixed date of images from $src"
}

img_import() {
    src=$1
    dest=$2
    dir=$(pwd)
    tmp=$(mktemp -d)

    echo "Importing images from $src to $dst"

    cd $src
    exiftool -o $tmp -progress -if '$filesize# > 30000' '-Directory<CreateDate' -d $dest/All/%Y/%m -r .
    rm -rf $tmp
    cd $dir

    echo "Imported images from $src to $dst"
}


device_folders=("/storage/$MOBILE_SDCARD_ID/DCIM/Camera" "/sdcard/DCIM/Camera" "/sdcard/DCIM/Video\ Editor")

img_dev_pull() {

    if [ -z "$MOBILE_SDCARD_ID" ]; then
        print_error "Please provide a mobile sdcard id (MOBILE_SDCARD_ID)"
        exit 1
    fi

    tmp=$(mktemp -d)

    echo "Pulling images from device folders to $tmp"

    for dev in "${device_folders[@]}"
    do
        echo "Pulling images from device folder $dev to $tmp"
        adb pull "$dev" $tmp
        echo "Pulled images from device folder $dev to $tmp"
    done
    
    echo "Pulled images from device folders to $tmp"

    

}

img_dev_cleanup() {

    if [ -z "$MOBILE_SDCARD_ID" ]; then
        print_error "Please provide a mobile sdcard id (MOBILE_SDCARD_ID)"
        exit 1
    fi

    echo "Cleaning images from device folders"

    for dev in "${device_folders[@]}"
    do
        echo "Cleaning images from device folder $dev"
        adb shell rm "$dev/*"
        echo "Cleaned images from device folder $dev"
    done    

    echo "Cleaned images from device folders"

}