#!/bin/bash

getgitbranch() {
    git branch 2> /dev/null | grep "^\*" | cut -c3-
}

isgitclean() {
    test "" = "$(git status -s 2> /dev/null)"
    return $?
}

ROOT_UID=0

prompt_command() {
    END='\[\e[0m\]'
    RED='\[\e[31;1m\]'
    YELLOW='\[\e[33;1m\]'
    USER_COLOR='\[\e[0;32m\]'
    HISTORY_COLOR='\[\e[0;33m\]'
    DIR_COLOR='\[\e[0;32m\]'
    GIT_COLOR='\[\e[25;1m\]'
    PROMPT_COLOR='\[\e[1;34m\]'
    PC_COLOR='\[\e[31;1m\]'
    PROMPT=$?

    if ! isgitclean; then
        GIT_COLOR="\[\e[0;36m\]($(getgitbranch))"
    fi
    if [ ${UID} -eq ${ROOT_UID} ]; then
	    USER_COLOR='\[\e[1;31m\]'
        PROMPT_COLOR='\[\e[1;31m\]'
        PROMPT='#'
    fi
    if [[ $PROMPT -eq 0 ]]; then
        PROMPT="${YELLOW}\$"
    else
        PROMPT="${RED}\$"
    fi

    export PS1="[${USER_COLOR}\u${END}@${PC_COLOR}\h${END}] \t ${HISTORY_COLOR}\! ${DIR_COLOR}\w\n${GIT_COLOR}${PROMPT_COLOR}${PROMPT}${END} "
}
export PROMPT_COMMAND=prompt_command

# pro milovníky pythonního interpreteru
PS2="..."

