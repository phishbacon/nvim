return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require("tokyonight").setup({
        style = "night",
        on_highlights = function(highlights, colors)
          highlights.EndOfBuffer = {
            fg = colors.comment,
          }
          local autocmd = vim.api.nvim_create_autocmd
          local augroup = vim.api.nvim_create_augroup

          autocmd("Filetype", {
            desc = "Hide eob in neo-tree",
            group = augroup("tokyonight", { clear = true }),
            pattern = "neo-tree",
            callback = function()
              vim.api.nvim_set_hl(0, "EndOfBuffer", { fg = colors.bg_dark })
            end
          })
        end,
      })
      vim.cmd [[colorscheme tokyonight]]
    end,
  },
  {
    "bluz71/vim-moonfly-colors",
    name = "moonfly",
    lazy = false,
    priority = 1000,
    -- config = function()
    --   vim.cmd [[colorscheme moonfly]]
    -- end
  },
  {
    'ray-x/aurora',
    init = function()
      vim.g.aurora_italic = 1
      vim.g.aurora_transparent = 1
      vim.g.aurora_bold = 1
    end,
    -- config = function()
    --   vim.cmd.colorscheme "aurora"
    --   -- override defaults
    --   vim.api.nvim_set_hl(0, '@number', { fg = '#e933e3' })
    -- end
  }
}
