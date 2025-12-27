vim.pack.add({ "https://www.github.com/tpope/vim-fugitive" })

vim.keymap.set("n", "<leader>gg", vim.cmd.Git, { desc = "Launch Git" })
