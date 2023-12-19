#!/bin/sh

selected="$(find "$HOME/repos" -type d -mindepth 1 -maxdepth 1 | sort | fzf)"
[ -z "$selected" ] && exit 0
name="$(basename "$selected" | tr "." "_")"
tmux has-session -t "$name" 2> /dev/null || tmux new-session -ds "$name" -c "$selected"
tmux switch-client -t "$name"
