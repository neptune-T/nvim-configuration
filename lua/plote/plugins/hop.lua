local M = {}

function M.setup()
    local status_ok, hop = pcall(require, "hop")
    if not status_ok then
        print("Failed to load Hop")
        return
    end

   
    hop.setup({
        -- 可以在这里添加任何需要的配置
        -- 例如:

    })
end

return M

