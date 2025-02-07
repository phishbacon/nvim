local set = vim.keymap.set
vim.g.mapleader = " "

set("v", "K", ":m '<-2<CR>gv=gv")
set("v", "J", ":m '>+1<CR>gv=gv")
set("n", "<C-j>", "<CMD>wincmd j<CR>")
set("n", "<C-k>", "<CMD>wincmd k<CR>")
set("n", "<C-h>", "<CMD>wincmd h<CR>")
set("n", "<C-l>", "<CMD>wincmd l<CR>")
set("n", "<leader><leader>x", "<CMD>source %<CR>", { desc = "Source the current file" })
set("n", "<leader>x", ":.lua<CR>", { desc = "Execute line" })
set("v", "<leader>x", ":lua<CR>", { desc = "Execute selection" })
set("n", "<C-n>", "<CMD>cnext<CR>")
set("n", "<C-p>", "<CMD>cprev<CR>")
set("n", "<C-c>", "<CMD>cclose<CR>")
set("n", "<leader>fm", vim.lsp.buf.format, { desc = "Format buffer" })
