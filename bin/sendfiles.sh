#!/bin/bash

FILES_TO_SEND="files_to_send.txt"
FILES_PATH="/d/Unknown/Shell Scripting/sampledel"
PUBLIC_KEY="/c/Users/MANOJ/.ssh/id_rsa"
REMOTE_PORT="2228"
REMOTE_USER="manoj"
REMOTE_HOST="localhost"
REMOTE_PATH="/home/manoj/learn/"
FILES_TO_BE_SENT="files_to_be_sent"


mkdir -p "$FILES_TO_BE_SENT"

rm -f "$FILES_TO_BE_SENT"/*
ls -lrt "$FILES_TO_BE_SENT"


while IFS= read -r current_file; do
    echo "$current_file"
    FULL_PATH="${FILES_PATH}/${current_file}"
    echo "$FULL_PATH"
    if [[ -f "$FULL_PATH" ]]; then
        echo "Copying file to $FILES_TO_BE_SENT"
        cp "$FULL_PATH" "$FILES_TO_BE_SENT/"
        echo "File ${FULL_PATH##*/} COPIED"
    else
        echo "${FULL_PATH##*/} does not exist"
    fi
done < "$FILES_TO_SEND"


scp -i "$PUBLIC_KEY" -P "$REMOTE_PORT" "$FILES_TO_BE_SENT"/* "${REMOTE_USER}@${REMOTE_HOST}:${REMOTE_PATH}"   