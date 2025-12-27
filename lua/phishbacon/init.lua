require("phishbacon.options")
require("phishbacon.keymap")

if not vim.g.vscode then
  require("phishbacon.plugins")
  local autocmd = vim.api.nvim_create_autocmd
  local augroup = vim.api.nvim_create_augroup

  autocmd("LspAttach", {
    group = augroup("LspGroup", { clear = true }),
    callback = function(args)
      local opts = { buffer = args.buf }
      vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
      vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
      vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, { desc = "List code actions" })
      vim.keymap.set("n", "<leader>dd", function() vim.diagnostic.open_float() end, { desc = "Open diagnostic float" })
      vim.keymap.set("n", "<leader>rr", function() vim.lsp.buf.references() end, { desc = "View references" })
      vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, { desc = "Rename reference" })
      vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
      vim.keymap.set("n", "[d", function() vim.diagnostic_goto_next() end, opts)
      vim.keymap.set("n", "]d", function() vim.diagnostic_goto_prev() end, opts)
    end
  })

  autocmd("TextYankPost", {
    desc = "Pretty colors when yanking",
    group = augroup("HighlightGroup", { clear = true }),
    callback = function()
      vim.highlight.on_yank()
    end
  })

  autocmd("BufEnter", {
    group = augroup("CRLFGroup", { clear = true }),
    callback = function(args)
      if vim.bo[args.buf].fileformat == 'unix' or vim.bo[args.buf].fileformat == "mac" then
        vim.cmd("set listchars=eol:↓,tab:→·,extends:>,precedes:<,space:•")
      else
        vim.cmd("set listchars=eol:↴,tab:→·,extends:>,precedes:<,space:•")
      end
    end
  })
end
