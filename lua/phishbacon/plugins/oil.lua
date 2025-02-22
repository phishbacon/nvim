return {
  "stevearc/oil.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons"},
  config = function ()
    require("oil").setup({
      columns = { "icon" },
      view_options = {
        show_hidden = true,
      },
      vim.keymap.set("n", "<leader>ep", "<CMD>Oil " .. vim.fn.getcwd() .. "<CR>", { desc = "Open parent directory"} ),
    })
  end,
}
