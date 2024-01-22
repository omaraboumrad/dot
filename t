wd="${PWD##*/}"
tmux new-session -s ${wd} \; new-window \; new-window \; select-window -t 0 \;
