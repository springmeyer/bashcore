#!/bin/bash

source modules/exception.sh

function object {
    if [ -z "$1" ]; then
      throw 'object expects one argument' $LINENO $FUNCNAME
    fi
    let RETURN_VAL=2*$1;
    RETURN_CODE=$?;
    if [[ $RETURN_CODE != 0 ]]; then
        throw 'expression failed' $LINENO $FUNCNAME
    fi
    echo $RETURN_VAL
}

export -f object
