#!/bin/bash

DIR=$(dirname "${BASH_SOURCE[0]}")
. "$DIR/img.sh"

main() {
    src=$1
    dest=$2
    img_import $src $dest
}

src=${1:-.}
dest=${2:-~/Pictures/Photo/All}
main $src $dest
