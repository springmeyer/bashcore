#!/bin/bash

function error() { echo "$@" 1>&2; }

export -f error

function throw {
    if [ -z "$1" ] || [ -z "$2" ] || [ -z "$3" ]; then
      echo 'throw expects three args: msg, LINENO, and FUNCNAME'
      return
    fi
    error "Exception: '$1' at line '$2' of '$3' function in $(basename $0)"
    kill $$
}

export -f throw
