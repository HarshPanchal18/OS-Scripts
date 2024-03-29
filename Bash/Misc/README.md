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

#### - Color script output (cross-platform)
`color-output.sh`
##### - In the opening section of a bash script, it's possible to define some variables that function as helpers to color or otherwise format the terminal output during the run of the script.

##### - Different platforms use different character sequences to express color. However, there's a utility called tput which works on all *nix systems and returns platform-specific terminal coloring strings via a consistent cross-platform API.

* For example, to store the character sequence which turns the terminal text red or green:
```console
red=$(tput setaf 1)
green=$(tput setaf 2)
```
* Or, to store the character sequence which resets the text to default appearance:

```console
reset=$(tput sgr0)
```

* Then, if the BASH script needed to show different colored outputs, this can be achieved with:
```console
echo "${green}Success!${reset}" echo "${red}Failure.${reset}"
```

----

#### - co-processes
* create the co-process
`coproc bash`

* send a command to it (echo a)
```console
echo 'echo Hello World' >&"${COPROC[1]}"
```
* read a line from its output
```console
read line <&"${COPROC[0]}"
```
* show the line
```console
echo "$line"
```
_The output is "Hello World"._

----

#### - declare weakly typed variables
- `declare` is an internal command of bash. (internal command use help for displaying "manpage"). It is used to show and define variables or show function bodies.

- Syntax: `declare [options] [name[=value]]...`

#### options are used to define an integer
`declare -i myInteger` , `declare -i anotherInt=10`

#### - an array with values
`declare -a anArray=( one two three)`

#### - an assoc Array
`declare -A assocArray=( [element1]="something" [second]=anotherthing )`

* note that bash recognizes the string context within []
some modifiers exist

#### - uppercase content
`declare -u big='this will be uppercase'`

#### - same for lower case
`declare -l small='THIS WILL BE LOWERCASE'`

#### - readonly array
`declare -ra constarray=( eternal true and unchangeable )`

#### - export integer to environment
`declare -xi importantInt=42`

* You can use also the + which takes away the given attribute. Mostly useless, just for completness.
* To display variables and/or functions there are some options too

----

#### - printing definded vars and functions

`declare -f` _restrict output to functions only_

`declare -F` _if debugging prints line number and filename defined in too_

----

### - Jobs at specific times
##### - Execute job once at specific time
* Note: at is not installed by default on most of modern distributions.

* To execute a job once at some other time than now, in this example 5pm, you can use
```console
echo "somecommand &" | at 5pm
```

#### - If you want to catch the output, you can do that in the usual way:
```console
echo "somecommand > out.txt 2>err.txt &" | at 5pm
```

#### - at understands many time formats, so you can also say
```console
echo "somecommand &" | at now + 2 minutes
echo "somecommand &" | at 17:00
echo "somecommand &" | at 17:00 Jul 7
echo "somecommand &" | at 4pm 12.03.17
```

#### - If no year or date are given, it assumes the next time the time you specified occurs. So if you give a hour that already passed today, it will assume tomorrow, and if you give a month that already passed this year, it will assume next year.

#### - This also works together with nohup like you would expect.
```console
echo "nohup somecommand > out.txt 2>err.txt &" | at 5pm
```

* There are some more commands to control timed jobs:

> atq lists all timed jobs (atqueue)

> atrm removes a timed job (atremove )

>batch does basically the same like at, but runs jobs only when system load is lower than 0.8

* _All commands apply to jobs of the user logged in. If logged in as root, system wide jobs are handled of course._

----

####  Cut Command
```text
Parameter       Details
-f, --fields Field-based selection
-d, --delimiter Delimiter for field-based selection
-c, --characters Character-based selection, delimiter ignored or error
-s, --only-delimited Suppress lines with no delimiter characters (printed as-is otherwise)
--complement Inverted selection (extract all except specified fields/characters
--output-delimiter Specify when it has to be different from the input delimiter
```

##### - The cut command is a fast way to extract parts of lines of text files. It belongs to the oldest Unix commands. Its most popular implementations are the GNU version found on Linux and the FreeBSD version found on MacOS, but each flavor of Unix has its own. See below for differences. The input lines are read either from stdin or from files listed as arguments on the command line.

#### - Only one delimiter character
#### - You cannot have more than one delimiter: if you specify something like -d ",;:" , some implementations will use only the first character as a delimiter (in this case, the comma.) Other implementations (e.g. GNU cut ) will give you an error message.

```bash
cut -d ",;:" -f2 <<<"J.Smith,1 Main Road,cell:1234567890;land:4081234567"
```

#### - cut: the delimiter must be a single character
#### - Try `cut --help` for more information.

#### - Repeated delimiters are interpreted as empty fields
```console
cut -d, -f1,3 <<<"a,,b,c,d,e"
```
`a,b`

#### - is rather obvious, but with space-delimited strings it might be less obvious to some
```console
cut -d ' ' -f1,3 <<<"a  b  cd e"
```
`a b`

#### - cut cannot be used to parse arguments as the shell and other programs do.

#### - No quoting
#### - There is no way to protect the delimiter. Spreadsheets and similar CSV-handling software usually can recognize a text-quoting character which makes it possible to define strings containing a delimiter. With cut you cannot.
```console
cut -d, -f3 <<<'John,Smith,"1, Main Street"'
```
`"1`

#### - Extracting, not manipulating
#### - You can only extract portions of lines, not reorder or repeat fields.
```console
cut -d, -f2,1 <<<'John,Smith,USA' ## Just like -f1,2
```
`John,Smith`

```console
cut -d, -f2,2 <<<'John,Smith,USA' ## Just like -f2
```
`Smith`

### Cut Command
```
Option         Description
-b LIST , --bytes=LIST Print the bytes listed in the LIST parameter
-c LIST , --characters=LIST Print characters in positions specified in LIST parameter
-f LIST , --fields=LIST Print fields or columns
-d DELIMITER Used to separate columns or fields
```

#### - Show the first column of a file
#### - Suppose you have a file that looks like this
```
John Smith 31
Robert Jones 27
```

#This file has 3 columns separated by spaces. To select only the first column, do the following.
```console
cut -d ' ' -f1 filename
```
This will display the following output
```text
John
Robert
```

#### - Here the `-d` flag, specifies the delimiter, or what separates the records.
#### The `-f` flag specifies the field or column number.

#### - Show columns x to y of a file
#### - Sometimes, its useful to display a range of columns in a file.
#### - Suppose you have this file
```text
Apple California 2017 1.00 47
Mango Oregon 2015 2.30 33
```

#### - To select the first 3 columns do
```console
cut -d ' ' -f1-3 filename
```
#### - This will display the following output
```text
Apple California 2017
Mango Oregon 2015
```
----

#### - Select keyword
* Select keyword can be used for getting input argument in a menu format.

* Select keyword can be used for getting input argument in a menu format

* Suppose you want the user to SELECT keywords from a menu, we can create a script similar to

```bash
select os in "linux" "windows" "mac"
do
    echo "${os}"
    break
done
```

- Explanation: Here SELECT keyword is used to loop through a list of items that will be presented at the command prompt for a user to pick from. Notice the break keyword for breaking out of the loop once the user makes a choice. Otherwise, the loop will be endless!

- Results: Upon running this script, a menu of these items will be displayed and the user will be prompted for a selection. Upon selection, the value will be displayed, returning back to command prompt.

```console
bash select_menu.sh
1) linux
2) windows
3) mac
? 3
mac
```

----

#### - Networking commands

`ifconfig` - _will show all active interface of the machine and also give the information of_

1. IP address assign to interface
2. MAC address of the interface
3. Broadcast address
4. Transmit and Receive bytes

#### - Some example

`ifconfig -a` 
_also show the disable interface_

`ifconfig eth0`
_will only show the eth0 interface_

`ifconfig eth0 192.168.1.100 netmask 255.255.255.0`
_will assign the static IP to eth0 interface_

`ifup eth0`
_will enable the eth0 interface_

`ifdown eth0`
_will disable the eth0 interface_

`ping`
_(Packet Internet Grouper) is to test the connectivity between the two nodes_

`ping -c2 8.8.8.8`
_will ping or test the connectivity with google server for 2 seconds_

`traceroute`
_is to use in troubleshooting to find out the number of hops taken to reach the destination_

`netstat`
_(Network statistics) give the connection info and their state_

`dig www.google.com`
_(domain information grouper) query the DNS related information_

`nslookup www.google.com`
_query the DNS and find out the IP address of corresponding the website name_

`route`
_is used to check the Netwrok route information. It basically show you the routing table_

`router add default gw 192.168.1.1 eth0`
_will add the default route of network of eth0 Interface to 192.168.1.1 in routing table_

`route del default`
_will delete the default route from the routing table_

----

#### - Parallel Jobs

|Option |     Description |
--------|-----------------
|-j n | Run n jobs in parallel|
|-k   |   Keep same order|
|-X     | Multiple arguments with context replace|
|--colsep regexp   |  Split input on regexp for positional replacements |
| {} {.} {/} {/.} {#} | Replacement strings |
| {3} {3.} {3/} {3/.} | Positional replacement strings |

-S sshlogin Example: foo@server.example.com

| | |
|---------------|----------|
|--trc {}.bar  |      Shorthand for --transfer --return {}.bar --cleanup |
|--onall        |     Run the given command with argument on all sshlogins |
|--nonall       |     Run the given command with no arguments on all sshlogins |
|--pipe          |    Split stdin (standard input) to multiple jobs. | 
|--recend str    |    Record end separator for --pipe. | 
|--recstart str      | Record start separator for --pipe. |

#### - Jobs in GNU Linux can be parallelized using GNU parallel.
* A job can be a single command or a small script that has to be run for each of the lines in the input. The typical input is a list of files, a list of hosts, a list of users, a list of URLs, or a list of tables.
* A job can also be a command that reads from a pipe.


#### - Parallelize repetitive tasks on list of files
* Many repetitive jobs can be performed more efficiently if you utilize more of your computers resources (i.e. CPUs and RAM). Below is an example of running multiple jobs in parallel.

#### - Suppose you have a < list of files > , say output from ls . Also, let these files are bz2 compressed and the following order of tasks need to be operated on them.

#### - Running this using a while-loop may look like this
```bash
filenames="file_list.txt"
while read -r line
do
    name="$line"
    ## grab lines with puppies in them
    bzcat $line | grep puppies | gzip >> output.gz
done < "$filenames"
```

#### - Using GNU Parallel, we can run 3 parallel jobs at once by simply doing
```console
parallel -j 3 "bzcat {} | grep puppies" ::: $( cat filelist.txt ) | gzip > output.gz
```

#### - This command is simple, concise and more efficient when number of files and file size is large. The jobs gets initiated by parallel , option `-j 3` launches 3 parallel jobs and input to the parallel jobs is taken in by ` ::: ` .

* The output is eventually piped to `gzip > output.gz`

----

#### - Decoding URL

##### - Simple example

#### - Encoded URL
`http%3A%2F%2Fwww.foo.com%2Findex.php%3Fid%3Dqwerty`

#### - Use this command to decode the URL
```console
echo "http%3A%2F%2Fwww.foo.com%2Findex.php%3Fid%3Dqwerty" | sed -e "s/%\([0-9A-F][0-9A-F]\)/\\\\\x\1/g" | xargs -0 echo -e
```

#### - Decoded URL (result of command)
```console
http://www.foo.com/index.php?id=qwerty
```

#### - Using printf to decode a string
```bash
string='Question%20-
%20%22how%20do%20I%20decode%20a%20percent%20encoded%20string%3F%22%0AAnswer%20%20%20-%20Use%20printf%20%3A)'
printf '%b\n' "${string//%/\\x}"
```

#### - the result
* Question - "how do I decode a percent encoded string?"
* Answer - Use printf :)

```console
set -e
cd ~/non/existent/directory
rm -rf *
```

`set -e` tells Bash to exit the script immediately if any command returns a non-zero status.

#### - Missing The Last Line in a File
#### - The C standard says that files should end with a new line, so if EOF comes at the end of a line, that line may not be missed by some commands. As an example:

```console
echo 'one\ntwo\nthree\c' > file.txt
```

```console
cat file.txt
one
two
three
```

```bash
while read line ; do echo "line $line" ; done < file.txt
```
one

two

#### - To make sure this works correctly for in the above example, add a test so that it will continue the loop if the last line is not empty.

```bash
while read line || [ -n "$line" ] ; do echo "line $line" ; done < file.txt
```

one

two

three

#### - Write awk script to display file contents in reverse.(last line should be displayed first ..first line should be displayed last).
```awk
awk '{ a[ i++ ]=$0}
END{for( j=i-1; j>=0; j-- )
print a[ j ];}' nidhi1
```

----
