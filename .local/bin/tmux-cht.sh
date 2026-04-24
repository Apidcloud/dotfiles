#!/usr/bin/env bash

selected=$(cat ~/.local/bin/.cht-languages ~/.local/bin/.cht-commands | fzf)
if [[ -z "$selected" ]]; then
    exit 0
fi

read -r -p "Query: " query

if grep -qs "$selected" ~/.local/bin/.cht-languages; then
    encoded_query=$(printf '%s' "$query" | tr ' ' '+')
    url="cht.sh/$selected/$encoded_query/"
    printf -v escaped_url '%q' "$url"
    tmux neww "bash -lc 'echo curl $escaped_url; curl $escaped_url; while :; do sleep 1; done'"
else
    url="cht.sh/$selected~$query"
    printf -v escaped_url '%q' "$url"
    tmux neww "bash -lc 'curl -s $escaped_url | less -R'"
fi
