-- vimtex.lua
vim.g.vimtex_view_method = "zathura" -- 设置 Zathura 作为 PDF 查看器
vim.g.vimtex_compiler_method = "latexmk" -- 使用 latexmk 作为编译器
vim.g.vimtex_quickfix_mode = 0 -- 设置快速修复模式

-- 自动折叠
vim.g.vimtex_fold_enabled = 1

-- 启用语法高亮
vim.g.vimtex_syntax_enabled = 1

-- 启用连续模式和转发搜索
vim.g.vimtex_view_general_viewer = "zathura"
vim.g.vimtex_view_general_options = "--unique file:@pdf#src:@line@tex"
vim.g.vimtex_view_general_options_latexmk = "--unique"

-- 启用反向搜索
vim.g.vimtex_view_reverse_search_edito = "nvr"
vim.g.vimtex_view_reverse_search_edito = "nvr --remote-silent +%{line} %{input}"

--
