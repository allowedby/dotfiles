#!/bin/sh

selected="$(printf "poweroff\nreboot\nsuspend\nlock\nlogout\n" | dmenu)"
[ -z "$selected" ] && exit 0
case "$selected" in
    poweroff) systemctl poweroff ;;
    reboot) systemctl reboot ;;
    suspend) slock systemctl suspend ;;
    lock) slock ;;
    logout) loginctl kill-user "$(whoami)" ;;
esac
