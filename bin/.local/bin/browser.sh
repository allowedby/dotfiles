#!/bin/sh

selected="$(printf "bookmarks\nprofiles\nyoutube\ntwitch\nlocalhost\n" | dmenu)"
[ -z "$selected" ] && exit 0
case "$selected" in
    bookmarks)
        file="$XDG_DATA_HOME/bookmarks.txt"
        selected="$(grep -v "^#\|^$" "$file" | cut -d "," -f 1 | dmenu | awk "{print \$1\",\"}" | grep -f - "$file" | cut -d "," -f 2)"
        [ -z "$selected" ] && exit 0
        firefox -P default-release "$selected" && exit 0
        ;;
    profiles)
        profile="$(grep "Name" "$HOME/.mozilla/firefox/profiles.ini" | sed "s/Name=//" | dmenu)"
        [ -z "$profile" ] && exit 0
        firefox -P "$profile"
        ;;
    youtube)
        query="$(:| dmenu | tr " " "+")"
        [ -z "$query" ] && exit 0
        firefox "https://www.youtube.com/results?search_query=$query" && exit 0
        ;;
    twitch)
        query="$(:| dmenu | tr " " "+")"
        [ -z "$query" ] && exit 0
        firefox "https://www.twitch.tv/$query" && exit 0
        ;;
    localhost) firefox "127.0.0.1:8080" ;;
esac
