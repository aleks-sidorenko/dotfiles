#!/usr/bin/env bash

# TODO - support iPhone
# TODO - treat Android as mount device (no adb)


FORMAT=%Y%m%d_%H%M%S%%-c.%%e

extensions=("jpg" "mp4" "mov" "heic")

export PHONE_HOME=/media/phone
export PHOTO_HOME=$HOME/Pictures/Photo

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
    dst=$2
    dir=$(pwd)
    tmp=$(mktemp -d)

    echo "Importing images from $src to $dst"

    cd "$src"
    exiftool -o $tmp -progress -if '$filesize# > 30000' '-Directory<CreateDate' -d "$dst/All/%Y/%m" -r .
    rm -rf $tmp
    cd "$dir"

    echo "Imported images from $src to $dst"
}

img_resize() {
    src=$1
    find . -maxdepth 1 -iname "*.jpg" | xargs -L1 -I{} convert -resize 50% $src/"{}" $src/"{}"
}


img_rsync_for_dates() {
    from=$1
    to=$2
    src=$3
    dst=$4
    find $src -maxdepth 2 -type f -newermt $from -not -newermt $to -print | rsync -avh --timeout=60 --files-from=- . $dst
}

img_clean_for_dates() {
    from=$1
    to=$2
    src=$3
    find $src -maxdepth 2 -type f -newermt $from -not -newermt $to -exec rm {} \;
}


# ----- Android -----
android_mount() {
    systemctl --user stop gvfs* # stop all services with gvfs
    sudo go-mtpfs -allow-other -usb-timeout=100000 $PHONE_HOME
}

android_unmount() {    
    sudo umount -l $PHONE_HOME
}


ANDROID_PHOTO_HOME="$PHONE_HOME/Internal shared storage/DCIM/Camera"

android_img_import() {
    dst=$PHOTO_HOME
    src=$ANDROID_PHOTO_HOME
    img_import "$src" "$dst"
}

android_img_clean() {
    rm $ANDROID_PHOTO_HOME/*.*
}


# ----- iPhone -----
# https://www.maketecheasier.com/easily-mount-your-iphone-as-an-external-drive-in-ubuntu

iphone_mount() {
    idevicepair pair
    ifuse $PHONE_HOME
}

iphone_unmount() {
    fusermount -u $PHONE_HOME
}

IPHONE_PHOTO_HOME="$PHONE_HOME/DCIM"

iphone_img_import() {
    dst=$PHOTO_HOME
    src=$IPHONE_PHOTO_HOME
    img_import "$src" "$dst"
}

iphone_img_clean() {
    rm $IPHONE_PHOTO_HOME/*.*
}
