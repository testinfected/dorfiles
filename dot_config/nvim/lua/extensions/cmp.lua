--[[
  File: cmp.lua
  Description: CMP plugin configuration (with lspconfig)
  See: https://github.com/hrsh7th/nvim-cmp
]]

local cmp = require('cmp')
local lspkind = require('lspkind')
local luasnip = require('luasnip')

local function check_back_space()
  local col = vim.fn.col('.') - 1
  if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
    return true
  else
    return false
  end
end

cmp.setup({
  -- Make the first item in completion menu always be selected.
  preselect = 'item',

  completion = {
    completeopt = 'menu,menuone,noinsert,preview'
  },

  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body) -- Luasnip expand
    end
  },

  mapping = {
    ['<C-y>'] = cmp.mapping.confirm({select = true}),
    ['<C-e>'] = cmp.mapping.abort(),

    -- Use <C-k> and <C-j> to navigate through completion variants
    ['<C-k>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 'c' }),
    ['<C-j>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c' }),
    ['<Up>'] = cmp.mapping.select_prev_item(),
    ['<Down>'] = cmp.mapping.select_next_item(),

    -- Alternatively
    ['<C-p>'] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_prev_item()
      else
        cmp.complete()
      end
    end),
    ['<C-n>'] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_next_item()
      else
        cmp.complete()
      end
    end),

    -- Scroll text in documentation window
    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    ['<C-d>'] = cmp.mapping.scroll_docs(4),

    -- toggle completion
    ['<C-Space>'] = cmp.mapping(function()
      if cmp.visible() then
        cmp.abort()
      else
        cmp.complete()
      end
    end),

    -- Don't confirm when no item selected, add regular newline instead
    ['<CR>'] = cmp.mapping({
      i = function(fallback)
        if cmp.visible() then
          cmp.confirm({ select = false, behavior = cmp.ConfirmBehavior.Replace})
        else
          fallback()
        end
      end,
      s = cmp.mapping.confirm({ select = true }),
      c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
    }),

    -- Use ESC to abort autocomplete
    ['<ESC>'] = cmp.mapping({
      i = cmp.mapping.abort(), -- Abort completion
      c = cmp.mapping.close(), -- Close completion window
    }),

    -- when menu is visible, navigate to next item
    -- when line is empty, insert a tab character
    -- else, activate completion
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif check_back_space() then
        fallback()
      else
        cmp.complete()
      end
    end, {'i', 's'}),

    -- when menu is visible, navigate to previous item on list
    -- else, revert to default behavior
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end, {'i', 's'}),

    -- Jump to the next placeholder in the snippet.
    ['<C-f>'] = cmp.mapping(function(fallback)
      if luasnip.jumpable(1) then
        luasnip.jump(1)
      else
        fallback()
      end
    end, {'i', 's'}),

    -- go to previous placeholder in the snippet
    ['<C-b>'] = cmp.mapping(function(fallback)
      if luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, {'i', 's'})
  },

  sources = cmp.config.sources({
    { name = 'nvim_lsp' },                -- LSP
    { name = 'nvim_lsp_signature_help' }, -- LSP for parameters in functions
    { name = 'nvim_lua' },                -- Lua Neovim API
    { name = 'luasnip' },                 -- Luasnip
    { name = 'buffer' },                  -- Buffers
    { name = 'path' },                    -- Paths
  }, {}),

  formatting = {
    -- changing the order of fields so the icon is the first
    fields = {'menu', 'abbr', 'kind'},

    format = lspkind.cmp_format({
      -- defines how annotations are shown
      -- options: 'text', 'text_symbol', 'symbol_text', 'symbol'
      mode = 'symbol_text',
      maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
      ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
      -- symbol map, defaults or codicons
      -- preset = 'codicons',
      symbol_map = symbols.codicons,

      menu = ({
        nvim_lsp = '󰘧',
        luasnip = '',
        buffer = '',
        path = '',
        nvim_lua = '',
        latex_symbols = "",
      })
    })
  },

  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },

  experimental = {
    ghost_text = true,
  },
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

-- Add snippets from Friendly Snippets
require("luasnip/loaders/from_vscode").lazy_load()

