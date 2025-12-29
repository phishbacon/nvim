require("phishbacon.options")
require("phishbacon.keymap")
local utils = require("phishbacon.utils")

local desc = utils.desc_with_prefix("Lsp")

utils.autocmd({ "BufLeave", "FocusLost" }, {
  group = utils.augroup("AutoSave", { clear = true }),
  callback = function()
    if vim.bo.modified and not vim.bo.readonly and vim.fn.expand("%") ~= "" then
      vim.cmd("silent write")
    end
  end,
})

if not vim.g.vscode then
  require("phishbacon.plugins")

  utils.autocmd("LspAttach", {
    group = utils.augroup("LspGroup", { clear = true }),
    callback = function(ev)
      local opts = { buffer = ev.buf }
      vim.keymap.set("n", "<leader>gd", function() vim.lsp.buf.definition() end, desc("goto definition"))
      vim.keymap.set("n", "<leader>gh", function() vim.lsp.buf.hover() end, desc("hover"))
      vim.keymap.set("n", "<leader>gf", function() vim.diagnostic.open_float() end, desc("open diagnostic float"))
      vim.keymap.set("n", "<leader>gp", function() vim.lsp.buf.format() end, desc("format buffer"))
      vim.keymap.set("n", "[d", function() vim.diagnostic_goto_next() end, opts)
      vim.keymap.set("n", "]d", function() vim.diagnostic_goto_prev() end, opts)
    end
  })

  utils.autocmd("TextYankPost", {
    desc = "Pretty colors when yanking",
    group = utils.augroup("HighlightGroup", { clear = true }),
    callback = function()
      vim.highlight.on_yank()
    end
  })

  utils.autocmd("BufEnter", {
    group = utils.augroup("CRLFGroup", { clear = true }),
    callback = function()
      if vim.bo.fileformat == 'unix' or vim.bo.fileformat == "mac" then
        vim.cmd("set listchars=eol:↓,tab:→·,extends:>,precedes:<,space:•")
      else
        vim.cmd("set listchars=eol:↴,tab:→·,extends:>,precedes:<,space:•")
      end
    end
  })
end
