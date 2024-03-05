# File execution sequence
`.bash_profile` , `.bash_login` , `.bashrc` , and `.profile` all do pretty much the same thing: set up and define functions, variables, and the sorts.

The main difference is that `.bashrc` is called at the opening of a non-login but interactive window, and
`.bash_profile` and the others are called for a login shell. Many people have their .bash_profile or similar call `.bashrc` anyway.

#.profile vs .bash_profile (and .bash_login)
`.profile` is read by most shells on startup, including bash. However, `.bash_profile` is used for configurations
specific to bash. For general initialization code, put it in `.profile` . If it's specific to bash, use `.bash_profile` .
`.profile` isn't actually designed for bash specifically, `.bash_profile` is though instead. ( `.profile` is for Bourne and other similar shells, which bash is based off) Bash will fall back to .profile if `.bash_profile` isn't found.
`.bash_login` is a fallback for `.bash_profile` , if it isn't found. Generally best to use `.bash_profile` or `.profile` instead.

## Add a path to the PATH environment variable

The PATH environment variable is generally defined in `~/.bashrc` or `~/.bash_profile` or `/etc/profile` or `~/.profile` or `/etc/bash.bashrc` (distro specific Bash configuration file)

`$ echo $PATH`

/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:
/usr/lib/jvm/jdk1.8.0_92/bin:/usr/lib/jvm/jdk1.8.0_92/db/bin:/usr/lib/jvm/jdk1.8.0_92/jre/bin

### Now, if we want to add a path (e.g ~/bin ) to the PATH variable:
```
PATH=~/bin:$PATH
# or
PATH=$PATH:~/bin
```

* But this will modify the PATH only in the current shell (and its subshell). Once you exit the shell, this modification will be gone.


* To make it permanent, we need to add that bit of code to the `~/.bashrc` (or whatever) file and reload the file.

* If you run the following code (in terminal), it will add ~/bin to the PATH permanently:*
```shell
echo 'PATH=~/bin:$PATH' >> ~/.bashrc && source ~/.bashrc
```

### Explanation:
`echo 'PATH=~/bin:$PATH' >> ~/.bashrc` adds the line `PATH=~/bin:$PATH` at the end of `~/.bashrc` file (you could do it with a text editor)
`source ~/.bashrc` reloads the `~/.bashrc` file

This is a bit of code (run in terminal) that will check if a path is already included and add the path only if not:
```shell
path=~/bin
# path to be included
bashrc=~/.bashrc
# bash file to be written and reloaded
# run the following code unmodified
echo $PATH | grep -q "\(^\|:\)$path\(:\|/\{0,1\}$\)" || echo "PATH=\$PATH:$path" >> "$bashrc";
source "$bashrc"
```

### Remove a path from the PATH environment variable
To remove a `PATH` from a `PATH` environment variable, you need to edit `~/.bashrc` or `~/.bash_profile` or `/etc/profile` or `~/.profile` or `/etc/bash.bashrc` (distro specific) file and remove the assignment for that particular path.
Instead of finding the exact assignment, you could just do a replacement in the `$PATH` in its final stage.
The following will safely remove `$path` from `$PATH` :
```shell
path=~/bin
PATH="$(echo "$PATH" |sed -e "s#\(^\|:\)$(echo "$path" |sed -e 's/[^^]/[&]/g' -e
's/\^/\\^/g')\(:\|/\{0,1\}$\)#\1\2#" -e 's#:\+#:#g' -e 's#^:\|:$##g')"
```
### To make it permanent, you will need to add it at the end of your bash configuration file.
You can do it in a functional way:
```shell
rpath(){
    for path in "$@"
    do
        PATH="$(echo "$PATH" |sed -e "s#\(^\|:\)$(echo "$path" |sed -e 's/[^^]/[&]/g' -e 's/\^/\\^/g')\(:\|/\{0,1\}$\)#\1\2#" -e 's#:\+#:#g' -e 's#^:\|:$##g')"
    done
    echo "$PATH"
}

PATH="$(rpath ~/bin /usr/local/sbin /usr/locail/bin)"
PATH="$(rpath /usr/games)"
# etc ...
```

This will make it easier to handle multiple paths.

#### Notes:
* You will need to add these codes in the Bash configuration file (~/.bashrc or whatever).
* Run source `~/.bashrc` to reload the Bash configuration (`~/.bashrc`) file.


#Handling the prompt
|Escape	    | Details|
|-----------|--------|
|\a |A bell character.
|\d |The date, in "Weekday Month Date" format (e.g., "Tue May 26").|
|\D{FORMAT} |The FORMAT is passed to `strftime'(3) and the result is inserted into the prompt string; an empty FORMAT results in a locale-specific time representation. The braces are required.|
|\e|An escape character. \033 works of course too.|
|\h|The hostname, up to the first `.'. (i.e. no domain part)|
|\H |The hostname eventually with domain part|
|\j |The number of jobs currently managed by the shell.|
|\l |The basename of the shell's terminal device name.|
|\n |A newline.|
|\r |A carriage return.|
|\s |The name of the shell, the basename of `$0' (the portion following the final slash).|
|\t |The time, in 24-hour HH:MM:SS format.|
|\T |The time, in 12-hour HH:MM:SS format.|
|@ |The time, in 12-hour am/pm format.|
|\A |The time, in 24-hour HH:MM format.|
|\u |The username of the current user.|
|\v |The version of Bash (e.g., 2.00)|
|\V |The release of Bash, version + patchlevel (e.g., 2.00.0)|
|\w |The current working directory, with $HOME abbreviated with a tilde (uses the $PROMPT_DIRTRIM variable).|
|\W |The basename of $PWD, with $HOME abbreviated with a tilde.|
|! |The history number of this command.|
|# |The command number of this command.|
|$ |If the effective uid is 0, #, otherwise $.|
|\NNN| The character whose ASCII code is the octal value NNN.|
|\ |A backslash.|
|\[ |Begin a sequence of non-printing characters. This could be used to embed a terminal control sequence into the prompt.|
|\] |End a sequence of non-printing characters.|
