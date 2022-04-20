#!/bin/bash

help()
{
	# Dsiplay help information to user
	echo "+=========================================================+"
	echo "|tsort lists all the files/folders in the user's home     |"
    echo "|directory by order of last modification, defaulting      |" 
    echo "|to display all files/folders at the same level as home.  |" 
    echo "|[options]:                                               |"
    echo "|-r   list contents of all folders in home recursively.   |"
    echo "+=========================================================+"
}

listByModified() {
    cd $HOME
    if [[ $1 = "r" ]]; then
        # get all files in all folders in home recursively, then order by time last modified
        FILEAGES=`ls -lthR --time=ctime`
    else
        # get all files & folders, ordered by time last modified
        FILEAGES=`ls -lth --time=ctime`
    fi
    echo "=================================================="
    echo "Age of files in $USER's home directory: $FILEAGES"

}

arguments="false"

while getopts ":hr" option; do
	case $option in
		h) # display help message
			help
			arguments=true
			exit;;
		r) # list files/folders in home directory recursively
            listByModified r
            arguments=true
			exit;;
		\?)
			echo "Invalid option specified, for a list of valid options, type '-h'."
			arguments="true"
			exit;;
	esac
done

if [[ "$arguments" == "false" ]]; then
	listByModified
fi
