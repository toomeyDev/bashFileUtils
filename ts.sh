#!/bin/bash
# A script to automatically count the size of files in the user trash folder
TRASHDIR=/home/$USER/.local/share/Trash/files

help()
{
	# Dsiplay help information to user
	echo "========================================================="
	echo "ts moves to the user's trash directory and lists out all the files/folders present inside,"
	echo "with the filesize displayed next to each item, the total size of the trash directory at top."
	echo "Syntax: ls [-d/-h]"
	echo "Options:"
	echo "-d    Delete the contents of the user trash directory after displaying them."
	echo "Note that this will delete these items PERMANENTLY."
	echo "-h    Show this help message."  
	echo
}

getTrashSize()
{
	cd $TRASHDIR
	echo User trash size: `du -sh /$TRASHDIR`
	echo "========================================================="
	for FILE in *; do echo -[`du -sh "$FILE"`]; done
}

arguments="false"

while getopts ":hd" option; do
	case $option in
		h) # display help message
			help
			arguments=true
			exit;;
		d) # get the size of the user's trash directory, then delete all present files
			getTrashSize
			cd $TRASHDIR
			for FILE in *; do rm -rf ..?* .[!.]* *; done
			echo "Trash emptied".
			arguments="true"
			exit;;
		\?)
			echo "Invalid option specified, for a list of valid options, type '-h'."
			arguments="true"
			exit;;
	esac
done

if [[ "$arguments" == "false" ]]; then
	getTrashSize
fi
