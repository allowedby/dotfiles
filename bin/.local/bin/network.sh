#!/bin/sh

conn="$(nmcli device status | grep " connected " | grep "ethernet" | cut -d " " -f 1)"
[ -z "$conn" ] && conn="$(nmcli device status | grep " connected " | grep "wifi" | cut -d " " -f 1)"
[ -z "$conn" ] && notify-send "network" "no connection found" && exit 0

selected="$(printf "reconnect\n" | dmenu)"
[ -z "$selected" ] && exit 0

case "$selected" in
    reconnect) nmcli device disconnect "$conn" && notify-send "network" "disconnected from $conn" && sleep 5 && nmcli device connect "$conn" && notify-send "network" "connected to $conn" || notify-send "network" "reconnection error" ;;
esac
