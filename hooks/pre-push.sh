#!/usr/bin/env bash
#bin/console files:committed

BIN=phpunit;
MIN_COVERAGE=0

# The reading options part
while [[ $# -gt 0 ]] && [[ ."$1" = .* ]] ;
do
    opt="$1";
    shift;              #expose next argument
    case "$opt" in
        "--bin="* )
           BIN="${opt#*=}";;
        "--enabled="* )
           continue;;
        "--min-coverage="* )
           MIN_COVERAGE="${opt#*=}";;
        #*) echo >&2 "Invalid option: $@"; exit 1;;
   esac
done

COMMAND="$BIN"

# If need to verify coverage
if [ "$MIN_COVERAGE" -gt "0" ]; then
    COMMAND="$COMMAND --coverage-text=.coverage"
fi

if eval "${COMMAND}"; then
    echo ''
else
    if [ "$MIN_COVERAGE" -gt "0" ]; then
        rm .coverage
    fi
    exit 1
fi

# Verifying if coverage has succeed
if [ "$MIN_COVERAGE" -gt "0" ]; then
    result=$(head -n9 .coverage | tail -n 1 )
    result=$(echo "$result" | cut -d '.' -f 1)
    result="${result:8:${#result}}"
    rm .coverage

    if [ "$result" -lt "$MIN_COVERAGE" ]; then
        printf '\033[41m\033[37m Coverage is %s%% (%s%% required) \033[0m' "$result" "$MIN_COVERAGE"
        exit 1
    fi
fi

exit 0
