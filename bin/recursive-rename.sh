#!/usr/bin/env bash
#
# Recursively renames files.
#
# Usage:
#
# rec_rename <old-name> <new-name>
#

set -e

function rec_rename() {
    OLD_FILENAME=$1
    NEW_FILENAME=$2
    FILES=`find \`pwd\` -name $OLD_FILENAME`
    for FILE in $FILES
    do
        NEWFILE=`echo $FILE | sed "s/$OLD_FILENAME/$NEW_FILENAME/"`
        mv $FILE $NEWFILE
    done
}

rec_rename $1 $2
