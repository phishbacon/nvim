vim.pack.add({ "https://github.com/nvim-treesitter/nvim-treesitter" })

local ts = require("nvim-treesitter")
if vim.fn.exists(":TSUpdate") == 2 then
  vim.cmd("TSUpdate")
end

ts.install({ "c", "lua", "vimdoc", "javascript", "typescript", "bash", "svelte", "markdown" })
local group = vim.api.nvim_create_augroup("TreesitterAttach", { clear = true })
vim.api.nvim_create_autocmd('FileType', {
  group = group,
  pattern = { "*" },
  callback = function(args)
    local fileType = args.match
    local buf = args.buf

    local lang = vim.treesitter.language.get_lang(fileType) or fileType

    pcall(vim.treesitter.start, buf, lang)

    vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
    vim.wo[0][0].foldmethod = "expr"
    vim.wo[0][0].foldlevel = 99

    ts.install({ lang })
  end,
})
-- require("nvim-treesitter.config").setup({
--   sync_install = false,
--   auto_install = true,
--   indent = { enable = true },
--   highlight = {
--     enable = true,
--     ---@diagnostic disable-next-line: unused-local
--     disable = function(lang, buf)
--       local max_filesize = 100 * 1024 -- 100 KB
--       local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
--       if ok and stats and stats.size > max_filesize then
--         vim.notify(
--           "File larger than 100KB, treesitter disabled for performance",
--           vim.log.levels.WARN,
--           { title = "Treesitter" }
--         )
--         return true
--       end
--     end,
--     additional_vim_regex_highlighting = false,
--   },
-- })
