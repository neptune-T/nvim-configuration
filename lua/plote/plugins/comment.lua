-- 导入 Comment 插件
local status, comment = pcall(require, "Comment")
if not status then
  return
end

-- 导入 ts_context_commentstring
local comment_string = require("ts_context_commentstring")

-- 配置 Comment
comment.setup({
    toggler = {
        line = "gcc", -- 切换行注释
        block = "gCC", -- 切换块注释
    },
    opleader = {
        line = "gc", -- 可视模式下的行注释
        block = "gC", -- 可视模式下的块注释
    },
    extra = {
        above = "gcO", -- 在当前行上方新增行注释
        below = "gco", -- 在当前行下方新增行注释
        eol = "gcA", -- 在当前行行尾新增行注释
    },
    pre_hook = function(ctx)
        -- 只对特定文件类型计算注释字符串
        if vim.bo.filetype == "typescriptreact" then
            local U = require("Comment.utils")
            local type = ctx.ctype == U.ctype.line and "__default" or "__multiline"
            local location = nil
            if ctx.ctype == U.ctype.block then
                location = comment_string.utils.get_cursor_location()
            elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
                location = comment_string.utils.get_visual_start_location()
            end
            return comment_string.calculate_commentstring({
                key = type,
                location = location
            })
        end
    end
})

