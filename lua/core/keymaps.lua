
vim.g.mapleader = " "

-- Leader keys
-- Neotree
vim.keymap.set('n', '<leader>g', ':Neotree toggle<CR>', { noremap = true, silent = true })

-- Basics
vim.keymap.set('n', '<leader>l', '<cmd>Lazy home<CR>', { desc = 'Open Lazy main menu' })

-- Window management remaps
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move to left window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move to below window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move to above window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move to right window' })

vim.keymap.set('n', '<C-S-h>', '<cmd>vertical resize +6<CR>', { desc = 'Resize window left' })
vim.keymap.set('n', '<C-S-j>', '<cmd>resize +3<CR>', { desc = 'Resize window down' })
vim.keymap.set('n', '<C-S-k>', '<cmd>resize -3<CR>', { desc = 'Resize window up' })
vim.keymap.set('n', '<C-S-l>', '<cmd>vertical resize -6<CR>', { desc = 'Resize window right' })

vim.keymap.set('v', 'J', ':m \'>+1<CR>gv=gv', { desc = 'Move line down' })
vim.keymap.set('v', 'K', ':m \'<-2<CR>gv=gv', { desc = 'Move line up' })
vim.keymap.set('v', '<leader>y', '"*y', { desc = 'Yank to system clipboard' })

vim.keymap.set('i', 'jj', '<Esc>', { desc = 'Escape insert mode' })
