-- import nvim-cmp plugin safely
local cmp_status, cmp = pcall(require, "cmp")
if not cmp_status then
  return
end

-- import luasnip plugin safely
local luasnip_status, luasnip = pcall(require, "luasnip")
if not luasnip_status then
  return
end

-- import lspkind plugin safely
local lspkind_status, lspkind = pcall(require, "lspkind")
if not lspkind_status then
  return
end

-- load vs-code like snippets from plugins (e.g. friendly-snippets)
require("luasnip/loaders/from_vscode").lazy_load()

-- import cmp-under-comparator plugin
local under_comparator_status, under_comparator = pcall(require, "cmp-under-comparator")
if not under_comparator_status then
  return
end

-- import other required cmp plugins if needed
-- ...

vim.opt.completeopt = "menu,menuone,noselect"

-- configure nvim-cmp
cmp.setup({
  snippet = {
    expand = function(args)
      -- try using luasnip first, fallback to vsnip if not available
      if luasnip then
        luasnip.lsp_expand(args.body)
      else
        vim.fn["vsnip#anonymous"](args.body)
      end
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<S-Tab>"] = cmp.mapping.select_prev_item(),
    ["<Tab>"] = cmp.mapping.select_next_item(),
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping.confirm({ select = false }),
    -- include other mappings here
  }),
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "buffer" },
    { name = "path" },
    -- include other sources here
  }),
  formatting = {
    format = lspkind.cmp_format({
      with_text = true,
      maxwidth = 50,
      before = function(entry, vim_item)
        vim_item.menu = "[" .. string.upper(entry.source.name) .. "]"
        return vim_item
      end
    }),
  },
  sorting = {
    comparators = {
      cmp.config.compare.offset,
      cmp.config.compare.exact,
      cmp.config.compare.score,
      cmp.config.compare.recently_used,
      under_comparator.under,
      -- include other comparators here
    }
  },
  -- include other setup options here
})

-- configure cmdline
cmp.setup.cmdline('/', {
  sources = {
    { name = 'buffer' }
  }
})

cmp.setup.cmdline(':', {
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

