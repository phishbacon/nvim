local config_path = vim.fn.stdpath("config")
local plugin_path = "/lua/phishbacon/plugins"

for name, type in vim.fs.dir(config_path .. plugin_path) do
  if type == "file" and name:sub(-4) == ".lua" and name ~= "init.lua" then
    local plugin = "phishbacon.plugins." .. name:gsub("%.lua$", "")
    require(plugin)
  end
end
