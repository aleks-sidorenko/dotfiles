#!/usr/bin/env bash


# Project root directory
export PROJECT_ROOT="${HOME}/Projects"
export PROJECT_CURRENT="${PROJECT_ROOT}/Current"


# Set current working project context
project() {
    if [ -z "${1}" ]; then
        echo "Usage: \`project NAME\`"
        return 1
    fi
    
    export PROJECT_NAME=$1
    export PROJECT_HOME=$PROJECT_CURRENT/$PROJECT_NAME

    if [[ ! -d "$PROJECT_HOME" ]]
    then
        echo "Project $PROJECT_NAME does not exist in $PROJECT_CURRENT"
        return 1
    fi

    echo "Setting current project to [$PROJECT_NAME]"
    
    cd $PROJECT_HOME
    context=./context
    if [[ -r "$context" ]] && [[ -f "$context" ]]; then
        source "$context"
    fi
}

_project() {
    local projects=("$PROJECT_CURRENT/$2"*)
    [[ -e ${projects[0]} ]] && COMPREPLY=( "${projects[@]##*/}" )
}

complete -F _project project