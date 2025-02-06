return {
  "echasnovski/mini.nvim",
  version = false,
  config = function()
    require("mini.statusline").setup()
    require("mini.comment").setup()
    require("mini.pairs").setup()
    require("mini.indentscope").setup({
      draw = {
        delay = 0
      }
    })
    require("mini.tabline").setup({
      vim.api.nvim_create_autocmd("Filetype", {
        pattern = "neo-tree",
        group = vim.api.nvim_create_augroup("FiletypeGroup", { clear = true }),
        callback = function(args)
          vim.b[args.buf].ministatusline_disable = true
        end
      })
    })
  end
}
