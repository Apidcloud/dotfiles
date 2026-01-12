#!/usr/bin/env bash

current_dir="$(pwd)"
project_name="$(basename "$current_dir" | tr '.' '_')"

# Check if we are running inside an existing tmux session
if [ -n "$TMUX" ]; then
  # INSIDE tmux: Configure the CURRENT window for this project
  tmux rename-window "$project_name" \; \
       send-keys "nvim ." C-m \; \
       split-window -h -p 20 -c "$current_dir" -d

else
  # OUTSIDE tmux: Create a new session or attach to an existing one
  if ! tmux has-session -t "$project_name" 2>/dev/null; then
    tmux new-session -d -s "$project_name" -c "$current_dir" -n "$project_name" \; \
         send-keys "nvim ." C-m \; \
         split-window -h -p 20 -c "$current_dir" -d
  fi
  tmux attach-session -t "$project_name"
fi
