#!/bin/bash

DIR=$(dirname "${BASH_SOURCE[0]}")
. "$DIR/img.sh"

main() {
    img_dev_pull
}

main
