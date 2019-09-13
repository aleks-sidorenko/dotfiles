#!/bin/bash

DIR=$(dirname "${BASH_SOURCE[0]}")
. "$DIR/img.sh"


main() {
    src=$1
    img_fixdate $src
}

src=${1:-.}
main $src
