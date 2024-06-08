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
keymap('n', '<Leader>we', '<C-w>k', {})
keymap('n', '<Leader>wn', '<C-w>j', {})

-- Open/Save/Close/Navigate buffers
keymap('n', '<Leader>en', ':enew<cr>', {})
keymap('n', '<Leader>es', ':buffers<cr>:b', {})
keymap('n', '<Leader>ek', ':buffers<cr>:bd', {})
keymap('n', '<Leader>eK', ':buffers<cr>:bd!', {})
keymap('n', '<Leader>e.', ':e ', {})
keymap('n', '<Leader>e,', ':e ~/', {})
keymap('n', '<Leader>ew', ':w<cr>', {})

-- Quit nvim, forcefully
keymap('n', '<Leader>qq', ':qa<cr>', {})
keymap('n', '<Leader>qQ', ':qa!<cr>', {})
