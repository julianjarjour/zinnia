local keymap = vim.keymap.set

-- Space leader
vim.g.mapleader = ' '

-- Yank to clipboard
keymap('v', '<Leader>y', '"+y<cr>', {})

keymap({'n', 'v'}, '<C-e>', '6k', {})
keymap({'n', 'v'}, '<C-n>', '6j', {})
keymap({'n', 'v'}, '<C-f>', '<C-e>', {noremap=true})

-- Navigate windows
keymap('n', '<Leader>wv', '<C-w>v', {})
keymap('n', '<Leader>wq', '<C-w>q', {})
keymap('n', '<Leader>wl', '<C-w>l', {})
keymap('n', '<Leader>wh', '<C-w>h', {})
keymap('n', '<Leader>w<up>', '<C-w>k', {})
keymap('n', '<Leader>w<down>', '<C-w>j', {})

-- Open/Save/Close/Navigate buffers
keymap('n', '<Leader>es', ':buffers<cr>:b', {})
keymap('n', '<Leader>ek', ':buffers<cr>:bd', {})
keymap('n', '<Leader>eK', ':buffers<cr>:bd!', {})
keymap('n', '<Leader>e.', ':e ', {})
keymap('n', '<Leader>e,', ':e ~/', {})
keymap('n', '<Leader>ew', '<cmd>w<cr>', {})

-- Quit nvim, forcefully
keymap('n', '<Leader>qq', '<cmd>qa<cr>', {})
keymap('n', '<Leader>qQ', '<cmd>qa!<cr>', {})
