-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- 基本配置
require("config.options")
require("config.keymaps")
require("config.autocmds")
require("config.colorscheme")
require("config.settings")

-- 插件配置

-- require("plote.plugins.nvim-tree")

 --require("plote.plugins.nvim-lspconfig").setup()
 --require("plote.plugins.nvim-treesitter").setup()
 --require("plote.plugins.toggleterm").setup()
-- ... 加载其他插件配置

-- LSP 配置
-- require("lsp").setup()  


-- 键位 补充

vim.api.nvim_set_keymap('n', '<Space>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

local plugin_path = vim.fn.stdpath('config')..'/lua/plote/plugins'
vim.opt.runtimepath:append(plugin_path)


