return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter").install({ "c", "lua", "vimdoc", "javascript", "typescript", "bash", "svelte", "markdown"})
    -- require("nvim-treesitter.configs").setup({
    --   ensure_installed = { "c", "lua", "vimdoc", "javascript", "typescript", "bash", "svelte", "markdown" },
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
    --           "File larger than 100KB treesitter disabled for performance",
    --           vim.log.levels.WARN,
    --           { title = "Treesitter" }
    --         )
    --         return true
    --       end
    --     end,
    --     additional_vim_regex_highlighting = false,
    --   },
    -- })
  end
}
