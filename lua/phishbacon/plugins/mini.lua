local utils = require("phishbacon.utils")

vim.pack.add({ "https://github.com/echasnovski/mini.nvim" })

require("mini.statusline").setup()
require("mini.comment").setup()
require("mini.pairs").setup()
require("mini.tabline").setup()

utils.autocmd("FileType", {
  desc = "Disable mini.statusline in nvim-tree",
  group = utils.augroup("statusline", { clear = true }),
  pattern = "NvimTree",
  callback = function()
    vim.b.ministatusline_disable = true
  end
})
