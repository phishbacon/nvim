return {
  { "nvim-telescope/telescope-ui-select.nvim" },
  {
    "nvim-telescope/telescope.nvim",
    tag = "v0.2.0",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-live-grep-args.nvim",
    },
    config = function()
      require("telescope").setup({
        defaults = {
          cache_picker = {
            num_pickers = 5
          }
        },
        pickers = {
          find_files = {
            theme = "dropdown"
          },
          live_grep = {
            theme = "dropdown"
          },
          help_tags = {
            theme = "dropdown"
          },
        },
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({})
          },
          live_grep_args = {
            auto_quoting = true,
            mappings = {
              i = {
                ["<C-k>"] = require("telescope-live-grep-args.actions").quote_prompt(),
                ["<C-i>"] = require("telescope-live-grep-args.actions").quote_prompt({postfix = " --iglob "}),
                ["<C-space>"] = require("telescope-live-grep-args.actions").to_fuzzy_refine,
              }
            },
            theme = "dropdown",
          }
        },
      })

      require("telescope").load_extension("ui-select")
      require("telescope").load_extension("live_grep_args")

      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
      vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
      vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
      vim.keymap.set("n", "<leader>fn",
        function()
          builtin.find_files({
            cwd = vim.fn.stdpath("config")
          })
        end,
        { desc = "Telescope find in nvim config" })
      vim.keymap.set("n", "<leader>fp",
        function()
          builtin.find_files({
            ---@diagnostic disable-next-line: param-type-mismatch
            cwd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy")
          })
        end,
        { desc = "Telescope find in nvim data" })
      vim.keymap.set("n", "<leader>fl", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")
    end
  },
}
