# NeoVim Keymaps

This document outlines the custom keybindings configured in this NeoVim setup. The leader key is set to `Space`.

## Global & Window Management

| Keybinding      | Mode   | Description                                       |
| :-------------- | :----- | :------------------------------------------------ |
| `<C-h>`         | Normal | Navigate to the pane on the left (Vim or Tmux)    |
| `<C-j>`         | Normal | Navigate to the pane below (Vim or Tmux)          |
| `<C-k>`         | Normal | Navigate to the pane above (Vim or Tmux)          |
| `<C-l>`         | Normal | Navigate to the pane on the right (Vim or Tmux)   |
| `<C-\>`        | Normal | Navigate to the previously active Tmux pane       |
| `<leader>/`     | Normal | Clear search highlight                            |
| `<C-n>`         | Normal | Toggle file explorer (Neo-tree)                   |
| `<leader>bf`    | Normal | Show open buffers in a floating window            |

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
| `<leader><leader>` | Normal | Show previously opened files              |
| `<C-e>`         | Normal | List diagnostics (errors, warnings)       |
| `<C-b>`         | Normal | Show git status                           |
| `<leader>gs`    | Normal | List git stashes                          |

## Git Integration

| Keybinding   | Mode   | Description                     |
| :----------- | :----- | :------------------------------ |
| `<leader>gp` | Normal | Preview hunk (GitSigns)         |
| `<leader>gb` | Normal | Toggle line blame (GitSigns)    |

## LSP (Language Server Protocol)

| Keybinding   | Mode   | Description                               |
| :----------- | :----- | :---------------------------------------- |
| `K`          | Normal | Show documentation for symbol under cursor|
| `<leader>gd` | Normal | Go to definition                          |
| `<leader>gr` | Normal | List references                           |
| `<leader>ca` | Normal | Show code actions                         |
| `<leader>ff` | Normal | Format code                               |

## Completion (Insert Mode)

| Keybinding  | Mode   | Description                 |
| :---------- | :----- | :-------------------------- |
| `<C-Space>` | Insert | Trigger completion menu     |
| `<CR>`      | Insert | Confirm selected completion |
| `<C-e>`     | Insert | Abort completion            |
| `<C-b>`     | Insert | Scroll documentation up     |
| `<C-f>`     | Insert | Scroll documentation down   |

## Testing

| Keybinding   | Mode   | Description                       |
| :----------- | :----- | :-------------------------------- |
| `<leader>t`  | Normal | Run the nearest test              |
| `<leader>T`  | Normal | Run all tests in the current file |
| `<leader>ts` | Normal | Run the entire test suite         |
| `<leader>l`  | Normal | Run the last test                 |
| `<leader>g`  | Normal | Go to the test file               |
