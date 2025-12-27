vim.pack.add({ "https://github.com/echasnovski/mini.nvim" })

require("mini.statusline").setup()
require("mini.comment").setup()
require("mini.pairs").setup()
require("mini.tabline").setup()

local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

autocmd("FileType", {
  desc = "Disable mini.statusline in neo-tree",
  group = augroup("statusline", { clear = true }),
  pattern = "neo-tree",
  callback = function()
    vim.b.ministatusline_disable = true
  end
})
