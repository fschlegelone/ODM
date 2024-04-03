#!/bin/bash
tmux list-sessions -F "  #S(#P)    open_windows:#{session_windows} #W  "

