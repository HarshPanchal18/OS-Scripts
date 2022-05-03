|Variable  |     Details|
|----------|------------|
|$* / $@   |    $* and $@ are the same as $1 $2 ... (note that it generally makes no sense to leave those unquoted)|
|          |  "$*" is the same as "$1 $2 ..." 1|
|          | "$@" is the same as "$1" "$2" ...|
|          |1. Arguments are separated by the first character of $IFS, which does not have to be a space.|
|$# | Number of positional parameters passed to the script or function|
|$! | Process ID of the last (righ-most for pipelines) command in the most recently job put into the background (note that it's not necessarily the same as the job's process group ID when job control is enabled)|
|$ | ID of the process that executed bash|
|$? | Exit status of the last command|
|$n | Positional parameters, where n=1, 2, 3, ..., 9|
|${n}| Positional parameters (same as above), but n can be > 9|
|$0 | In scripts, path with which the script was invoked; with bash -c 'printf "%s\n" "$0"' name args' : name (the first argument after the inline script), otherwise, the argv[ 0 ] that bash received.|
|$_ | Last field of the last command|
|$IFS|Internal field separator|
|$PATH |PATH environment variable used to look-up executables|
|$OLDPWD |Previous working directory|
|$PWD |Present working directory|
|$FUNCNAME |Array of function names in the execution call stack|
|$BASH_SOURCE |Array containing source paths for elements in FUNCNAME array. Can be used to get the script path.|
|$BASH_ALIASES |Associative array containing all currently defined aliases|
|$BASH_REMATCH |Array of matches from the last regex match|
|$BASH_VERSION |Bash version string|
|$BASH_VERSINFO |An array of 6 elements with Bash version information|
|$BASH |Absolute path to the currently executing Bash shell itself (heuristically determined by bash based on argv[ 0 ] and the value of $PATH ; may be wrong in corner cases)|
|$BASH_SUBSHELL| Bash subshell level
|$UID |Real (not effective if different) User ID of the process running bash
|$PS1| Primary command line prompt; see Using the PS * Variables|
|$PS2| Secondary command line prompt (used for additional input)|
|$PS3| Tertiary command line prompt (used in select loop)|
|$PS4 |Quaternary command line prompt (used to append info with verbose output)|
|$RANDOM |A pseudo random integer between 0 and 32767|
|$REPLY |Variable used by read by default when no variable is specified. Also used by SELECT to return the user-supplied value|
|$PIPESTATUS| Array variable that holds the exit status values of each command in the most recently executed foreground pipeline.|

- - - -
>**Variable Assignment must have no space before and after. a=123 not a = 123 . The latter (an equal sign surrounded by spaces) in isolation means run the command a with the arguments = and 123 , though it is  also seen in the string comparison operator (which syntactically is an argument to [ or [[ or whichever test you are using).**
- - - -
