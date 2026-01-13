vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "

vim.opt.swapfile = false

-- vim.wo.number = true
vim.wo.relativenumber = true

-- Automatically reload files then an external change is detected
vim.o.autoread = true

-- Case insensitive search unless a capital letter is used
vim.o.ignorecase = true
vim.o.smartcase = true

-- Navigate vim panes better
vim.keymap.set("n", "<c-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>")

-- Move and center cursor vertically
vim.keymap.set("n", "<c-d>", "<c-d>zz")
vim.keymap.set("n", "<c-u>", "<c-u>zz")
vim.keymap.set("n", "G", "Gzz")

-- Clear highlighted words
vim.keymap.set("n", "<leader>/", ":nohlsearch<CR>")

-- Move selected lines up and down in visual mode
vim.keymap.set("v", "J", ":m'>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m'<-2<CR>gv=gv")

-- Shortcut to copy line for consistency with Copy to OS clipboard below
vim.keymap.set("n", "Y", "yy")

-- Copy to OS clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Delete without yanking into register
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- Paste over selection without losing register
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Navigate quick fixes and center cursor vertically
vim.keymap.set("n", "[q", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "]q", "<cmd>cnext<CR>zz")

-- Open sessionizer
vim.keymap.set("n", "<c-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
