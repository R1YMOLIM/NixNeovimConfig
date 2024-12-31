
return {
    'hrsh7th/nvim-cmp',
    dependencies = {
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
        'onsails/lspkind.nvim',
    },
    config = function()
        local cmp = require 'cmp'
        local lspkind = require 'lspkind'
        local cmp_autopairs = require("nvim-autopairs.completion.cmp")
        cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())


        cmp.setup {
            snippet = {
                expand = function(args)
                    vim.fn["vsnip#anonymus"](args.body)
                end,
            },
            window = {
                completion = cmp.config.window.bordered(),
                documention = cmp.config.window.bordered(),
            },
            mapping = {
                ['<C-p>'] = cmp.mapping.select_prev_item(),
                ['<C-n>'] = cmp.mapping.select_next_item(),
                ['<C-d>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<C-e>'] = cmp.mapping.close(),
                ['<CR>'] = cmp.mapping.confirm { select = true },
                ["<Tab>"] = cmp.mapping(function(fallback)
                  if cmp.visible() then
                    cmp.select_next_item()
                  else
                    fallback()
                  end
           end, {"i", "s"}),
                ["<S-Tab>"] = cmp.mapping(function(fallback)
                  if cmp.visible() then
                    cmp.select_prev_item()
                  else
                    fallback()
                  end
            end, {"i", "s"})
            },
            sources = cmp.config.sources {
                { name = 'nvim_lsp' },
                { name = 'buffer' },
                { name = 'path' },
                { name = 'cmdline' },
            },
            formatting = {
                format = lspkind.cmp_format({
                    with_text = true,
                    maxwidth = 50,
                    menu = {
                    buffer = "[Buffer]",
                    nvim_lsp = "[LSP]",
                    path = "[Path]",
                    cmdline = "[Cmdline]",
                    },
                }),
            },
        }
         cmp.setup.filetype('gitcommit', {
         sources = cmp.config.sources({
            {name = 'cmp_git'} -- You can specify the `cmp_git` source if you were installed it.
         }, {{name = 'buffer'}})
       })

         cmp.setup.cmdline({'/', '?'}, {
         mapping = cmp.mapping.preset.cmdline(),
         sources = {{name = 'buffer'}}
       })

        cmp.setup.cmdline(':', {
            sources = {
                { name = 'cmdline' },
            },
        })
    end,
}


