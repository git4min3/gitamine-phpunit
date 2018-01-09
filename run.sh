#!/usr/bin/env bash

PARAMS="$*";
EVENT=""
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# The reading options part
while [[ $# -gt 0 ]] && [[ ."$1" = .* ]] ;
do
    opt="$1";
    shift;              #expose next argument
    case "$opt" in
        "--event="* )
           EVENT="${opt#*=}";;
   esac
done

if [ -e "${DIR}/hooks/${EVENT}.sh" ]
then
    eval "${DIR}/hooks/${EVENT}.sh ${PARAMS}"
else
    echo "This plugin only works on [pre-commit, pre-push] hooks"
    exit 1
fi
