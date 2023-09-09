vim.keymap.set('n', 'gs', ':Git<CR>', { silent = true })
vim.keymap.set('n', 'gb', ':Git blame<CR>', { silent = true })
vim.keymap.set('n', 'gl', ':0Gclog<CR>', { silent = true })
vim.keymap.set('n', 'gi', ':Git')
vim.keymap.set('n', '<leader>di', ':Gvdiff<CR>')