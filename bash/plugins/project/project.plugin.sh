#!/usr/bin/env bash


# Project root directory
export PROJECT_ROOT="${HOME}/Projects"
export PROJECT_CURRENT="${PROJECT_ROOT}/Current"
export PROJECT_NAME_FILE="${PROJECT_CURRENT}/.project"


project-root() {
    cd $PROJECT_HOME
}

project-unset() {
    _clear_project_name
    export PROJECT_NAME=
    export PROJECT_HOME=
}

_set_project_name() {
    rm -f $PROJECT_NAME_FILE
    echo "$1" > $PROJECT_NAME_FILE
}

_clear_project_name() {
    _set_project_name ""
}

# Set current working project context
project() {
    
    export PROJECT_NAME=
    export PROJECT_HOME=

    # if no arguments
    if [[ -z "${1}" ]]; then
        if [ -f $PROJECT_NAME_FILE ]; then
            # read it from file
            PROJECT_NAME=$(<$PROJECT_NAME_FILE)
            if [[ -z "${PROJECT_NAME}" ]]; then
                return 0
            fi
        else
            _clear_project_name
        fi
    else
        PROJECT_NAME=$1
        _set_project_name "$PROJECT_NAME"
    fi

    if [[ ! -z "${PROJECT_NAME}" ]]; then
        PROJECT_HOME=$PROJECT_CURRENT/$PROJECT_NAME
    fi
    
    if [[ ! -d "$PROJECT_HOME" ]]
    then
        echo "Project $PROJECT_NAME does not exist in $PROJECT_CURRENT"
        return 1
    fi

    for f in $PROJECT_HOME/.bash/*; do
        source $f
    done
}

project


_project() {
    local projects=("$PROJECT_CURRENT/$2"*)
    [[ -e ${projects[0]} ]] && COMPREPLY=( "${projects[@]##*/}" )
}

complete -F _project project

