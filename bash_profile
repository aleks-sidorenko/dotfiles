#!/bin/bash

# Load .bashrc and other files...
for file in ~/{.bash_exports,.bash_path,.bash_prompt,.bash_aliases,.bash_autocomplete,.bash_options,.bash_functions,.bash_logout,.bazelenv}; do
    if [[ -r "$file" ]] && [[ -f "$file" ]]; then
        # shellcheck source=/dev/null
        source "$file"
    fi
done
unset file
