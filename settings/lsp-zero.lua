-- ============================== mason ==============================
require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
            border = "rounded",
        }
    }
})
-- ============================== mason ==============================


-- Learn the keybindings, see :help lsp-zero-keybindings
-- Learn to configure LSP servers, see :help lsp-zero-api-showcase
local lsp = require('lsp-zero')
lsp.set_preferences({
    suggest_lsp_servers = true,
    setup_servers_on_start = true,
    set_lsp_keymaps = true,
    configure_diagnostics = true,
    cmp_capabilities = true,
    manage_nvim_cmp = true,
    call_servers = 'local',
    sign_icons = {
      error = '', --'', -- ''
      warn = '',
      hint = '', --'',
      info = '' --''
    }
  })

lsp.ensure_installed({
    -- Replace these with whatever servers you want to install
    'tsserver',
    'eslint',
    'sumneko_lua',
  })

-- (Optional) Configure lua language server for neovim
lsp.nvim_workspace()

lsp.setup()

vim.diagnostic.config(
    {
        virtual_text = true,
        signs = true,
        update_in_insert = false,
        underline = true,
        severity_sort = true,
        float = {
          focusable = true,
          style = 'minimal',
          border = 'rounded',
          source = 'always',
          header = '',
          prefix = '',
        },
    }
)

-- ============================== nvim-cmp ==============================
local cmp = require('cmp') -- For auto-complete
local luasnip = require('luasnip') -- For snippet
local lspkind = require('lspkind') -- For icon

local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.

    -- go to next placeholder in the snippet
    ['<C-g>'] = cmp.mapping(function(fallback)
    if luasnip.jumpable(1) then
        luasnip.jump(1)
    else
        fallback()
    end
    end, {'i', 's'}),

    -- go to previous placeholder in the snippet
    ['<C-d>'] = cmp.mapping(function(fallback)
    if luasnip.jumpable(-1) then
        luasnip.jump(-1)
    else
        fallback()
    end
    end, {'i', 's'}),
})

local cmp_config = lsp.defaults.cmp_config({
    -- Don't preselect first match
    preselect = 'none',
    completion = {
      completeopt = 'menu,menuone,noinsert,noselect'
    },
    -- Change window type
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    -- Specify priority of each source
    sources = {
        {name = 'path'},
        {name = 'nvim_lsp', keyword_length = 3},
        {name = 'buffer', keyword_length = 3},
        {name = 'luasnip', keyword_length = 2},
    },
    -- Remap some key
    mapping = cmp_mappings,
    -- Load icons
    formatting = {
        format = lspkind.cmp_format({
            mode = 'symbol', -- show only symbol annotations
            maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
            ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)

            -- The function below will be called before any actual modifications from lspkind
            -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
            before = function (entry, vim_item)
                -- Some code here
            return vim_item
          end
        })
    },
})

-- Load new setting
cmp.setup(cmp_config)

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
sources = cmp.config.sources({
    { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
}, {
    { name = 'buffer' },
})
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
-- ============================== nvim-cmp ==============================


-- -- Set up lspconfig manual.
-- local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- local languageServer = { 'ccls' }
-- for i in pairs(languageServer) do
--     require('lspconfig')[languageServer[i]].setup {
--         capabilities = capabilities
--     }
-- end

-- Note: If you want the ccls language server to work properly, make sure you have created the .ccls folder before