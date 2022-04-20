# bashFileUtils
Bash scripts intended to be used in a Bash terminal environment to manage and manipulate files easily.

## Contents

- **ts** - Short for *Trash Size*, lists out the files in the current user's "trash" directory on Linux systems as well as the total size (in b/kb/gb) of the directory.
Options include -h (show help for this script) and -d (delete the contents of the user's trash directory after listing them out).

- **bgDir** *Biggest Directories*, will automatically find the largest directories in the user's home folder and print them from greatest to largest including folder-sizes.    
Options include -h (show help for this script) and [numberofdirectories] which adjusts the number of directories to display, ie bgDir.sh 5 will display only the top 5 directories in terms of size.

- **tsort** *TimeSort*, will sort all files found in the User's HOME directory by time of last modification, then print them to the screen in that order.
Options include -h (show help for this script) and -r (list contents of all folders in HOME recursively), *ie* tsort -r will list all the files and folders, as well as contents of folders in the user's HOME directory by order of last modification.
