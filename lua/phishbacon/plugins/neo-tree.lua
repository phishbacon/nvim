return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("neo-tree").setup({
      vim.keymap.set("n", "<leader>eb", "<CMD>Neotree toggle right<CR>", { desc = "Open file tree for parent directory" }),
    })
  end
}
