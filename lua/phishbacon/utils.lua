local M = {}

--- @param plugin string Plugin to execute command for on install/update
--- @param cmd string[] Command to execute
function M.create_install_update_hook(plugin, cmd)
  vim.api.nvim_create_autocmd('PackChanged', {
    callback = function(ev)
      -- Use available |event-data|
      local kind = ev.data.kind
      local name = ev.data.spec.name
      local path = ev.data.path

      -- Run build script after plugin's code has changed
      if (ev.data.spec.src:match(plugin) or name == plugin) and (kind == 'install' or kind == 'update') then
        vim.fn.jobstart(cmd, {
          cwd = path,
          stderr_buffered = false,
          stdout_buffered = false,
          on_stdout = function(_, data)
            if data then
              for _, line in ipairs(data) do
                if line ~= "" then print(line) end
              end
            end
          end,
          on_stderr = function(_, data)
            if data then
              for _, line in ipairs(data) do
                if line ~= "" then
                  vim.notify(line, vim.log.levels.WARN)
                end
              end
            end
          end,
          on_exit = function(_, code)
            if code == 0 then
              print("Install hook succeeded for " .. plugin)
            else
              vim.notify("Install hook failed for " .. plugin .. " (exit code " .. code .. ")", vim.log.levels.ERROR)
            end
          end
        })
      end
    end
  })
end

-- If hooks need to run on install, run this before `vim.pack.add()`

return M
