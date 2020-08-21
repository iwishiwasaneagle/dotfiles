#!/bin/sh

USAGE="USAGE: log_cleaner.sh [FILE1] [FILE2] ..."

if [ -z "$1" ]; then
    echo "Please input a file, or files"
    echo "$USAGE"
else
    for arg in "$@"
    do
        echo "$arg"
        sed -i "s/jhewers/user/ig" $arg
        sed -i "s/gibson/uni/ig" $arg
    done
fi
exit 0
