#!/bin/bash

# Load .bashrc and other files...
for file in ~/.bash_{prompt,aliases,autocomplete,options,functions,exports,path,logout}; do
    if [[ -r "$file" ]] && [[ -f "$file" ]]; then
        # shellcheck source=/dev/null
        source "$file"
    fi
done
unset file
