local opt = vim.opt

if vim.fn.has("macunix") == 1 or vim.fn.has("unix") == 1 then
  vim.cmd("set listchars=eol:↓,tab:→·,extends:>,precedes:<,space:•")
else
  vim.cmd("set listchars=eol:↴,tab:→·,extends:>,precedes:<,space:•")
end

opt.nu = true
opt.relativenumber = true

opt.expandtab = true
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.swapfile = false

opt.list = true

opt.signcolumn = "yes"
opt.colorcolumn = "80"

opt.wrap = false

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
