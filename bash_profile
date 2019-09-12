#!/bin/bash

# Load .bashrc and other files...
for file in ~/.bash{_prompt,_aliases,_autocomplete,_options,_functions,_exports,_path,_logout,.local}; do
    if [[ -r "$file" ]] && [[ -f "$file" ]]; then
        # shellcheck source=/dev/null
        source "$file"
    fi
done
unset file
