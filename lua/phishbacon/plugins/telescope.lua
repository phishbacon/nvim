local utils = require("phishbacon.utils")
local desc = utils.desc_with_prefix("Telescope")

vim.pack.add({
  "https://github.com/nvim-telescope/telescope.nvim",
  "https://github.com/nvim-telescope/telescope-ui-select.nvim",
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/nvim-telescope/telescope-live-grep-args.nvim",
})

local telescope = require("telescope")
local lga_actions = require("telescope-live-grep-args.actions")

telescope.setup({
  defaults = {
    cache_picker = {
      num_pickers = 5
    }
  },
  -- pickers = {
  --   find_files = {
  --     theme = "ivy"
  --   },
  --   live_grep = {
  --     theme = "ivy"
  --   },
  --   help_tags = {
  --     theme = "ivy"
  --   },
  -- },
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_dropdown({})
    },
    live_grep_args = {
      auto_quoting = true,
      mappings = {
        i = {
          ["<C-k>"] = lga_actions.quote_prompt(),
          ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
          ["<C-space>"] = lga_actions.to_fuzzy_refine,
        }
      },
      -- theme = "dropdown",
    }
  },
})

telescope.load_extension("ui-select")
telescope.load_extension("live_grep_args")

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, desc("find files"))
vim.keymap.set("n", "<leader>fg", builtin.live_grep, desc("live grep"))
vim.keymap.set("n", "<leader>fb", builtin.buffers, desc("buffers"))
vim.keymap.set("n", "<leader>fh", builtin.help_tags, desc("help tags"))
vim.keymap.set("n", "<leader>fn",
  function()
    builtin.find_files({
      cwd = vim.fn.stdpath("config")
    })
  end,
  desc("find in nvim config"))
vim.keymap.set("n", "<leader>fp",
  function()
    builtin.find_files({
      ---@diagnostic disable-next-line: param-type-mismatch
      cwd = vim.fs.joinpath(vim.fn.stdpath("data"), "site", "pack", "core", "opt")
    })
  end,
  { desc = "Telescope find in nvim data" })
vim.keymap.set("n", "<leader>fl", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>",
  desc("live grep args"))
