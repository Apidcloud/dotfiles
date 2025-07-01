vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "

vim.opt.swapfile = false

-- vim.wo.number = true
vim.wo.relativenumber = true

-- Navigate vim panes better
vim.keymap.set("n", "<c-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>")

-- clear highlighted words
vim.keymap.set("n", "<leader>/", ":nohlsearch<CR>")

-- Move selected lines up and down in visual mode
vim.keymap.set('v', 'J', ":m'>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m'<-2<CR>gv=gv")

