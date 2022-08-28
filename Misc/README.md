`echo {a..z}` # a b c d e f g h i j k l m n o p q r s t u v w x y z

`echo {z..a}` # z y x w v u t s r q p o n m l k j i h g f e d c b a

`echo {001..10}` # 001 002 003 004 005 006 007 008 009 010

`echo {10..001}` # 010 009 008 007 006 005 004 003 002 001

`echo {0..10..2}` # 0 2 4 6 8 10

`for c in {a..z..2}; do echo -n $c; done` # acegikmoqsuwy

`echo {a..d}{1..3}` # a1 a2 a3 b1 b2 b3 c1 c2 c3 d1 d2 d3

----
#### - To make multiple directories with sub-dir
`mkdir -p toplevel/sublevel_{01..02}/{child1,child2,child3}`

#### - Turn on/off debugging within a bash script.
- It may optionally be turned back on, though debug output is automatically reset when the script exits.

`set -x` -  *Enable a mode of the shell where all executed commands are printed to the terminal.*

`set +x` - *Disable a mode of the shell where all executed commands are printed to the terminal.*

`echo **` - *The ** can be thought of a path expansion, no matter how deep the path is.* 

This example matches any file or folder that starts with deep , regardless of how deep it is nested:
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
`echo [r-t][r-t]acy` - *stacy tracy*

#### - Character classes can be matched by [:class:] , e.g., in order to match files that contain a whitespace

`echo *[[:blank:]]*` - *file with space*
----
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
```console
export SHELL=/bin/bash
exec /bin/bash
```

#### - To change the bash that opens on startup edit .profile and add those lines

`echo "$#"` - *To get the number of command line arguments or positional parameters*

#### - When run with three arguments the example above will result with the output:
`$ ./testscript.sh firstarg secondarg thirdarg` - *3*

#### - The maximum number of remembered commands:
`/$ echo $HISTSIZE` - *1000*

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
```bash
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

```console
cd directory
directory> $ echo $OLDPWD
/home/user
```

#### - PWD (PrintWorkingDirectory) The current working directory you are in at the moment:

```console
echo $PWD
/home/user
~> $ cd directory
directory> $ echo $PWD
/home/user/directory
```

#### - Positional parameters passed to the script from either the command line or a function:
$n is the n'th positional parameter
```console
echo "$1"
echo "$2"
echo "$3"
```

`./testscript.sh firstarg secondarg thirdarg`
```console
firstarg
secondarg
thirdarg
```

#### - If number of positional argument is greater than nine, curly braces must be used.

#### *"set -- "* sets positional parameters
`set -- 1 2 3 4 5 6 7 8 nine ten eleven twelve`
#### the following line will output 10 not 1 as the value of $1 the digit 1 will be concatenated with the following 0
`echo $10` outputs 1

`echo ${10}` outputs ten

to show this clearly:
```console
set -- arg{1..12}
echo $10
echo ${10}
```

#### - Will return all of the positional parameters in a single string.
_testscript.sh:_

`echo "$*"`

Run the script with several arguments:
```console
./testscript.sh firstarg secondarg thirdarg
```

- Output:
`firstarg secondarg thirdarg`

----
#### - The Process ID (pid) of the last job run in the background:
```console
ls &
testfile1 testfile2
[1]+ Done          ls
~> $ echo $!
21715
```
#### - _The exit status of the last executed function or command. Usually 0 will mean OK anything else will indicate a failure:_

```console
ls *.blah;echo $?

ls: cannot access *.blah: No such file or directory
2
ls;echo $?
testfile1 testfile2
0
```

#### - The Process ID (pid) of the current process:
```bash
echo $$
13246
```

#### - Each time this parameter is referenced, a random integer between 0 and 32767 is generated.
#### - Assigning a value to this variable seeds the random number generator (source).

```console
echo $RANDOM
27119
echo $RANDOM
1349
```

`$BASHPID` 
#### - Process ID (pid) of the current instance of Bash. This is not the same as the $$ variable, but it often gives the same result. This is new in Bash 4 and doesn't work in Bash 3.

```console
echo "\$\$ pid = $$ BASHPID = $BASHPID"
$$ pid = 9265 BASHPID = 9265
```
----
`$BASH_ENV` 
#### - An environment variable pointing to the Bash startup file which is read when a script is invoked.

`$BASH_VERSINFO`
#### - An array containing the full version information split into elements, much more convenient than $BASH_VERSION if you're just looking for the major version:
```bash
for ((i=0; i<=5; i++)); do echo "BASH_VERSINFO[$i] = ${BASH_VERSINFO[$i]}"; done

BASH_VERSINFO[0] = 3
BASH_VERSINFO[1] = 2
BASH_VERSINFO[2] = 25
BASH_VERSINFO[3] = 1
BASH_VERSINFO[4] = release
BASH_VERSINFO[5] = x86_64-redhat-linux-gnu
```

`$BASH_VERSION` - Shows the version of bash that is running, this allows you to decide whether you can use any advanced features:

`echo $BASH_VERSION` -> *4.1.2(1)-release*

`$EDITOR` - The default editor that will be involked by any scripts or programs, usually vi or emacs.
`echo $EDITOR`
----
`$HOSTNAME` - The hostname assigned to the system during startup.
`echo $HOSTNAME` - *kali*

`$HOSTTYPE` - This variable identifies the hardware, it can be useful in determining which binaries to execute:
`echo $HOSTTYPE` - *x86_64*

`$MACHTYPE` - Similar to $HOSTTYPE above, this also includes information about the OS as well as hardware
`echo $MACHTYPE` - *x86_64-pc-kali-linux-gnu*

`$OSTYPE` - Returns information about the type of OS running on the machine, eg.
`echo $OSTYPE` - *linux-gnu*

`$PATH` - *The search path for finding binaries for commands.*

Common examples include `/usr/bin` and `/usr/local/bin`.

When a user or script attempts to run a command, the paths in $PATH are searched in order to find a matching file with execute permission.

The directories in `$PATH` are separated by a : character.
`echo "$PATH"` - *`/usr/kerberos/bin:/usr/local/bin:/bin:/usr/bin`

So, for example, given the above $PATH , if you type `lss` at the prompt, the shell will look for `/usr/kerberos/bin/lss` , then `/usr/local/bin/lss` , then `/bin/lss` , then `/usr/bin/lss` , in this order, before concluding that there is no such command.

`$PPID` - *The Process ID (pid) of the script or shell's parent, meaning the process than invoked the current script or shell.*

`echo $$` - *13016*

`echo $PPID` - *13015*

`$SECONDS` - *The number of seconds a script has been running. This can get quite large if shown in the shell:*

`echo $SECONDS` - *98834*

`$SHELLOPTS` - *A readonly list of the options bash is supplied on startup to control its behaviour:*

`echo $SHELLOPTS` - `braceexpand:emacs:hashall:histexpand:history:interactive-comments:monitor`

----
`$_` - *Outputs the last field from the last command executed, useful to get something to pass onwards to another command:*
`ls *.sh;echo $_`
```
testscript1.sh testscript2.sh
testscript2.sh
```
It gives the script path if used before any other commands:

_test.sh:_
`echo "$_"`

*Output:*
```
./test.sh # running test.sh
./test.sh
```
*Note: This is not a foolproof way to get the script path*

#### - $GROUPS - _An array containing the numbers of groups the user is in:_

```bash
#!/usr/bin/env bash
echo You are assigned to the following groups:
for group in ${GROUPS[@]}; do
    IFS=: read -r name dummy number members < <(getent group $group )
    printf "name: %-10s number: %-15s members: %s\n" "$name" "$number" "$members"
done
```

```console
You are assigned to the following groups:
name: root       number: 0            members:
name: kaboxer    number: 142          members: harsh,root
```
----
`$LINENO` - _Outputs the line number in the current script. Mostly useful when debugging scripts._
```bash

# this is line 2
echo something # this is line 3
echo $LINENO # Will output 4
```
----
`$SHLVL` - _When the bash command is executed a new shell is opened. The $SHLVL environment variable holds the number of shell levels the current shell is running on top of._

#### - In a new terminal window, executing the following command will produce different results based on the Linux distribution in use.

`echo $SHLVL`

#### - Using Fedora 25, the output is "3". This indicates, that when opening a new shell, an initial bash command executes and performs a task. The initial bash command executes a child process (another bash command) which, in turn, executes a final bash command to open the new shell. When the new shell opens, it is running as a child process of 2 other shell processes, hence the output of "3".

#### - In the following example (given the user is running Fedora 25), the output of $SHLVL in a new shell will be set to "3".
#### As each bash command is executed, $SHLVL increments by one.

```console
echo $SHLVL #3
bash
echo $SHLVL
4
bash
echo $SHLVL
5
```
----
####  _One can see that executing the 'bash' command (or executing a bash script) opens a new shell. In comparison, sourcing a script runs the code in the current shell._

```bash
#test1.sh
#!/usr/bin/env bash
echo "Hello from test1.sh. My shell level is $SHLVL"
source "test2.sh"
```

```bash
#test2.sh
#!/usr/bin/env bash
echo "Hello from test2.sh. My shell level is $SHLVL"
```

```bash
#run.sh
#!/usr/bin/env bash
echo "Hello from run.sh. My shell level is $SHLVL"
./test1.sh
```
#### - Execute:
```console
chmod +x test1.sh && chmod +x run.sh
./run.sh
test1.sh
```

```console
Hello from run.sh. My shell level is 4
Hello from test1.sh. My shell level is 5
Hello from test2.sh. My shell level is 5
```
----
`$UID` - # _A read only variable that stores the users' ID number:_
```console
echo $UID
12345
```

```console
fg %2
sleep 600
```
#### - %2 specifies job no. 2. If fg is used without any arguments if brings the last process put in background to the foreground.

```console
fg %?sle
sleep 500
```
#### - _?sle refers to the baground process command containing "sle". If multiple background commands contain the string, it will produce an error.

#### Restart stopped background process
```console
bg
[8]+ sleep 600 &
```

#### - Run command in background
```console
sleep 500 &
[1] 7582
```
#### - Puts the sleep command in background. 7582 is the process id of the background process.

#### - Stop a foreground process
_Press Ctrl + Z to stop a foreground process and put it in background_
```console
sleep 600
^Z
[8]+ Stopped       sleep 600
```
----
#### - Splitting Files
_Sometimes its useful to split a file into multiple separate files. If you have large files, it might be a good idea to break it into smaller chunks_

#### - Split a file - *Running the split command without any options will split a file into 1 or more separate files containing up to 1000 lines each.

`split file`

### - This will create files named xaa , xab , xac , etc, each containing up to 1000 lines. As you can see, all of them are prefixed with the letter x by default. If the initial file was less than 1000 lines, only one such file would be created.

#### - To change the prefix, add your desired prefix to the end of the command line split file customprefix

#### - Now files named customprefixaa , customprefixab , customprefixac etc. will be created

#### - To specify the number of lines to output per file, use the -l option. The following will split a file into a maximum of 5000 lines

`split -l5000 file`
#OR
`split --lines=5000 file`

#### - Alternatively, you can specify a maximum number of bytes instead of lines. This is done by using the -b or --bytes options. For example, to allow a maximum of 1MB

`split --bytes=1MB file`

----

#### * File transfer using scp
##### - To transfer a file securely to another machine - type:
```console
scp file1.txt tom@server2:$HOME
```
#### - This example presents transferring file1.txt from our host to server2 's user tom 's home directory.

#### * scp transferring multiple files
##### - scp can also be used to transfer multiple files from one server to another. Below is example of transferring all files from my_folder directory with extension .txt to server2 . In Below example all files will be transferred to user tom home directory.

```console
scp /my_folder/*.txt tom@server2:$HOME
```

#### * Downloading file using scp
##### - To download a file from remote server to the local machine - type:

```console
scp tom@server2:$HOME/file.txt /local/machine/path/
```

#### _This example shows how to download the file named file.txt from user tom 's home directory to our local machine's current directory._
----
#### Chain of commands and operations
##### - There are some means to chain commands together. Simple ones like just a ; or more complex ones like logical chains which run depending on some conditions. The third one is piping commands, which effectively hands over the output data to the next command in the chain.

#### Counting a text pattern ocurrence Using a pipe makes the output of a command be the input of the next one.
```console
ls -1 | grep -c ".conf"
```

#### - In this case the output of the ls command is used as the input of the grep command. The result will be the number of files that include "`.conf`" in their name.
#### - This can be used to contruct chains of subsequent commands as long as needed:
```console
ls -1 | grep ".conf" | grep -c .
```

#### - transfer root cmd output to user file Often one want to show the result of a command executed by root to other users. The tee command allows easily to write a file with user perms from a command running as root:
```console
su -c ifconfig | tee ~/results-of-ifconfig.txt
```

#### - Only ifconfig runs as root.

#### - logical chaining of commands with && and || && chains two commands. The second one runs only if the first one exits with success. || chains two commands.
#### - But second one runs only if first one exits with failure.
`[ a = b ] && echo "yes" || echo "no"`

#### - if you want to run more commands within a logical chain, use curly braces which designate a block of commands
#### - They do need a ; before closing bracket so bash can diffentiate from other uses of curly braces
```bash
[ a = b ] && { echo "let me see."
echo "hmmm, yes, i think it is true" ; } \
|| { echo "as i am in the negation i think "
echo "this is false. a is a not b." ; }
```
#### mind the use of line continuation sign \
#### only needed to chain yes block with || ....

#### * serial chaining of commands with semicolon

#### - A semicolon separates just two commands.
`echo "i am first" ; echo "i am second" ; echo " i am third"`

#### - Chaining commands with |
_The | takes the output of the left command and pipes it as input the right command. Mind, that this is done in a subshell. Hence you cannot set values of vars of the calling process within a pipe._
```bash
find . -type f -a -iname '*.mp3' | \
while read filename; do
    mute --noise "$filename"
done
```
#### - Detect type of shell
```console
shopt -q login_shell && echo 'login' || echo 'not-login'
```
----
#### Introduction to dot files
##### - In Unix, files and directories beginning with a period usually contain settings for a specific program/a series of programs. Dot files are usually hidden from the user, so you would need to run ls -a to see them.

* An example of a dot file is .bash_history , which contains the latest executed commands, assuming the user is using Bash.
* There are various files that are sourced when you are dropped into the Bash shell. The image below, taken from this site, shows the decision process behind choosing which files to source at startup.
