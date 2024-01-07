-- 定义一个基本的 on_attach 函数
local function on_attach(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- 启用补全时的文档悬浮窗口
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- 示例键绑定
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', {noremap = true, silent = true})
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', {noremap = true, silent = true})
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', {noremap = true, silent = true})
end

-- 配置 Lua 语言服务器
require'lspconfig'.sumneko_lua.setup {
  cmd = { '/path/to/lua-language-server' }, -- 替换为您的 Lua 语言服务器路径
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

-- 可选：配置补全插件（如果您使用了补全插件，例如 nvim-cmp）
-- 请根据您的补全插件文档添加相关配置

