-- ALE.lua
-- 启用 ALE
vim.g.ale_enabled = 1

-- 实时语法检查
vim.g.ale_lint_on_text_changed = "always"
vim.g.ale_lint_on_insert_leave = 1

-- 显示错误和警告的标记
vim.g.ale_sign_error = ">>"
vim.g.ale_sign_warning = "--"

-- 显示虚拟文本错误信息
vim.g.ale_virtualtext_cursor = 1

-- 配置特定语言的 linters
vim.g.ale_linters = {
  python = { "flake8", "mypy" },
  -- 你可以在这里为其他语言添加 linters
}

-- 自动修复功能
vim.g.ale_fix_on_save = 1

-- 其他配置...
