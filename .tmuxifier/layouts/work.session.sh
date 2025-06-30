#!/usr/bin/env bash

# Try to attach to existing session for this directory
current_dir="$(pwd)"
session_name="$(basename "$current_dir" | tr '.' '_')"  # Replace dots with underscores

# Check if session exists and attach, or create new one
if ! tmux attach-session -t "$session_name" 2>/dev/null; then
    # Create new session with editor setup
    tmux new-session -d -s "$session_name" -c "$current_dir" -n 'editor' \; \
         send-keys "nvim ." C-m \; \
         split-window -p 20 -h -c "$current_dir" \; \
         attach-session
fi
