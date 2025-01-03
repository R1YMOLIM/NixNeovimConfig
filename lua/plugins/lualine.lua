
local colors = {
    blue = '#80a0ff',
    cyan = '#79dac8',
    black = '#080808',
    white = '#c6c6c6',
    red = '#ff5189',
    violet = '#d183e8',
    grey = '#303030',
    transparent = 'NONE',
}


local bubbles_theme = {
    normal = {
        a = {fg = colors.black, bg = colors.violet},
        b = {fg = colors.white, bg = colors.grey},
        c = {fg = colors.black, bg = colors.transparent},
    },

    insert = {a = {fg = colors.black, bg = colors.blue}},
    visual = {a = {fg = colors.black, bg = colors.cyan}},
    replace = {a = {fg = colors.black, bg = colors.red}},

    inactive = {
        a = {fg = colors.white, bg = colors.transparent},
        b = {fg = colors.white, bg = colors.transparent},
        c = {fg = colors.black, bg = colors.transparent},
    }
}

return {
    'nvim-lualine/lualine.nvim',
     enabled = true,
     dependencies = { 'nvim-tree/nvim-web-devicons' },
     config = function()
        require('lualine').setup {
            options = {
        theme = bubbles_theme,
        component_separators = '|',
        section_separators = {left = '', right = ''}
    },
    sections = {
        lualine_a = {{'mode', separator = {left = ''}, right_padding = 2}},
        lualine_b = {
            'filename', 'branch',
            'diff', 'diagnostics',
        },
        lualine_c = {},
        lualine_x = {{'fileformat', component_separators = '|',
                      separator = {left = '', right = ''},
                      right_padding = 2, left_padding = 2,
                      color = {fg = '#ffffff', bg = '#303030'},
                }},
        lualine_y = {'filetype', 'progress'},
        lualine_z = {
            {'location', separator = {right = ''}, left_padding = 2}
        }
    },
    inactive_sections = {
        lualine_a = {'filename'},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {'location'}
    },
    tabline = {
                lualine_a = { 'tabs' },
                lualine_b = { 'buffers' },
            },
    extensions = {}
        }
         vim.cmd([[
          highlight StatusLine guibg=NONE guifg=#ffffff
          highlight StatusLineNC guibg=NONE guifg=#888888
        ]])
     end,
}

