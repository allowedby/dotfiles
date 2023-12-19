#!/bin/sh

get_column() {
    cut -d "," -f "$1" "$file" | tail -n +2 | sort -u
}

set -e

if [ ! $# -gt 0 ]; then
    echo "missing input file"
    exit 1
fi

file="$1"

y="$(get_column 1 | fzf)"
t="$(get_column 4 | fzf)"
c="$(get_column 5 | fzf)"

awk -F "," "/$y,.*$t,.*$c,/ { print } /$y,.*$t,.*$c,/ { sum += \$7 } END { print sum }" "$file" | column -s "," -t | less
