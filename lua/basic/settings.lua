-- 设定各种文本的字符编码
vim.o.encoding = "utf-8"
-- 设定在无操作时，交换文件刷写到磁盘的等待毫秒数（默认为 4000）
vim.o.updatetime = 100
-- 设定等待按键时长的毫秒数
vim.o.timeoutlen = 500
-- 是否在屏幕最后一行显示命令
vim.o.showcmd = true
-- 是否允许缓冲区未保存时就切换
vim.o.hidden = true
-- 是否开启 xterm 兼容的终端 24 位色彩支持
vim.o.termguicolors = true
-- 是否高亮当前文本行
vim.o.cursorline = true
-- 是否开启语法高亮
vim.o.syntax = "enable"
-- 是否显示绝对行号
vim.o.number = true
-- 是否显示相对行号
vim.o.relativenumber = true
-- 设定光标上下两侧最少保留的屏幕行数
vim.o.scrolloff = 10
-- 是否支持鼠标操作 a是启用 c是禁用
vim.o.mouse = "a"
-- 是否启用系统剪切板
--vim.o.clipboard = "unnamedplus"
-- 是否开启备份文件
vim.o.backup = false
-- 是否开启交换文件
vim.o.swapfile = false
-- 设定自动缩进的策略为 plugin
vim.o.filetype = "plugin"
-- 是否开启高亮搜索
vim.o.hlsearch = true
-- 是否在插入括号时短暂跳转到另一半括号上
vim.o.showmatch = true
-- 是否开启命令行补全
vim.o.wildmenu = true
-- 是否在搜索时忽略大小写
vim.o.ignorecase = true
-- 是否随着键入即时搜索
vim.o.incsearch = true
-- 是否开启在搜索时如果有大写字母，则关闭忽略大小写的选项
vim.o.smartcase = true
-- 是否开启单词拼写检查
vim.o.spell = true
-- 设定单词拼写检查的语言
vim.o.spelllang = "en_us,cjk"
-- 是否开启代码折叠
vim.o.foldenable = true
-- 指定代码折叠的策略是按照缩进进行的
vim.o.foldmethod = "indent"    -- indent syntax
-- 指定代码折叠的最高层级为 100
vim.o.foldlevel = 100
--是否开启真色  -1-是关闭真色
--vim.g.spacevim_enable_guicolors = 1
-- 是否开启自动缩进
vim.o.autoindent = true
-- 是否将 tab 替换为 space
vim.o.expandtab = false
-- 一个 tab 占用几个 space
vim.o.tabstop = 4
-- 换行或 >> << 缩进时的 space 数量
vim.o.shiftwidth = 4
-- tab 和 space 的混合，和上面 2 个设置成相同即可
vim.o.softtabstop = 4
-- 是否特殊显示空格等字符
vim.o.list = true
vim.opt.listchars:append("space:⋅")
--vim.opt.listchars:append("eol:↴")
-- 自动缩进的策略为 plugin 目录 ~/.config/nvim/ftplugin
-- 目录中新建不同语言的缩进规则文件 
-- 定义新的规则会覆盖上述全局缩进规则 如vim.o.tabstop = 4
vim.o.filetype = "plugin"
-- 是否透明背景
vim.g.background_transparency = false
-- 自动识别UNIX格式和MS-DOS格式
-- vim.o.fileformats=unix,dos
-- 如果你想把文章按照unix或者dos显示和保存请命令模式使用
-- :set ff=unix 或者 set ff=dos
-- 如果想按照unix方式显示请在命令模式使用（dos）同理
-- :e ++ff=unix %
-- 显示当前文档格式 :set ff
