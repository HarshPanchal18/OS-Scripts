#!/bin/bash

var='0123456789abcdef'

#defien a zero-based offset
printf '%s\n' "${var:3}" #3456789abcdef

#offset and length of substring
printf '%s\n' "${var:3:4}" # 3456

#negative length counts from the end of the string
printf '%s\n' "${var:3:-5}" # 3456789a

#negative offset counts from the end
#needs a space to avoid confusion with ${var:-6}
printf '%s\n' "${var: -6}"  # abcdef
printf '%s\n' "${var:(-6)}" # abcdef

#negative offset and negative length
printf '%s\n' "${var: -6:-5}" # a

# if the para. is a positional parameter or the element of s subscripted array:
# set positional parameter $1
set -- 0123456789abcdef

#define offset
printf '%s\n' ${1:5} # 56789abcdef

myArr[0]='0123456789abcdef'
printf '%s\n' ${myArr[0]:7:3} # 789

# Analogous expansions to positional parameters where offsets are one-based

#set positional para, $1, $2, $3, ...
set -- 1 2 3 4 5 6 7 8 9 0 a b c d e f

#define an offset (beware $0 (not a positional para. is being considered as well)
printf '%s\n' ${@:10} # 0abcdef

#define offset and length
printf '%s\n' ${@:10:3} # 0ab

#no negative lengths allowed for positional para.
printf '%s\n' ${@:10:-2} # substring expression < 0

#negative offset counts from the end
#needs a space to avoid confusion with
printf '%s' ${@: -10:2} # 78
