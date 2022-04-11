#!/bin/bash
# A script to automatically count the size of files in the user trash folder
TRASHDIR=/home/$USER/.local/share/Trash/files
cd $TRASHDIR
echo User trash size: `du -sh /$TRASHDIR`
echo =========================================================
for FILE in *; do echo -[$FILE]; done
