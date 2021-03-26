#!/usr/bin/env bash

#
# https://www.haskell.org/ghcup/
#

# Haskell
export GHCUP_HOME="${HOME}/.ghcup"

# Haskell path
[ -f "${GHCUP_HOME}/env" ] && source "${GHCUP_HOME}/env" # ghcup-env


cabal-watch() {
    find -name "*.hs" | entr -r cabal run
}

