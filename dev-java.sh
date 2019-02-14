#!/bin/sh

cd ~/workspace/java/

tmux -f ~/.dotfiles/tmux.conf new -s dev -d 'eclimd'
tmux rename-window 'eclimd'

tmux new-window
tmux rename-window 'vim'

tmux new-window
tmux rename-window 'bash'

tmux select-window -t 1

tmux attach-session -d
