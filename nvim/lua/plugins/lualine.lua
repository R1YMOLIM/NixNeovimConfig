
return {
  'nvim-lualine/lualine.nvim',
  enabled = true,
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local animated_spinner = {
      "󰇮", "󰇯", "󰇰", "󰇱", "󰇲", "󰇳"
    }

    local spinner_index = 1
    local function animated_component()
      spinner_index = (spinner_index % #animated_spinner) + 1
      return animated_spinner[spinner_index]
    end

    require('lualine').setup {
      options = {
        icons_enabled = true,
        theme = 'tokyonight',
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
        disabled_filetypes = {
          statusline = {},
          winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = true,
        refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 1000,
        }
      },
      sections = {
        lualine_a = {
          { 'mode' },
        },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = {
          {
            'filename',
            file_status = true, path = 1
          },
          { animated_component },
          {
            function()
              return '󰃰 ' .. os.date('%H:%M:%S')
            end,
            color = { fg = '#a9ff68', gui = 'bold' },
          },
        },
        lualine_x = {
          'encoding', 'fileformat', 'filetype',
          {
            'filesize',
            cond = function()
              return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
            end,
          },
        },
        lualine_y = { 'progress', {
          'location',
          color = { gui = 'bold' },
        }},
        lualine_z = { {
          function()
            return '󰛡 ' .. vim.fn.getcwd()
          end,
          color = { fg = '#ff9e64', gui = 'italic' },
        }},
      },
      tabline = {
        lualine_a = { 'tabs' },
        lualine_b = { 'buffers' },
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },
      winbar = {},
      inactive_winbar = {},
      extensions = {}
    }
  end
}

