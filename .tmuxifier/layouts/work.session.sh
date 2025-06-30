#!/usr/bin/env bash

session_name="work"
current_dir="$(pwd)"

if ! tmux has-session -t "$session_name" 2>/dev/null; then
  tmux new-session -d -s "$session_name" -c "$current_dir"

  tmux rename-window -t "$session_name:0" 'editor'
  tmux send-keys -t "$session_name:0.0" "nvim ." C-m

  tmux split-window -p 20 -h -t "$session_name:0" -c "$current_dir"
fi

tmux attach-session -t "$session_name"

