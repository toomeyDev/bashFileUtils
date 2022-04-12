#!/bin/bash
# A script to automatically find the largest directory found within the user's home directory.

# Help function with information on using this script
help() 
{
    # Display help information
    echo "================================================================================"    
    echo "bgdir automatically finds the largest directories within the user's home folder."
    echo "if no arguments are provided, it will find the top 15 largest directories and"
    echo "list them in descending (greatest to least size) order."    
    echo "Syntax: bgdir <numberofdirectoriestoshow> [-r/-h]"
    echo "Options:"
    echo "[number of directories] replace with number of directories you want to display."
    echo "-r    Reverse output (least to greatest)."
    echo "-h    Show this help message."
    echo    
}

while getopts ":h" option; do
    case $option in
    h)
        help
        exit;;
    esac
done

cd /$HOME
echo Top $1 Directories in HOME from largest to smallest:
echo =========================================================
du -Sh | sort -rhs | head -$1




