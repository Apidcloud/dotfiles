# NeoVim Keymaps

This document outlines the custom keybindings configured in this NeoVim setup. The leader key is set to `Space`.

## Global & Window Management

| Keybinding      | Mode   | Description                                       |
| :-------------- | :----- | :------------------------------------------------ |
| `<C-h>`         | Normal | Navigate to the pane on the left (Vim or Tmux)    |
| `<C-j>`         | Normal | Navigate to the pane below (Vim or Tmux)          |
| `<C-k>`         | Normal | Navigate to the pane above (Vim or Tmux)          |
| `<C-l>`         | Normal | Navigate to the pane on the right (Vim or Tmux)   |
| `<C-x> + H`     | Normal | Resize tmux pane left                             |
| `<C-x> + J`     | Normal | Resize tmux pane down                             |
| `<C-x> + K`     | Normal | Resize tmux pane up                               |
| `<C-x> + L`     | Normal | Resize tmux pane right                            |
| `<C-\>`         | Normal | Navigate to the previously active Tmux pane       |
| `<leader>/`     | Normal | Clear search highlight                            |
| `<C-e>`         | Normal | Show diagnostics (errors, warnings)               |

## Editing

| Keybinding | Mode           | Description                       |
| :--------- | :------------- | :-------------------------------- |
| `J`        | Visual         | Move selected lines down          |
| `K`        | Visual         | Move selected lines up            |
| `Y`        | Normal         | Copy current line                 |
| `<leader>y`| Normal, Visual | Copy to OS clipboard              |
| `<leader>Y`| Normal         | Copy current line to OS clipboard |

## Neo-tree (File Explorer)

| Keybinding   | Mode   | Description                                        |
| :----------- | :----- | :------------------------------------------------- |
| `<C-n>`      | Normal | Show/select file explorer                          |
| `<leader>bf` | Normal | Show open buffers in a floating window             |
| `of`         | Normal | (In Neo-tree window) Open file/directory in Finder |

## Harpoon (File Bookmarking)

| Keybinding   | Mode   | Description                     |
| :----------- | :----- | :------------------------------ |
| `<leader>h`  | Normal | Show Harpoon file list          |
| `<leader>a`  | Normal | Add current file to Harpoon     |
| `<leader>1`  | Normal | Navigate to Harpoon file 1      |
| `<leader>2`  | Normal | Navigate to Harpoon file 2      |
| `<leader>3`  | Normal | Navigate to Harpoon file 3      |
| `<leader>4`  | Normal | Navigate to Harpoon file 4      |
| `<leader>[`  | Normal | Navigate to previous Harpoon file |
| `<leader>]`  | Normal | Navigate to next Harpoon file   |

## Telescope (Fuzzy Finder)

| Keybinding      | Mode   | Description                               |
| :-------------- | :----- | :---------------------------------------- |
| `<C-p>`         | Normal | Find files                                |
| `<leader>fg`    | Normal | Live grep for a string in the project     |
| `<leader>fs`     | Normal | List document symbols                     |
| `<leader><leader>` | Normal | Show previously opened files              |

## Git Integration

| Keybinding   | Mode   | Description                     |
| :----------- | :----- | :------------------------------ |
| `<C-b>`      | Normal | List git status with preview    |
| `<leader>gS` | Normal | List git stashes with preview   |
| `<leader>gP` | Normal | Show current buffer git diff    |
| `<leader>gp` | Normal | Preview hunk                    |
| `<leader>gs` | Normal | Stage/Unstage hunk              |
| `<leader>gb` | Normal | Toggle line blame               |
| `<leader>gB` | Normal | Blame                           |

## LSP (Language Server Protocol)

| Keybinding   | Mode   | Description                               |
| :----------- | :----- | :---------------------------------------- |
| `K`          | Normal | Show documentation for symbol under cursor|
| `KK`         | Normal | Pressing K again will enter the docs menu |
| `gx`         | Normal | Open external link (e.g., mdn docs)       |
| `<leader>gd` | Normal | Go to definition                          |
| `<leader>gi` | Normal | Go to implementation                      |
| `<leader>gr` | Normal | Show List of references                   |
| `<leader>ca` | Normal | Show code actions                         |
| `<leader>rn` | Normal | Rename symbol                             |
| `<leader>ff` | Normal | Format code                               |
| `]d`         | Normal | Go to next diagnostic                     |
| `[d`         | Normal | Go to previous diagnostic                 |

## Quickfix

| Keybinding | Mode   | Description                        |
| :--------- | :----- | :--------------------------------- |
| `]q`       | Normal | Go to next quickfix item           |
| `[q`       | Normal | Go to previous quickfix item       |

## Completion (Insert Mode)

| Keybinding  | Mode   | Description                 |
| :---------- | :----- | :-------------------------- |
| `<C-Space>` | Insert | Trigger completion menu     |
| `<CR>`      | Insert | Confirm selected completion |
| `<Tab>`     | Insert | Confirm selected completion |
| `<C-e>`     | Insert | Abort completion            |
| `<C-u>`     | Insert | Scroll documentation up     |
| `<C-d>`     | Insert | Scroll documentation down   |

## Testing

| Keybinding   | Mode   | Description                       |
| :----------- | :----- | :-------------------------------- |
| `<leader>t`  | Normal | Run the nearest test              |
| `<leader>T`  | Normal | Run all tests in the current file |
| `<leader>ts` | Normal | Run the entire test suite         |
| `<leader>l`  | Normal | Run the last test                 |
| `<leader>g`  | Normal | Go to the test file               |

## UndoTree

| Keybinding | Mode   | Description       |
| :--------- | :----- | :---------------- |
| `<leader>u`| Normal | Toggle UndoTree   |

## Tmux Sessionizer
| Keybinding | Mode   | Description       |
| :--------- | :----- | :---------------- |
| `<C-f>`    | Normal | Open Sessionizer  |

## Git-open
| Keybinding | Mode   | Description                      |
| :--------- | :----- | :--------------------------------|
| `<C-g>`    | Normal | Open Repo (branch) in the browser|
