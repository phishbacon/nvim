return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  ---@module "ibl"
  ---@type ibl.config
  opts = {},
  config = function()
    require("ibl").setup()
    local onConfig = require("ibl.config").config
    if onConfig then
      print(onConfig.indent.char)
    end
    local offConfig = {
      indent = {
        char = "",
      },
    }
    local update = require("ibl").update
    vim.keymap.set("n", "<leader>st", function()
      local config = require("ibl.config").config
      if config and onConfig and config.indent.char ~= "" then
        update(offConfig)
      elseif config and onConfig then
        update(onConfig)
      end
    end, { desc = "Toggle indent characters" })
  end
}
