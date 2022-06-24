local status, cmp = pcall(require, "cmp")
if not status then
  vim.notify("[cmp]: cannot find cmp..")
  return
end

local status, luasnip = pcall(require, "luasnip")
if not status then
  vim.notify("[cmp]: cannot find luasnip..")
  return
end

luasnip.config.setup({
  region_check_events = "CursorMoved",
  delete_check_events = "TextChanged",
})

local status, lspkind = pcall(require, "lspkind")
if not status then
  vim.notify("[cmp]: cannot find lspkind..")
  return
end

require("luasnip/loaders/from_vscode").lazy_load()

local check_bs = function()
  return
end

require("luasnip/loaders/from_vscode").lazy_load()

local check_bs = function()
  vim.notify("[cmp]: cannot find lspkind..")
  return
end

require("luasnip/loaders/from_vscode").lazy_load()

local check_bs = function()
  local col = vim.fn.col "." - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
end

local source_map = {
  nvim_lsp = "[Lsp]",
  nvim_lua = "[Lua]",
  luasnip = "[Snippet]",
  buffer = "[Buffer]",
  path = "[Path]",
}

cmp.setup({
  snippet = {
    expand = function(args)
      -- for `luasnip` users
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = {
    ["<C-k>"] = cmp.mapping.select_prev_item(),
    ["<C-j>"] = cmp.mapping.select_next_item(),
    ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
    ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
    ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
    ["<C-y>"] = cmp.config.disable, -- Disables default <C-y> mapping
    ["<C-e>"] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expandable() then
        luasnip.expand()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif check_bs() then
        fallback()
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
    ["<S-Tab>"] = cmp.mapping(function(cb)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
  },
  formatting = {
    fields = {
      "kind", "abbr", "menu"
    },
    format = function(entry, vim_item)
      vim_item.kind = lspkind.presets.default[vim_item.kind]
      local menu = source_map[entry.source.name]
      vim_item.menu = menu
      return vim_item
    end,
  },
  sources = {
    { name = "nvim_lsp" },
    { name = "nvim_lua" },
    { name = "luasnip" },
    { name = "buffer", keyword_length = 5, max_item_count = 5 },
    { name = "path" },
  },
  confirm_opts = {
    behavior = cmp.ConfirmBehavior.Replace,
    select = false,
  },
  window = {
    completion = {
      border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
      scrollbar = "║",
    },
    documentation = {
      border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
    },
  },
  experimental = {
    ghost_text = false,
    native_menu = false,
  },
})
