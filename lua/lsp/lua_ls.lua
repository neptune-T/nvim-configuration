-- 配置 lua-ls 插件
require'lspconfig'.sumneko_lua.setup {
  cmd = { '/path/to/lua-language-server' }, -- Lua 语言服务器的可执行文件路径
  on_attach = require'lsp'.common_on_attach, -- 共享的 LSP 配置
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

-- 配置 LSP 插件通用的设置
local lsp = require'lspconfig'
local protocol = require'vim.lsp.protocol'

lsp.protocol.CompletionItemKind = {
  '', -- 文本
  'ƒ', -- 函数
  '', -- 模块
  '⌘', -- 方法
  '', -- 属性
  '里', -- 变量
  '', -- 类型
  '', -- 参考
}

-- 可选：配置自动触发 LSP 功能
vim.cmd[[autocmd BufEnter *.lua lua require'completion'.on_attach()]]

