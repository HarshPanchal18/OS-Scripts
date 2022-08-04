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

a="set"
b=""
unset c

echo ${a:-default_a} ${b:-default_b} ${c:-default_c} # set default_b default_c

echo ${a-default_a} ${b-default_b} ${c-default_c} # set default_c

echo ${a:+default_a} ${b:+default_b} # default_a



# error if variable is empty or unset

FOO=
#echo "FOO is ${FOO:?EMPTY}" # FOO: EMPTY
#echo "FOO is ${FOO:?UNSET}" # FOO: UNSET (If you remove ':', it only prints "FOO is"

#echo "bar is ${bar:?EMPTY}" # bar is EMPTY
#echo "bar is ${bar?UNSET}" # bar is UNSET

# Comparison and Matching

s='abc'
p1='a*'
p2='*c'
# be aware of wildcard characters
if [[ "$s" == $p1 ]]; then
    echo "$s matches the pattern"
fi
if [[ "$s" == $p2 ]]; then
    echo "$s doesn't match"
fi

if [[ -n "$s" ]]; then
    echo "$s is non-empty"
fi
if [[ -z "${s// }" ]]; then
    echo "$s is empty or contains only spaces"
fi
if [[ -z "$s" ]]; then
    echo "$s is empty"
fi

param="foo,bar,bash"
IFS=',' read -r -a array <<< "$param"

echo $param

for ele in "${array[@]}"
do
    echo "$ele"
done


for index in "${!array[@]}"
do
    echo $index ${array[index]}
done

#Get captured groups from a regex match against a string
a='I am a simple string with digits 1234'
pat='(.*) ([0-9]+)'
[[ $a =~ $pat ]]

echo "${BASH_REMATCH[0]}"
echo "${BASH_REMATCH[1]}"
echo "${BASH_REMATCH[2]}"

<<output
I am a 548 simple string with digits 1234
I am a 548 simple string with digits
1234
output


#Check if a string matches a regular expression
date=20150624
[[ $date =~ ^[0-9]{8}$ ]] && echo "yes" || echo "no" #yes

date=hellorte
[[ $date =~ ^[a-z]{8}$ ]] && echo "yes" || echo "no" #yes
