#!/bin/bash

#UPPER...

v="hello"

printf '%s\n' "${v^}" # make first characeter UPPER

# ',' for lower
# '~' for toggle

printf '%s\n' "${v^^}" # make whole string to UPPER

#ALTERNATIVE

v="hello world"

declare -u string=$v # -l for lower

echo $string


set -- 1 2 3 4
echo ${#@}
echo $#

a="i am a string"

echo ${a/a/A} # replace on first match

echo ${a//a/A} # replace to the whole

echo ${a/#i/N} # replace the first

echo ${a/%g/N} # replace the last element

echo ${a/%g/} # replace woth nothing

a=(hello world)

echo ${a[@]/#/R} # add prefix (here 'R') to the element

#delete a pattern from the beginning of a string

#shortest match
a='I am a string'
echo ${a#*a} # m a string
#longest match
echo ${a##*a} # string (as it deletes till last match)

# '#' deletes from the beginning
# '%' deletes from the end (Reverse Order)
var="Apple Orange"
echo ${var%% *} # Apple
echo ${var%%*} # <blank>
echo ${var%% * } # Apple Orange
echo ${var##* } # Orange (Last element)
echo ${var## *} # Apple Orange
echo ${var## * } # Apple Orange

var="Apple Grape Orange"
echo "${var% *}" #Apple Grape
echo "${var#* }" #Grape Orange

#parameter indirection

red="Red"
green="Green"

color=red
echo "${!color}"

color=green
echo "${!color}"

foo=10
x=foo

echo $x # foo

echo ${!x} #10, indirect expansion

#one more exmpale
argtester() { for (( i=1; i<="$#"; i++ )); do echo "$i"; done;  };
argtester -ab -cd -ef # 1 2 3

argtester() { for (( i=1; i<="$#"; i++ )); do echo "${!i}"; done;  };

argtester -ab -cd -ef # print args...

unset var
echo ${var:-XX}

var=""
echo ${var:-XX}

var=23
echo ${var:-XX}

${para:=word}

# if para is unset or null, the expansion of word is assigned to para.. The value of para.is then substituted. Positional paras and special para may not be assigned to in this way.

echo

unset var
echo ${var:=XX}
echo $var

var=""
echo ${var:=XX}
echo $var

var=23
echo ${var:=XX}
echo $var


#delete a pattern from the end of a string

a='I am a string'
echo ${a%a*} # I am
echo ${a%%a*} # I

#munging during expansion
# Variables don't necessarily have to expand to their values - substrings can be extracted during expansion, which
#can be useful for extracting file extensions or parts of paths. Globbing characters keep their usual meanings, so .*
#refers to a literal dot, followed by any sequence of characters; it's not a regular expression.

v=foo-bar-baz
echo ${v%%-*} # foo

echo ${v%-*} # foo-bar

echo ${v##*-} # baz

echo ${v#*-} # bar-baz

#EDITOR=nano
${EDITOR:-vim} /tmp/f # opens nano

#unset EDITOR
${EDITOR:-vim} /tmp/f # opens vim
