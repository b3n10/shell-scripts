#!/bin/sh

if [ -z "$1" ]
then
    echo "Usage: dev.js <directory-name>"
else
    if [ -d ~/workspace/js/$1 ];
    then
        cd ~/workspace/js/$1

        tmux -f ~/.dotfiles/tmux.conf new -s "js" -d "bash"
        tmux rename-window 'server'

        tmux new-window
        tmux rename-window 'vim'

        tmux new-window
        tmux rename-window 'bash'

        tmux new-window
        tmux rename-window 'git'

        tmux select-window -t 1

        tmux attach-session -d
    else
        mkdir ~/workspace/js/$1
        cd ~/workspace/js/$1

        tmux -f ~/.dotfiles/tmux.conf new -s "js" -d "bash"
        tmux rename-window 'server'

        tmux new-window
        tmux rename-window 'vim'

        tmux new-window
        tmux rename-window 'bash'

        tmux new-window
        tmux rename-window 'git'

        tmux select-window -t 1

        tmux attach-session -d
    fi
fi
