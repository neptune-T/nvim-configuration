local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
vim.fn.system({
	"git",
	"clone",
	"--filter=blob:none",
	"https://github.com/folke/lazy.nvim.git",
	"--branch=stable", -- latest stable release
	lazypath,
})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup(
{
	{
		--颜色主题 切换主题在init.lua中
		"folke/tokyonight.nvim",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
		--cond = false, --设置条件加不加在插件
		--enabled=false, --能不能用 如果不能用则不会下载此插件
		config = function()
			require("tokyonight").setup({
				styles = {
					comments = {italic = false}
				}
			})
		-- load the colorscheme here
		vim.cmd([[colorscheme tokyonight]])
		end,
	},

	{
		-- 内嵌浮动ranger插件
		"kevinhwang91/rnvimr",
		keys = {
			{ "sr", ":RnvimrToggle<CR>", mode = "n" },
		},
		lazy = false,
		config = function()
			vim.g.rnvimr_enable_ex = "1"
			vim.g.rnvimr_enable_picker = "1"
		end,
	},

	{
		-- 状态栏插件
		"nvim-lualine/lualine.nvim",
		lazy = false,
		requires = {"kyazdani42/nvim-web-devicons", opt = true},
		config = function()
		require("conf.lualine")
		end
	},

	{
		-- 自动匹配括号
		"windwp/nvim-autopairs",
		lazy = false,
		--priority = 1000,
		ft ="nvim-autopairs",
		opts = {disable_filetype = { "TelescopePrompt" , "vim" }}
	},

	{
		-- 快速跳转插件
		"phaazon/hop.nvim",
		config = function()
			require("hop").setup()
			-- 搜索并跳转到单词
			vim.keybinds.gmap("n", "mk", "<cmd>HopWord<CR>", vim.keybinds.opts)
			-- 搜索并跳转到行
			vim.keybinds.gmap("n", "ml", "<cmd>HopLine<CR>", vim.keybinds.opts)
			-- 搜索并跳转到单个字符
			vim.keybinds.gmap("n", "<Space>", "<cmd>HopChar1<CR>", vim.keybinds.opts)
			-- 搜索并跳转到双个字符
			vim.keybinds.gmap("n", "mm", "<cmd>HopChar2<CR>", vim.keybinds.opts)
			-- 替换查找/
			--vim.keybinds.gmap("n", "/", "<cmd>HopPattern<CR>", vim.keybinds.opts)
			--vim.keybinds.gmap("n", "<Space>", "<cmd>HopAnywhere<CR>", vim.keybinds.opts)
			-- Use Hop cross windows with multi-windows support (:Hop*MW).
			-- Use it with commands like v, d, c, y to visually select/delete/change/yank up to your new cursor position.
		end,
	},

	{
		-- markdown预览插件
		"iamcco/markdown-preview.nvim",
		lazy = true,
		-- 需要调整nodejs版本
		build = "source /usr/share/nvm/init-nvm.sh; nvm use v18;cd app && yarn install",
		ft = {"markdown"},
	},

	{
		-- neovim 虽然拥有内置终端，但该终端的使用体验非常不好。
		-- 通过 toggleterm 插件，能够让默认终端变得既好看又好用。
		-- 记得手动安装lazygit
		-- 内置终端
		"akinsho/toggleterm.nvim",
		version = "*",
		config = function()
			require("conf.toggleterm")
			-- 退出终端插入模式
			vim.keybinds.gmap("t", "<Esc>", "<C-\\><C-n>", vim.keybinds.opts)
			-- 打开普通终端
			vim.keybinds.gmap("n", "<leader>tt", "<cmd>exe v:count.'ToggleTerm'<CR>", vim.keybinds.opts)
			-- 打开浮动终端
			vim.keybinds.gmap("n", "<leader>tf", "<cmd>lua require('toggleterm').float_toggle()<CR>", vim.keybinds.opts)
			-- 打开lazy git 终端
			vim.keybinds.gmap("n", "<leader>tg", "<cmd>lua require('toggleterm').lazygit_toggle()<CR>", vim.keybinds.opts)
			-- 打开或关闭所有终端
			vim.keybinds.gmap("n", "<leader>ta", "<cmd>ToggleTermToggleAll<CR>", vim.keybinds.opts)

			-- 要需创建多个终端，可：
			-- 1 <键位> leader tt
			-- 2 <键位>
			-- ... <键位>
			-- 另外，上面我们新建了 2 个特殊终端，所以普通终端的顺序应该是从 3 开始
		end
	},

	{
		-- 语法高亮
		"nvim-treesitter/nvim-treesitter",
		build = {":TSupdate"},
		dependencies = {
			"p00f/nvim-ts-rainbow" -- 彩虹括号
		},
		config = function()
			require("conf.nvim-treesitter")
		end
	},

	{
		-- 需要wget https://github.com/BurntSushi/ripgrep/releases/download/13.0.0/ripgrep_13.0.0_amd64.deb
		-- 需要sudo dpkg -i ripgrep_13.0.0_amd64.deb
		-- 和需要sudo apt-get install fd-find
		-- 模糊查找
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim", -- Lua 开发模块
			"BurntSushi/ripgrep", -- 文字查找
			"sharkdp/fd" -- 文件查找
		},
		config = function()
			require("telescope").setup()
			-- 查找文件
			vim.keybinds.gmap("n", "<leader>ff", "<cmd>Telescope find_files theme=dropdown<CR>", vim.keybinds.opts)
			-- 查找文字
			vim.keybinds.gmap("n", "<leader>fg", "<cmd>Telescope live_grep theme=dropdown<CR>", vim.keybinds.opts)
			-- 查找特殊符号
			vim.keybinds.gmap("n", "<leader>fb", "<cmd>Telescope buffers theme=dropdown<CR>", vim.keybinds.opts)
			-- 查找帮助文档
			vim.keybinds.gmap("n", "<leader>fh", "<cmd>Telescope help_tags theme=dropdown<CR>", vim.keybinds.opts)
			-- 查找最近打开的文件
			vim.keybinds.gmap("n", "<leader>fo", "<cmd>Telescope oldfiles theme=dropdown<CR>", vim.keybinds.opts)
			-- 查找 marks 标记
			vim.keybinds.gmap("n", "<leader>fm", "<cmd>Telescope marks theme=dropdown<CR>", vim.keybinds.opts)
			-- 默认键位
			-- <CR> 打开选中的搜索结果
			-- <Tab> 选中当前的搜索结果，可搭配 <CR> 一次性打开多个
			-- <C-v> 垂直拆分打开选中的搜索结果
			-- <C-c> 退出搜索框
			-- <C-n> 选择下一项目（插入模式下）
			-- <C-p> 选择上一个项目（插入模式下）
			-- j     选择下一个项目（普通模式下）
			-- k     选择上一个项目（普通模式下）
		end
	},

	{
		-- 显示光标下相同词汇
		"RRethy/vim-illuminate",
		config = function()
			-- 禁止高亮的文件类型
			-- 虽然 vista_kind 和 toggleterm 还没有安装
			-- 但并不影响使用，反正后续都会装上
			vim.g.Illuminate_ftblacklist = {
			    "NvimTree",
			    "aerial",
			    "toggleterm",
				"defx"
			}
		end
	},

	{
		-- 自动代码补全系列插件
		-- 重新进入 neovim 后，tabnine 报一个错误
		-- 退出 neovim 输入以下 2 条命令安装 tabnine
		-- 找到 com-tabnine 的安装目录
		-- cd ~/.local/share/nvim/site/pack/packer/start/cmp-tabnine/
		-- 安装 tabnine（确保安装了 curl 命令）
		-- ./install.sh
		{
			"hrsh7th/nvim-cmp",  -- 代码补全核心插件，下面都是增强补全的体验插件
			dependencies = {
				{"onsails/lspkind-nvim"}, -- 为补全添加类似 vscode 的图标
				{"hrsh7th/vim-vsnip"}, -- vsnip 引擎，用于获得代码片段支持
				{"hrsh7th/cmp-vsnip"}, -- 适用于 vsnip 的代码片段源
				{"hrsh7th/cmp-nvim-lsp"}, -- 替换内置 omnifunc，获得更多补全
				{"hrsh7th/cmp-path"}, -- 路径补全
				{"hrsh7th/cmp-buffer"}, -- 缓冲区补全
				--{"hrsh7th/cmp-cmdline"}, -- 命令补全
				{"f3fora/cmp-spell"}, -- 拼写建议
				{"rafamadriz/friendly-snippets"}, -- 提供多种语言的代码片段
				{"lukas-reineke/cmp-under-comparator"}, -- 让补全结果的排序更加智能
			},
			config = function()
				require("conf.nvim-cmp")
			end
		}
	},

	{
		-- view tree 大纲视窗
		 {
			"stevearc/aerial.nvim",
			config = function()
				require("aerial").setup(
				    {
        				min_width = 30,
        				-- backends = {"lsp", "treesitter", "markdown"}
        				backends = {"treesitter", "markdown"},
        				-- false 是显示所有的图标
        				filter_kind = false,
        				-- 将从 lspkind 和 nvim-web-devicons 中获得图标
        				nerd_font = "auto",
        				-- 何时更新
        				update_events = "TextChanged,InsertLeave",
        				-- 按键映射
        				on_attach = function(bufnr)
            				-- 打开、关闭大纲预览
            				vim.api.nvim_buf_set_keymap(bufnr, 'n', '<M-m>', '<cmd>AerialToggle!<CR>', {})
            				-- 移动到上一个/下一个子项目，同 <C-k> 和 <C-j>
            				-- vim.api.nvim_buf_set_keymap(bufnr, 'n', '{', '<cmd>AerialPrev<CR>', {})
            				-- vim.api.nvim_buf_set_keymap(bufnr, 'n', '}', '<cmd>AerialNext<CR>', {})
            				-- 移动到上一个/下一个大项目
            				-- vim.api.nvim_buf_set_keymap(bufnr, 'n', '[[', '<cmd>AerialPrevUp<CR>', {})
            				-- vim.api.nvim_buf_set_keymap(bufnr, 'n', ']]', '<cmd>AerialNextUp<CR>', {})
        				end
    				}
				)
			end
		}
	},

	{
		-- LSP 基础服务
		"neovim/nvim-lspconfig",
		config = function()
			require("conf.nvim-lspconfig")
		end
	},

	{
		-- 自动安装 LSP
		"williamboman/nvim-lsp-installer",
		config = function()
			require("conf.nvim-lsp-installer")
		end
	},

	{
		-- LSP UI 美化
			"tami5/lspsaga.nvim",
			config = function()
				require("conf.lspsaga")
			end
	},

	{
		-- 代码注释
		"numToStr/Comment.nvim",
		dependencies = {
			"JoosepAlviste/nvim-ts-context-commentstring"
		},
		config = function()
			require("conf.Comment")
		end
	},

	{
		-- 显示缩进线
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("indent_blankline").setup(
				{
					-- 显示当前所在区域
					show_current_context = true,
					-- 显示当前所在区域的开始位置
					show_current_context_start = true,
					-- 显示行尾符
					show_end_of_line = true
				})
		end,
	},

	{
		'Bekaboo/dropbar.nvim',
	},

})

