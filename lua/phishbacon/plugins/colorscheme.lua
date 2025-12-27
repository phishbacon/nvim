vim.pack.add({"https://github.com/loctvl842/monokai-pro.nvim"})

require("monokai-pro").setup({
  filter = "classic",
  transparent_background = false,
  terminal_colors = true,

  override = function (c)
    return {
      IndentBlanklineChar = { fg = c.base.dimmed4 },
      Whitespace = { fg = c.base.dimmed4 },
      NonText = { fg = c.base.dimmed4 },
      OilDir = { fg = c.base.green }
    }
  end,
  overridePalette = function(filter)
    if filter == "classic" then
      return {
        dark1 = "#2B2B2B",
        dark2 = "#2B2B2B",
        background = "#000000"
      }
    end
  end
})
vim.cmd([[colorscheme monokai-pro]])
