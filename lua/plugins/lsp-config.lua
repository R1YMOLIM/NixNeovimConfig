
return {
    -- Build LSP (Language Server Protocol)
    'neovim/nvim-lspconfig',
    enabled = true,
    dependencies = {
    -- Mason LSPconfig: Extension to mason.nvim to automatically set up LSP servers
    'williamboman/mason-lspconfig.nvim',

    -- Nvim-cmp: A completion engine plugin for Neovim written in Lua
    'hrsh7th/nvim-cmp',

    -- nvim-cmp source for LSP
    'hrsh7th/cmp-nvim-lsp',

    -- nvim-cmp source for buffer words
    'hrsh7th/cmp-buffer',

    -- nvim-cmp source for filesystem paths
    'hrsh7th/cmp-path',

    -- nvim-cmp source for Neovim's command-line
    'hrsh7th/cmp-cmdline',

    -- LuaSnip: A snippet engine for Neovim written in Lua
    'L3MON4D3/LuaSnip',

    -- nvim-cmp source for LuaSnip
    'saadparwaiz1/cmp_luasnip',

    -- Fidget: Standalone UI for nvim-lsp progress. Eye candy for the impatient.
    'j-hui/fidget.nvim',

    -- lspkind for awesome icons
    'onsails/lspkind.nvim',
    },

    config = function()
        require('fidget').setup({})
        local cmp_nvim_lsp = require('cmp_nvim_lsp')

        local lspconfig = require('lspconfig')

        local capabilities = vim.tbl_deep_extend(
            'force',  -- Use 'force' to overwrite conflicting keys
            {},  -- Start with an empty table
            vim.lsp.protocol.make_client_capabilities(),  -- Default LSP client capabilities
            cmp_nvim_lsp.default_capabilities()  -- Capabilities required for nvim-cmp
        )

    -- Lua LSP
    lspconfig.lua_ls.setup({
      cmd = { "lua-language-server" },
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = { globals = { "vim" } },
          telemetry = { enable = false },
        },
      },
    })

    -- Nix LSP
    lspconfig.nixd.setup({
      cmd = { "nixd" },
      capabilities = capabilities,
    })

    -- C/C++ LSP 
    lspconfig.clangd.setup ({})

    -- Python LSP
    lspconfig.pyright.setup ({})
    end
}

