-- 尝试安全导入 null-ls 插件
local setup, null_ls = pcall(require, "null-ls")
if not setup then
  print("Failed to load null-ls")
  return
end

-- 确保 null_ls 是一个模块
if type(null_ls) == "table" then
    -- 以下代码只有在 null-ls 成功加载时才会执行
    local formatting = null_ls.builtins.formatting
    local diagnostics = null_ls.builtins.diagnostics

    -- 配置 null_ls
    null_ls.setup({
      sources = {
        formatting.prettier,  -- js/ts formatter
        formatting.stylua,    -- lua formatter
        diagnostics.eslint_d.with({
          condition = function(utils)
            return utils.root_has_file(".eslintrc.js")
          end,
        }),
      },
      -- 设置保存时自动格式化
      on_attach = function(client, bufnr)
        if client.server_capabilities.documentFormattingProvider then
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = vim.api.nvim_create_augroup("Format", { clear = true }),
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.formatting_sync()
            end,
          })
        end
      end,
    })
else
    print("null-ls loaded incorrectly")
end

