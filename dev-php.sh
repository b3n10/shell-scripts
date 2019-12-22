#!/bin/sh

cd ~/workspace/php/

tmux -f ~/.dotfiles/tmux.conf new -s "php" -d "bash"
tmux rename-window 'bash'

tmux new-window
tmux rename-window 'vim'

tmux select-window -t 0
tmux setw -g mode-keys vi
tmux attach-session -d
# tmux -f ~/.dotfiles/tmux.conf

#!/bin/sh

# if [ -z "$1" ]
# then
#     echo "Usage: dev.php <directory-name>"
# else
#     cd ~/workspace/php/$1
#
#     tmux -f ~/.dotfiles/tmux.conf new -s "php" -d "bash"
#     tmux rename-window 'server'
#
#     tmux new-window
#     tmux rename-window 'vim'
#
#     tmux new-window
#     tmux rename-window 'bash'
#
#     tmux new-window
#     tmux rename-window 'git'
#
#     tmux select-window -t 1
#
#     tmux attach-session -d
# fi
