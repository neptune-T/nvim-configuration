local M = {}

function M.setup()
  -- 导入 nvim-autopairs 安全地
  local autopairs_setup, autopairs = pcall(require, "nvim-autopairs")
  if not autopairs_setup then
    return
  end

  -- 配置 autopairs
  autopairs.setup({
    check_ts = true, -- 启用 treesitter
    ts_config = {
      lua = { "string" }, -- 在 lua 字符串 treesitter 节点中不添加对
      javascript = { "template_string" }, -- 在 javascript template_string treesitter 节点中不添加对
      java = false, -- 不在 java 中检查 treesitter
    },
  })

  -- 安全地导入 nvim-autopairs completion 功能
  local cmp_autopairs_setup, cmp_autopairs = pcall(require, "nvim-autopairs.completion.cmp")
  if not cmp_autopairs_setup then
    return
  end

  -- 安全地导入 nvim-cmp 插件（补全插件）
  local cmp_setup, cmp = pcall(require, "cmp")
  if not cmp_setup then
    return
  end

  -- 使 autopairs 和补全插件协同工作
  cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
end

return M

