require("phishbacon.options")
require("phishbacon.keymap")
require("phishbacon.lazy")

local autocmd = vim.api.nvim_create_autocmd

autocmd("LspAttach", {
  callback = function(args)
    local opts = { buffer = args.buf }
    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, { desc = "List Code Actions" })
    vim.keymap.set("n", "<leader>xx", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "<leader>rr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic_goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic_goto_prev() end, opts)
  end
})
