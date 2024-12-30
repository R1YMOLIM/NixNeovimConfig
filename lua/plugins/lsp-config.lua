
return {
    -- Build LSP (Language Server Protocol)
    'neovim/nvim-lspconfig',
    enabled = true,
    dependencies = {
    'williamboman/mason-lspconfig.nvim',
        
    'hrsh7th/nvim-cmp',

    'hrsh7th/cmp-nvim-lsp',

    'hrsh7th/cmp-buffer',

    'hrsh7th/cmp-path',

    'hrsh7th/cmp-cmdline',

    'L3MON4D3/LuaSnip',

    'saadparwaiz1/cmp_luasnip',

    'j-hui/fidget.nvim',
        
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

