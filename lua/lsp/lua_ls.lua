-- 定义一个基本的 on_attach 函数
local function on_attach(client, bufnr)
  -- 这里可以定义当 LSP 服务器连接后的行为，比如键绑定
  -- 例如：vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', {noremap = true, silent = true})
end

-- 配置 Lua 语言服务器
require'lspconfig'.lua_ls.setup {
  cmd = { '/path/to/lua-language-server' }, -- Lua 语言服务器的可执行文件路径，需要替换为实际路径
  on_attach = on_attach,
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT', -- 使用 LuaJIT
        path = vim.split(package.path, ';'), -- 使用 Vim 的 Lua 路径
      },
      diagnostics = {
        enable = true,
        globals = { 'vim' }, -- 全局变量
      },
      workspace = {
        library = {
          [vim.fn.expand('$VIMRUNTIME/lua')] = true, -- 添加 Vim Lua 标准库
        },
      },
    },
  },
}

-- 配置 LSP 完成项图标
local lsp = require'lspconfig'
local protocol = require'vim.lsp.protocol'

protocol.CompletionItemKind = {
  '', -- 文本
  'ƒ', -- 函数
  '', -- 模块
  '⌘', -- 方法
  '', -- 属性
  '里', -- 变量
  '', -- 类型
  '', -- 参考
}

-- 移除了与 completion 模块相关的部分

