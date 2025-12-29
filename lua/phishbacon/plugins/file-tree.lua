local utils = require("phishbacon.utils")

vim.pack.add({
  "https://github.com/stevearc/oil.nvim",
  "https://www.github.com/nvim-tree/nvim-tree.lua",
  "https://github.com/nvim-tree/nvim-web-devicons"
})

require("oil").setup({
  columns = { "icon" },
  default_file_explorer = false,
  view_options = {
    show_hidden = true,
  },
  vim.keymap.set("n", "<leader>eo", "<CMD>Oil " .. vim.fn.getcwd() .. "<CR>", { desc = "Oil: Open project directory" }),
})

local function nvim_tree_on_attach(bufnr)
  local api = require("nvim-tree.api")

  -- local function opts(desc)
  --   return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  -- end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)
end

require("nvim-tree").setup({
  on_attach = nvim_tree_on_attach,
  view = {
    side = "right"
  },
  update_focused_file = {
    enable = true,
    update_root = false,
  },
  vim.keymap.set("n", "<leader>to", "<CMD>NvimTreeToggle<CR>", { desc = "nvim-tree: toggle" }),
})

utils.autocmd("FileType", {
  desc = "Remove eob characters from nvim-tree buffer",
  group = utils.augroup("NvimTreeGroup", { clear = false }),
  pattern = "NvimTree",
  callback = function()
    vim.opt_local.fillchars:append({ eob = " " })
  end
})
