#!/usr/bin/env bash

session_name="remote-dev"
nvim_cmd="nvim -c 'lua vim.defer_fn(function() vim.cmd(\"Telescope remote-sshfs connect\") end, 200)'"

# Check if we are running inside an existing tmux session
if [ -n "$TMUX" ]; then
  # INSIDE tmux: Configure the CURRENT window for this project
  tmux rename-window "gateway" \; \
       send-keys "$nvim_cmd" C-m \; \
       split-window -h -p 20 -d

else
  # OUTSIDE tmux: Create a new session or attach to an existing one
  if ! tmux has-session -t "$session_name" 2>/dev/null; then
    tmux new-session -d -s "$session_name" -n "gateway" \; \
         send-keys "$nvim_cmd" C-m \; \
         split-window -h -p 20
  fi
  tmux attach-session -t "$session_name"
fi
