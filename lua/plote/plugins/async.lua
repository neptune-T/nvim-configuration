local M = {}

function M.async_function(callback)
  local co = coroutine.create(function()
    -- Simulate an async task
    local result = "Task completed"
    vim.schedule(function() callback(result) end)
  end)
  coroutine.resume(co)
end

return M

