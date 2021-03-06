#!/usr/bin/env bash

source $HOME/.bazelenv

_wix_completion() {
    COMPREPLY=( $( env COMP_WORDS="${COMP_WORDS[*]}" \
               COMP_CWORD=$COMP_CWORD \
               _WIX_COMPLETE=complete $1 ) )
    return 0
}

complete -F _wix_completion -o default wix;
