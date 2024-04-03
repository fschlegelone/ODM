#!/bin/bash

SESSION="dev"

# Check if the session already exists
tmux has-session -t $SESSION 2>/dev/null

# If the session exists, attach to it
if [ $? != 0 ]; then
    tmux attach-session -t $SESSION
else
    # If the session doesn't exist, create it
    tmux new-session -d -s $SESSION
# window #0 - info
tmux rename-window -t $SESSION:0 'info'
tmux split-window -t 0 -v
tmux split-window -t 0 -h
tmux split-window -t 2 -h
tmux split-window -t 2 -h
tmux resize-pane -t 0 -x 50%
tmux resize-pane -t 1 -x 33%
tmux resize-pane -t 2 -x 33%
tmux resize-pane -t 3 -x 33%
tmux send-keys -t $SESSION:0.0 'neofetch' C-m

# window #1 - shell
tmux new-window -t $SESSION:1 -n 'shell'
tmux split-window -t 0 -v
tmux split-window -t 1 -h

# window #2 - neovim
tmux new-window -t $SESSION:2 -n 'neovim'
tmux send-keys -t $SESSION:2.0 'nvim' C-m

# window #3 - git
tmux new-window -t $SESSION:3 -n 'git'
tmux send-keys -t $SESSION:3.0 'lazygit' C-m

    tmux attach-session -t $SESSION
fi

