-- import nvim-autopairs safely
local autopairs_setup, autopairs = pcall(require, "nvim-autopairs")
if not autopairs_setup then
  vim.api.nvim_err_writeln("Failed to load nvim-autopairs")
  return {} -- Return an empty table instead of nil or false
end

-- configure autopairs
autopairs.setup({
  check_ts = true, -- enable treesitter
  ts_config = {
    lua = { "string" }, -- don't add pairs in lua string treesitter nodes
    javascript = { "template_string" }, -- don't add pairs in javascript template_string treesitter nodes
    java = false, -- don't check treesitter on java
  },
})

-- import nvim-autopairs completion functionality safely
local cmp_autopairs_setup, cmp_autopairs = pcall(require, "nvim-autopairs.completion.cmp")
if not cmp_autopairs_setup then
  vim.api.nvim_err_writeln("Failed to load nvim-autopairs.completion.cmp")
  return {} -- Return an empty table instead of nil or false
end

-- import nvim-cmp plugin safely (completions plugin)
local cmp_setup, cmp = pcall(require, "cmp")
if not cmp_setup then
  vim.api.nvim_err_writeln("Failed to load cmp")
  return {} -- Return an empty table instead of nil or false
end

-- make autopairs and completion work together
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

-- It's important to ensure that the last statement is not a pcall, 
-- or to explicitly return a table at the end of the script.
return {} -- Optionally, return a configuration table or an empty table

