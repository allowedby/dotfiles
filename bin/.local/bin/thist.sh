#!/bin/sh

selected="$(cat "$XDG_CACHE_HOME/zsh-history" | fzf)"
[ -z "$selected" ] && exit 0
printf "$selected" | tmux load-buffer -
