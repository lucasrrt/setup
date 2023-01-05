-- Quickfix List
-- :copen " Open the quickfix window
-- :ccl   " Close it
-- :cw    " Open it if there are 'errors', close it otherwise (some people prefer this)
-- :cn    " Go to the next error in the window
-- :cp    " Go to the previous error in the window
-- :cnf   " Go to the first error in the next file
-- :.cc   " Go to error under cursor (if cursor is in quickfix window)

vim.keymap.set('n', '<leader>cn', ':cn<cr>', { silent = true })
vim.keymap.set('n', '>', ':cn<cr>', { silent = true })
vim.keymap.set('n', 'L', ':cn<cr>', { silent = true })

vim.keymap.set('n', '<leader>cp', ':cp<cr>', { silent = true })
vim.keymap.set('n', '<', ':cp<cr>', { silent = true })
vim.keymap.set('n', 'H', ':cp<cr>', { silent = true })
