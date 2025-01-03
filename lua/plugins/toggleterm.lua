
-- Terminal in neovim
return {
  'akinsho/toggleterm.nvim',
  config = function ()
    require('toggleterm').setup({
      open_mapping = '<C-/>',
      terminal_mappings = true,
      direction = 'float',
      float_opts = {
        border = 'curved',
      },
    })
  end
}

