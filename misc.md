`echo {a..z}` # a b c d e f g h i j k l m n o p q r s t u v w x y z

`echo {z..a}` # z y x w v u t s r q p o n m l k j i h g f e d c b a

`echo {001..10}` # 001 002 003 004 005 006 007 008 009 010

`echo {10..001}` # 010 009 008 007 006 005 004 003 002 001

`echo {0..10..2}` # 0 2 4 6 8 10

`for c in {a..z..2}; do echo -n $c; done` # acegikmoqsuwy

`echo {a..d}{1..3}` # a1 a2 a3 b1 b2 b3 c1 c2 c3 d1 d2 d3


#### - To make multiple directories with sub-dir
`mkdir -p toplevel/sublevel_{01..02}/{child1,child2,child3}`

#### - Turn on/off debugging within a bash script.
- It may optionally be turned back on, though debug output is automatically reset when the script exits.

`set -x` # Enable a mode of the shell where all executed commands are printed to the terminal.

`set +x` # Disable a mode of the shell where all executed commands are printed to the terminal.

`echo **`
#### - The ** can be thought of a path expansion, no matter how deep the path is. This example matches any file or folder that starts with deep , regardless of how deep it is nested:

`echo **/deep*`
> Output:
>> folder/anotherfolder/content/deepfolder folder/subfolder/content/deepfolder

#### - The ? simply matches exactly one character

`echo ?acy`
#macy

`echo ??acy`
#stacy tracy

#### - If there is a need to match specific characters then '[ ]' can be used. Any character inside '[ ]' will be matched exactly once.

`echo [m]acy`
#macy

`echo [st][tr]acy`
#stacy tracy

#### - The [] glob, however, is more versatile than just that. It also allows for a negative match and even matching ranges of characters and character classes. A negative match is achieved by using ! or ^ as the first character following [ .

#### - We can match stacy by
`echo [!t][^r]acy`
#stacy

#### - Here we are telling bash the we want to match only files which do not not start with a t and the second letter is not an r and the file ends in acy .

#### - Ranges can be matched by seperating a pair of characters with a hyphen ( - ). Any character that falls between those two enclosing characters - inclusive - will be matched. E.g., [r-t] is equivalent to [rst]
`echo [r-t][r-t]acy`
#stacy tracy

#### - Character classes can be matched by [:class:] , e.g., in order to match files that contain a whitespace

`echo *[[:blank:]]*`
#file with space

#### - There are a few ways to determine the current shell
`echo $0
ps -p $$
echo $SHELL`

#### - To list available login shells :

`cat /etc/shells` # run from the HOME directory

```console
/etc/shells: valid login shells
/bin/sh
/bin/dash
/bin/bash
/bin/rbash
```

#### - To change the current bash
```
export SHELL=/bin/bash
exec /bin/bash
```

#### - To change the bash that opens on startup edit .profile and add those lines

#### - To get the number of command line arguments or positional parameters
`echo "$#"`

#### - When run with three arguments the example above will result with the output:
`$ ./testscript.sh firstarg secondarg thirdarg` #3

#### - The maximum number of remembered commands:
`/$ echo $HISTSIZE`
#1000

#### - To get the name of the current function:
`my_function()
{
    echo "This function is $FUNCNAME"
}`

_"This function is my_function"_

#### - This instruction will return nothing if you type it outside the function:
`my_function`
`echo "This function is $FUNCNAME"`
_"This function is"_

#### - Contains the Internal Field Separator string that bash uses to split strings when looping etc.
#### - The default is the white space characters: `\n (newline)`, `\t (tab)` and `space`.
#### - Changing this to something else allows you to split strings using different characters:
```
IFS=","
INPUTSTR="a,b,c,d"

for field in ${INPUTSTR}
do
    echo $field
done
```

```
a
b
c
d
```
#### - This is responsible for the phenomenon known as word splitting.

#### - OLDPWD (OLDPrintWorkingDirectory) contains directory before the last cd command:

```
cd directory
directory> $ echo $OLDPWD
/home/user
```

#### - PWD (PrintWorkingDirectory) The current working directory you are in at the moment:

```
echo $PWD
/home/user
~> $ cd directory
directory> $ echo $PWD
/home/user/directory
```
