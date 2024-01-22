#!/bin/bash

first_session_name=""

while IFS= read -r line; do
    echo -n "$line"
    folder_name=$(basename "${line/\~/$HOME}")
    if [ -z "$first_session_name" ]; then
        first_session_name=$folder_name
    fi
    where="-c ${line/\~/$HOME}"
    
    # Check if the tmux session already exists.
    tmux has-session -t "${folder_name}" 2>/dev/null
    if [ $? != 0 ]; then
        # The tmux session doesn't exist, so create a new one.
        tmux new-session -s "${folder_name}" $where -d \; new-window $where \; new-window $where \; select-window -t 0 \;
        echo " ✓"
    else
        # The tmux session already exists; output a message to that effect.
        echo " already exists!"
    fi
done < "$HOME/.projects"

# Attach to the first session created, if any.
if [ -n "$first_session_name" ]; then
    tmux a -t "$first_session_name"
fi
