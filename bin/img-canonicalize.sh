#!/bin/bash

DIR=$(dirname "${BASH_SOURCE[0]}")
. "$DIR/img.sh"


main
main() {
    src=$1
    img_canonicalize $src
}

src=${1:-.}
main $src
