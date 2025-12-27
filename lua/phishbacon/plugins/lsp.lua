require("phishbacon.utils").create_install_update_hook("LuaSnip", { "make", "install_jsregexp" })

vim.pack.add({
  "https://www.github.com/mason-org/mason.nvim",
  "https://www.github.com/mason-org/mason-lspconfig.nvim",
  "https://www.github.com/hrsh7th/cmp-nvim-lsp",
  "https://www.github.com/hrsh7th/cmp-buffer",
  "https://www.github.com/hrsh7th/cmp-path",
  "https://www.github.com/hrsh7th/cmp-cmdline",
  "https://www.github.com/hrsh7th/nvim-cmp",
  "https://www.github.com/L3MON4D3/LuaSnip",
  "https://www.github.com/saadparwaiz1/cmp_luasnip",
  "https://www.github.com/neovim/nvim-lspconfig",
  "https://www.github.com/folke/lazydev.nvim",
  "https://www.github.com/rafamadriz/friendly-snippets",
})

require("lazydev").setup({
  library = {
    { path = "${3rd}/luv/library", words = { "vim%.uv" } },
    { path = vim.env.VIMRUNTIME,   words = { "vim" } },
  }
})

local cmp = require("cmp")
local cmp_nvim_lsp = require("cmp_nvim_lsp")
local capabilities = vim.tbl_deep_extend(
  "force",
  {},
  vim.lsp.protocol.make_client_capabilities(),
  cmp_nvim_lsp.default_capabilities()
)
require("mason").setup();
require("mason-lspconfig").setup({
  ensure_installed = {
    "clangd",
    "lua_ls",
    "eslint",
    "ts_ls",
    "bashls",
    "svelte",
    "marksman"
  },
  automatic_installation = true,
  handlers = {
    function(server_name)
      vim.lsp.config(server_name, { capabilities = capabilities })
      vim.lsp.enable(server_name)
    end
  }
})

local cmp_select = { behavior = cmp.SelectBehavior.Select }

cmp.setup({
  snippet = {
    expand = function(args)
      require 'luasnip'.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
    ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
    ["<C-c>"] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "buffer" },
  }),
})

cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  }),
  ---@diagnostic disable-next-line: missing-fields
  matching = { disallow_symbol_nonprefix_matching = false }
})

vim.diagnostic.config({
  float = {
    focusable = false,
    style = "minimal",
    border = "rounded",
    ---@diagnostic disable-next-line: assign-type-mismatch
    source = "always",
    header = "",
    prefix = "",
  }
})
