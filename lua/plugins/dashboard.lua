
local function default_header()
      return {
      "          ::::.    ':::::     ::::'          ",
      "          ':::::    ':::::.  ::::'           ",
      "            :::::     '::::.:::::            ",
      "      .......:::::..... ::::::::             ",
      "     ::::::::::::::::::. ::::::    ::::.     ",
      "    ::::::::::::::::::::: :::::.  .::::'     ",
      "           .....           ::::' :::::'      ",
      "          :::::            '::' :::::'       ",
      " ........:::::               ' :::::::::::.  ",
      ":::::::::::::                 :::::::::::::  ",
      " ::::::::::: ..              :::::           ",
      "     .::::: .:::            :::::            ",
      "    .:::::  :::::          '''''    .....    ",
      "    :::::   ':::::.  ......:::::::::::::'    ",
      "     :::     ::::::. ':::::::::::::::::'     ",
      "            .:::::::: '::::::::::            ",
      "           .::::''::::.     '::::.           ",
      "          .::::'   ::::.     '::::.          ",
      "         .::::      ::::      '::::.         ",
      "                                             ",
     }
end

return {
  'nvimdev/dashboard-nvim',
  config = function()
    require('dashboard').setup {
      theme = 'doom',
      config = {
        header = default_header(),
        center = {
          {
            desc = '󰊳 Update',
            group = '@property',
            action = 'Lazy update',
            key = 'u'
          },
          {
            icon = ' ',
            icon_hl = '@variable',
            desc = 'Files',
            group = 'Label',
            action = 'Telescope find_files',
            key = 'f',
          },
          {
            icon = ' ',
            desc = 'Config',
            action = 'edit ~/.config/nvim/init.lua',
            key = 'c'
          },
          {
            icon = ' ',
            icon_hl = '@variable',
            desc = 'Recent Files',
            group = 'Label',
            action = 'Telescope oldfiles',
            key = 'r',
          },
          {
            icon = ' ',
            icon_hl = '@variable',
            desc = 'Exit Neovim',
            group = 'Label',
            action = 'qa',  -- Команда для виходу з Neovim
            key = 'e',
          },
        },
      },
    }
  end,
  dependencies = { {'nvim-tree/nvim-web-devicons'} }
}

