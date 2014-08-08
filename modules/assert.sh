#!/bin/bash

source $(dirname "$BASH_SOURCE")/exception.sh

trap 'stop_script $ERROR_LINE $ERROR_LOC $MSG; exit' SIGINT

function stop_script {
  echo "Assert: \"$3\" at line '$1' of '$2' in script $(basename $0)"
}

function assert {
    if [ -z "$1" ] || [ -z "$2" ] || [ -z "$3" ]; then
      echo 'assert expects four args: two values to compare, LINENO, and FUNCNAME'
      return
    fi
    local RESULT=$(test "$1" == "$2")$?
    if [[ $RESULT != 0 ]]; then
        #echo $PPID
        export ERROR_LINE=$3
        export ERROR_LOC=$4
        export MSG="$1""!=""$2"
        kill -s SIGINT $$
    fi
}

export -f assert
