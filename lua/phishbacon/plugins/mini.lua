return {
  "echasnovski/mini.nvim",
  version = false,
  config = function()
    require("mini.statusline").setup()
    require("mini.comment").setup()
    require("mini.pairs").setup()
    require("mini.tabline").setup()
  end
}
