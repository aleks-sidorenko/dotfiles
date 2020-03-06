#!/usr/bin/env bash


# Project root directory
export PROJECT_ROOT="${HOME}/Projects"
export PROJECT_CURRENT="${PROJECT_ROOT}/Current"


# Set current working project context
project() {
    if [[ -z "${1}" ]]; then
        if [[ -z "${PROJECT_NAME}" ]]; then
            echo "Usage: project PROJECT_NAME"
            return 1
        else
            echo "Current project is: [$PROJECT_NAME]"
            return 0
        fi
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

    for f in ./.bash/*; do
        source $f
    done
}

_project() {
    local projects=("$PROJECT_CURRENT/$2"*)
    [[ -e ${projects[0]} ]] && COMPREPLY=( "${projects[@]##*/}" )
}

complete -F _project project