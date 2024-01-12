-- 默认的键位设置函数太长了，所以这里将它们重新引用一下
vim.keybinds = {
    gmap = vim.api.nvim_set_keymap, --vim.keymap.set
    bmap = vim.api.nvim_buf_set_keymap,
    dgmap = vim.api.nvim_del_keymap,
    dbmap = vim.api.nvim_buf_del_keymap,
    opts = {noremap = true, silent = false},
    opts1 = {noremap = true, silent = true}
}
-- 注意 新版nvim可以使用新的映射 如下 但是稳定版本不提供此功能 
-- 后续添加到稳点版本后可以使用此种方式 可同时映射nv两种模式 参见 :h lua
--vim.keymap.set({"n", "v"}, "<S-k>", "5k", vim.keybinds.opts)

-- 重新加载设置
--vim.keybinds.gmap("n", "R", ":source $MYVIMRC<CR>", vim.keybinds.opts)
--vim.keybinds.gmap("v", "R", ":source $MYVIMRC<CR>", vim.keybinds.opts)

-- 插入模下 jk 退出插入模式
vim.keybinds.gmap("i", "jk", "<Esc>", vim.keybinds.opts)

-- 用 H 和 L 代替 ^ 与 $ 快速跳转行首与行尾
vim.keybinds.gmap("n", "H", "^", vim.keybinds.opts)
vim.keybinds.gmap("v", "H", "^", vim.keybinds.opts)
vim.keybinds.gmap("n", "L", "$", vim.keybinds.opts)
vim.keybinds.gmap("v", "L", "$", vim.keybinds.opts)

-- 插入模式下的上下左右移动
vim.keybinds.gmap("i", "<C-k>", "<up>", vim.keybinds.opts)
vim.keybinds.gmap("i", "<C-j>", "<down>", vim.keybinds.opts)
vim.keybinds.gmap("i", "<C-h>", "<left>", vim.keybinds.opts)
vim.keybinds.gmap("i", "<C-l>", "<right>", vim.keybinds.opts)

-- 快速移动光标
-- 向上5行
vim.keybinds.gmap("n", "<S-k>", "5kzz", vim.keybinds.opts)
vim.keybinds.gmap("v", "<S-k>", "5kzz", vim.keybinds.opts)
-- 向下5行
vim.keybinds.gmap("n", "<S-j>", "5jzz", vim.keybinds.opts)
vim.keybinds.gmap("v", "<S-j>", "5jzz", vim.keybinds.opts)
-- 向左
vim.keybinds.gmap("n", "<M-h>", "^zz", vim.keybinds.opts)
vim.keybinds.gmap("v", "<M-h>", "^zz", vim.keybinds.opts)
-- 向右
vim.keybinds.gmap("n", "<M-l>", "$zz", vim.keybinds.opts)
vim.keybinds.gmap("v", "<M-l>", "$zz", vim.keybinds.opts)

-- 全选
vim.keybinds.gmap("n", "<C-a>", "gg<S-v>G", vim.keybinds.opts)

-- 保 存
vim.keybinds.gmap("n", "<C-s>", ":w<CR>", vim.keybinds.opts)
vim.keybinds.gmap("v", "<C-s>", ":w<CR>", vim.keybinds.opts)
vim.keybinds.gmap("i", "<C-s>", "<ESC>:w<CR>", vim.keybinds.opts)

-- 强制退出
--vim.keybinds.gmap("n", "<S-q>", ":q<CR>", vim.keybinds.opts)
--vim.keybinds.gmap("v", "<S-q>", ":q<CR>", vim.keybinds.opts)
vim.keybinds.gmap("n", "qq", ":q<CR>", vim.keybinds.opts)
--vim.keybinds.gmap("v", "qq", ":q<CR>", vim.keybinds.opts)

--选择一整个单词
vim.keybinds.gmap("n", "vw", "vaw", vim.keybinds.opts)

vim.keybinds.gmap("n", "gH", "H", vim.keybinds.opts)
vim.keybinds.gmap("n", "gJ", "J", vim.keybinds.opts)
vim.keybinds.gmap("n", "gK", "K", vim.keybinds.opts)
vim.keybinds.gmap("n", "gL", "L", vim.keybinds.opts)

------------------------------CCPD------------------------------
-------------------------复制-------------------------
vim.keybinds.gmap("n", "s", '"+y', vim.keybinds.opts)
vim.keybinds.gmap("n", "y", '"+y', vim.keybinds.opts)
-- 复制括号里的代码或者复制可视化的代码
vim.keybinds.gmap("n", "<S-y>", '"+yi', vim.keybinds.opts)
vim.keybinds.gmap("v", "<S-y>", '"+y', vim.keybinds.opts)
vim.keybinds.gmap("n", "<S-s>", '"+yi', vim.keybinds.opts)
vim.keybinds.gmap("v", "<S-s>", '"+y', vim.keybinds.opts)
vim.keybinds.gmap("v", "y", '"+y', vim.keybinds.opts)
vim.keybinds.gmap("v", "s", '"+y', vim.keybinds.opts)
-- 直接复制一行
--vim.keybinds.gmap("n", "<C-d>", "yyp", vim.keybinds.opts)
--vim.keybinds.gmap("i", "<C-d>", "<ESC>yyp", vim.keybinds.opts)
-- 复制n行
vim.keybinds.gmap("n", "yy", '"+yy', vim.keybinds.opts)
vim.keybinds.gmap("n", "ss", '"+yy', vim.keybinds.opts)
-- 复制一个单词
vim.keybinds.gmap("n", "yw", '"+yaw', vim.keybinds.opts)
vim.keybinds.gmap("n", "sw", '"+yaw', vim.keybinds.opts)

-------------------------剪切-------------------------
-- 剪切括号里的代码或者剪切可视化的代码
vim.keybinds.gmap("n", "<S-d>", '"+di', vim.keybinds.opts)
vim.keybinds.gmap("v", "<S-d>", '"+d', vim.keybinds.opts)
vim.keybinds.gmap("n", "d", '"+d', vim.keybinds.opts)
vim.keybinds.gmap("v", "d", '"+d', vim.keybinds.opts)
-- 剪切n行
vim.keybinds.gmap("n", "dd", '"+dd', vim.keybinds.opts)
-- 剪切一个单词
vim.keybinds.gmap("n", "dw", '"+daw', vim.keybinds.opts)

-------------------------粘贴-------------------------
--  粘贴功能 小写p是粘贴到下一行 大写P是粘贴到上一行
-- vim.keybinds.gmap("n", "<C-v>", '"+P', vim.keybinds.opts)
-- vim.keybinds.gmap("v", "<C-v>", '"+P', vim.keybinds.opts)
-- vim.keybinds.gmap("i", "<C-v>", '<ESC>"+P', vim.keybinds.opts)

vim.keybinds.gmap("n", "p", '"+]p', vim.keybinds.opts)
vim.keybinds.gmap("n", "P", '"+[P', vim.keybinds.opts)
vim.keybinds.gmap("v", "p", "]pgvy", vim.keybinds.opts)
vim.keybinds.gmap("v", "P", "[Pgvy", vim.keybinds.opts)
-------------------------删除-------------------------
-- 删除字母用x 小写x向右删除  大写X向左删除
vim.keybinds.gmap("n", "x", '"_x', vim.keybinds.opts)
vim.keybinds.gmap("v", "x", '"_x', vim.keybinds.opts)
vim.keybinds.gmap("n", "X", '"_X', vim.keybinds.opts)
-- 删除整个单词
vim.keybinds.gmap("n", "cw", '"_caw', vim.keybinds.opts)
-- 删除括号里的代码
vim.keybinds.gmap("n", "<S-c>", '"_ci', vim.keybinds.opts)
vim.keybinds.gmap("n", "c", '"_c', vim.keybinds.opts)
vim.keybinds.gmap("v", "c", '"_c', vim.keybinds.opts)
vim.keybinds.gmap("v", "<S-c>", '"_c', vim.keybinds.opts)
vim.keybinds.gmap("n", "cc", '"_cc', vim.keybinds.opts)
------------------------------CCPD------------------------------

-- 修改普通模式下cmd ：的映射
--vim.keybinds.gmap("n", "<space>", ":", vim.keybinds.opts)

-- 修改 <leader> 键位为" , " vim.g相当于 vim的let 如：let mapleader = ","
--vim.g.mapleader = ","
--vim.g.maplocalleader = ","

------------------------------window------------------------------
-- 分割窗口
vim.keybinds.gmap("n", "sc", ":split<Return><C-w>w", vim.keybinds.opts)
vim.keybinds.gmap("n", "sv", ":vsplit<Return><C-w>w", vim.keybinds.opts)
-- 窗口之间的切换
vim.keybinds.gmap("n", "sh", "<C-w>h", vim.keybinds.opts)
vim.keybinds.gmap("n", "sk", "<C-w>k", vim.keybinds.opts)
vim.keybinds.gmap("n", "sj", "<C-w>j", vim.keybinds.opts)
vim.keybinds.gmap("n", "sl", "<C-w>l", vim.keybinds.opts)
-- 修改分屏窗口大小
vim.keybinds.gmap("n", "<C-up>", "<cmd>res +1<CR>", vim.keybinds.opts)
vim.keybinds.gmap("n", "s<up>", "<cmd>res +1<CR>", vim.keybinds.opts)
vim.keybinds.gmap("n", "<C-down>", "<cmd>res -1<CR>", vim.keybinds.opts)
vim.keybinds.gmap("n", "s<down>", "<cmd>res -1<CR>", vim.keybinds.opts)
vim.keybinds.gmap("n", "<C-left>", "<cmd>vertical resize-1<CR>", vim.keybinds.opts)
vim.keybinds.gmap("n", "s<left>", "<cmd>vertical resize-1<CR>", vim.keybinds.opts)
vim.keybinds.gmap("n", "<C-right>", "<cmd>vertical resize+1<CR>", vim.keybinds.opts)
vim.keybinds.gmap("n", "s<right>", "<cmd>vertical resize+1<CR>", vim.keybinds.opts)
--vim.keybinds.gmap("n", "<C-up>", "<C-w>+", vim.keybinds.opts)
--vim.keybinds.gmap("n", "<C-down>", "<C-w>-", vim.keybinds.opts)
--vim.keybinds.gmap("n", "<C-left>", "<C-w><", vim.keybinds.opts)
--vim.keybinds.gmap("n", "<C-right>", "<C-w>>", vim.keybinds.opts)
------------------------------window------------------------------

-- 加/减数字1
vim.keybinds.gmap("n", "+", "<C-a>", vim.keybinds.opts)
vim.keybinds.gmap("n", "-", "<C-x>", vim.keybinds.opts)

-- 正常模式下按 ESC 取消高亮显示
vim.keybinds.gmap("n", "<ESC>", ":nohl<CR>", vim.keybinds.opts)

-- 通过 leader cs 切换拼写检查
vim.keybinds.gmap("n", "<leader>cs", "<cmd>set spell!<CR>", vim.keybinds.opts)

-- 使用Universal Ctags插件跳转到定义 sudo apt install universal-ctags
vim.keybinds.gmap("n", "<M-g>", "<C-]>", vim.keybinds.opts)

-- 将 C-u 和 C-d 调整为上下滑动 10 行而不是半页
--vim.keybinds.gmap("n", "<C-u>", "10k", vim.keybinds.opts)
--vim.keybinds.gmap("n", "<C-d>", "10j", vim.keybinds.opts)

--------------------------------------------------------其他配置中的按键映射----------------------------------------------------------------
-- 显示或隐藏调试界面：<leader>du

-- 文件浏览器快捷键  呼出为sf
--[[	  nnoremap <silent><buffer><expr> <CR>    
	  \ defx#do_action('open')
	  nnoremap <silent><buffer><expr> yy
	  \ defx#do_action('copy')
	  nnoremap <silent><buffer><expr> dd
	  \ defx#do_action('move')
	  nnoremap <silent><buffer><expr> pp
	  \ defx#do_action('paste')
	  nnoremap <silent><buffer><expr> l
	  \ defx#do_action('open')
	  nnoremap <silent><buffer><expr> <Right>
	  \ defx#do_action('open')
	  nnoremap <silent><buffer><expr> E
	  \ defx#do_action('open', 'vsplit')
	  nnoremap <silent><buffer><expr> n
	  \ defx#do_action('open', 'pedit')
	  nnoremap <silent><buffer><expr> i
	  \ defx#do_action('open', 'choose')
	  nnoremap <silent><buffer><expr> o
	  \ defx#do_action('open_or_close_tree')
	  nnoremap <silent><buffer><expr> K
	  \ defx#do_action('new_directory')
	  nnoremap <silent><buffer><expr> N
	  \ defx#do_action('new_file')
	  nnoremap <silent><buffer><expr> M
	  \ defx#do_action('new_multiple_files')
	  nnoremap <silent><buffer><expr> C
	  \ defx#do_action('toggle_columns',
	  \                'mark:indent:icon:filename:type:size:time')
	  nnoremap <silent><buffer><expr> S
	  \ defx#do_action('toggle_sort', 'time')
	  nnoremap <silent><buffer><expr> dD
	  \ defx#do_action('remove')
	  nnoremap <silent><buffer><expr> a
	  \ defx#do_action('rename')
	  nnoremap <silent><buffer><expr> !
	  \ defx#do_action('execute_command')
	  nnoremap <silent><buffer><expr> x
	  \ defx#do_action('execute_system')
	  nnoremap <silent><buffer><expr> YY
	  \ defx#do_action('yank_path')
	  nnoremap <silent><buffer><expr> .
	  \ defx#do_action('toggle_ignored_files')
	  nnoremap <silent><buffer><expr> <BS>
	  \ defx#do_action('toggle_ignored_files')
	  nnoremap <silent><buffer><expr> ;
	  \ defx#do_action('repeat')
	  nnoremap <silent><buffer><expr> h
	  \ defx#do_action('cd', ['..'])
	  nnoremap <silent><buffer><expr> <Left>
	  \ defx#do_action('cd', ['..'])
	  nnoremap <silent><buffer><expr> ~
	  \ defx#do_action('cd')
	  nnoremap <silent><buffer><expr> gh
	  \ defx#do_action('cd')
	  nnoremap <silent><buffer><expr> gn
	  \ defx#do_action('cd',['~/.config/nvim'])
	  nnoremap <silent><buffer><expr> q
	  \ defx#do_action('quit')
	  nnoremap <silent><buffer><expr> <Space>
	  \ defx#do_action('toggle_select') . 'j'
	  nnoremap <silent><buffer><expr> m
	  \ defx#do_action('toggle_select') . 'j'
	  nnoremap <silent><buffer><expr> vv
	  \ defx#do_action('toggle_select_all')
	  nnoremap <silent><buffer><expr> *
	  \ defx#do_action('toggle_select_all')
	  nnoremap <silent><buffer><expr> j
	  \ line('.') == line('$') ? 'gg' : 'j'
	  nnoremap <silent><buffer><expr> k
	  \ line('.') == 1 ? 'G' : 'k'
	  nnoremap <silent><buffer><expr> <C-l>
	  \ defx#do_action('redraw')
	  nnoremap <silent><buffer><expr> <C-g>
	  \ defx#do_action('print')
	  nnoremap <silent><buffer><expr> cd
	  \ defx#do_action('change_vim_cwd')]]
	  
-- 打开、关闭大纲预览  <M-m>
-- 移动到上一个/下一个子项目，同 <C-k> 和 <C-j>    '{' 和 '}'
-- 移动到上一个/下一个大项目  '[[' 和 ']]'

-- 关闭当前 buffer，由 bufdelete 插件所提供的方法 <C-q>
-- 切换上一个缓冲区 <C-h>
-- 切换下一个缓冲区 <C-l>
-- 关闭左侧缓冲区 <leader>bh
-- 关闭右侧缓冲区 <leader>bl
--按键映射 --nnoremap <silent> gb :BufferLinePick<CR>

-- 切换行注释  line = "gcc"
--- 切换块注释 block = "gCC"
-- 可视模式下的行注释 line = "gc"
-- 可视模式下的块注释 block = "gC"
-- 在当前行上方新增行注释 above = "gcO",
-- 在当前行下方新增行注释 below = "gco",
-- 在当前行行尾新增行注释 eol = "gcA"

-- 搜索并跳转到单词 "mk"
-- 搜索并跳转到行 "ml"
-- 搜索并跳转到字符 "mm"

-- lsp_signature -- 绑定按键toggle_key = "<leader>j"

-- 这里是 LSP 服务启动后的按键加载
-- 跳转到定义 "gd"
-- 列出光标下所有引用 "gr"
-- 工作区诊断 "go"
-- 小灯泡显示代码可用操作 "<leader>ca"
-- 变量重命名 "<leader>cn"
-- 查看帮助信息 "gh"
-- 跳转到上一个问题 "g["
-- 跳转到下一个问题 "g]"
-- 悬浮窗口上翻页，由 Lspsaga 提供 "<C-p>"
-- 悬浮窗口下翻页，由 Lspsaga 提供 "<C-n>"

-- 显示历史弹窗记录 "<leader>fn"

-- surround         https://github.com/tpope/vim-surround
-- cs 字符 字符：修改包裹
-- ds 字符     ：删除包裹
-- ys 范围 字符：增加包裹

-- 查找文件 "<leader>ff"
-- 查找文字 "<leader>fg"
-- 查找特殊符号 "<leader>fb"
-- 查找帮助文档 "<leader>fh"
-- 查找最近打开的文件 "<leader>fo"
-- 查找 marks 标记 "<leader>fm"
-- 默认键位
-- <CR> 打开选中的搜索结果
-- <Tab> 选中当前的搜索结果，可搭配 <CR> 一次性打开多个
-- <C-v> 垂直拆分打开选中的搜索结果
-- <C-c> 退出搜索框
-- <C-n> 选择下一项目（插入模式下）
-- <C-p> 选择上一个项目（插入模式下）
-- j     选择下一个项目（普通模式下）
-- k     选择上一个项目（普通模式下）

-- 退出终端插入模式 "<Esc>"
-- 打开普通终端 "<leader>tt"
-- 打开浮动终端 "<leader>tf"
-- 打开lazy git 终端 "<leader>tg"
-- 打开或关闭所有终端 "<leader>ta"

-- 代码格式化   <leader>cf


