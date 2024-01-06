-- import nvim-treesitter plugin safely
local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
  return
end

-- configure treesitter
treesitter.setup({
  -- enable syntax highlighting
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },

  -- enable indentation (note: disabled for Python in this setup)
  indent = { 
    enable = true, 
    disable = { "python" } 
  },

  -- enable autotagging (w/ nvim-ts-autotag plugin)
  autotag = { enable = true },

  -- ensure these language parsers are installed
  ensure_installed = {
    "cpp", "rust", "json", "javascript", "typescript", "tsx", "yaml", "html",
    "css", "markdown", "svelte", "graphql", "bash", "lua", "vim", "dockerfile",
    "gitignore", "c", "python", "cmake", "regex"
  },

  -- auto install above language parsers
  auto_install = true,

  -- 彩虹括号配置，由 nvim-ts-rainbow 插件提供
  rainbow = {
    enable = true,
    extended_mode = true
    -- colors = {}, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  },

  -- 根据当前上下文定义文件类型，由 nvim-ts-context-commentstring 插件提供
  context_commentstring = {
    enable = true
  },

  -- 范围选择配置
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<CR>",
      node_incremental = "<CR>",
      node_decremental = "<BS>",
      scope_incremental = "<TAB>"
    }
  },
})

