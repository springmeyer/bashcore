#!/bin/bash

# http://tldp.org/LDP/abs/html/internalvariables.html

# load modules
source object.sh
source modules/assert.sh

function go {
    # works, returns 3*2
    THIS=$(object 3)
    # assert should pass
    assert $THIS 6 $LINENO $FUNCNAME

    # should throw
    THIS=$(object 4.5)
    
    # should assert
    assert $THIS 5 $LINENO $FUNCNAME
}

go