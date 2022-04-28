#!/bin/bash
# A script to automatically find the largest directory found within the user's home directory.

# Help function with information on using this script
help() 
{
    # Display help information
    echo "+===============================================================+"    
    echo "|bgdir automatically finds the largest directories within the   |"
    echo "|user's home folder. If no arguments are provided, script will  |"
    echo "|find the top 15 largest directories and list them in descending|"
    echo "|(greatest to least size) order.                                |" 
    echo "|Syntax: bgdir <numberofdirectoriestoshow> [-r/-h]              |"
    echo "|Options:                                                       |"
    echo "|[number of directories] replace with number of                 |" 
    echo "|directories you want to display.                               |"
    echo "|-r    Reverse output (least to greatest).                      |"
    echo "|-h    Show this help message.                                  |"
    echo "+===============================================================+"   
}

while getopts ":h" option; do
    case $option in
    h) # display a help message
        help
        exit;;
    esac
done

cd /$HOME
echo Top $1 Directories in HOME from largest to smallest:
echo =========================================================
du -Sh | sort -rhs | head -$1
