-- Telescope keybinds
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<localleader>ff', builtin.find_files, opts)
vim.keymap.set('n', '<localleader>fg', builtin.live_grep, opts)
vim.keymap.set('n', '<localleader>fs', builtin.current_buffer_fuzzy_find, opts)

-- Editor Keybinds
vim.keymap.set('i', 'jk', '<Esc><Right>', opts)
vim.keymap.set('n', '<C-m>', ':set invrelativenumber<CR>', opts)
vim.keymap.set('i', '<C-s>', '<Esc>:w<CR>i<Right>', opts)
vim.keymap.set('n', '<C-s>', ':w<CR>', opts)

-- Movement
vim.keymap.set('n', '<Right>', ':tabnext<CR>', opts)
vim.keymap.set('n', '<Left>', ':tabprev<CR>', opts)
vim.keymap.set('n', '<C-h>', '<C-w>h', opts)
vim.keymap.set('n', '<C-j>', '<C-w>j', opts)
vim.keymap.set('n', '<C-k>', '<C-w>k', opts)
vim.keymap.set('n', '<C-l>', '<C-w>l', opts)

