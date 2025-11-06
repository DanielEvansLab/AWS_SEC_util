# AWS SEC utilities

This repo is a collection of scripts to make it easier to use AWS SEC.

Navigate to home dir, clone the repo, cd into repo, and run scripts as you wish.

## tmux usage

tmux is good for long-running processes. init_config.sh installs tmux. 

Start tmux by typing `tmux`. This creates a default session, number 0, and attaches to it.

Detach from tmux session with `Ctrl+b` followed by `d`. Process continues to run in the tmux session, even if you disconnect from the server. 

List active tmux sessions with `tmux ls`

Reattach to session 0 like this `tmux attach -t 0`

Test tmux with a long-running process like this.
c=1
while true; do echo "Hello $c"; let c=c+1; sleep 1; done

You can end it with `Ctrl+c`




