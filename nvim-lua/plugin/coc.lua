-- This is not necessary anymore because I'm using coc-config (see :CocConfig for more info on it)
-- TODO: Verify if this require is necessary
-- require'lspconfig'.sumneko_lua.setup {
--     -- ... other configs
--     capabilities = vim.lsp.protocol.make_client_capabilities(),
--     settings = {
--         Lua = {
--             diagnostics = {
--                 globals = { 'vim' }
--             }
--         }
--     }
-- }

-- mapping errors and warnings navigation
vim.keymap.set('n', '<right>', ':call CocAction("diagnosticNext")<cr>')
vim.keymap.set('n', '<leader>j', '<Plug>(coc-diagnostic-next-error)')
vim.keymap.set('n', '<left>', ':call CocAction("diagnosticPrevious")<cr>')
vim.keymap.set('n', '<leader>k', '<Plug>(coc-diagnostic-prev-error)')

-- mapping coc-tsserver
vim.keymap.set('n', '<leader>gd', '<Plug>(coc-definition)', { silent = true })
vim.keymap.set('n', 'gd', '<Plug>(coc-definition)', { silent = true })
vim.keymap.set('n', '<leader>gr', '<Plug>(coc-references)', { silent = true })
vim.keymap.set('n', 'K', ':call CocAction("doHover")<cr>', { silent = true })

-- TODO: This is not working :/
-- Refresh the suggestions
vim.keymap.set('i', '<c-space>', 'coc#refresh()', { silent = true, expr = true })

-- TODO: check what does this do
vim.keymap.set('n', '<leader>gy', '<Plug>(coc-type-definition)', { silent = true })
vim.keymap.set('n', '<leader>gi', '<Plug>(coc-implementation)', { silent = true })

vim.keymap.set('n', '<leader>gs', ':split<CR><Plug>(coc-implementation)', { silent = true })
vim.keymap.set('n', '<leader>gv', ':vsplit<CR><Plug>(coc-implementation)', { silent = true })
vim.keymap.set('n', '<leader>gt', ':vsplit<CR><Plug>(coc-implementation)<c-w>T', { silent = true })

-- Refactor code
vim.keymap.set({ 'n', 'i' }, '<c-g>r', '<Plug>(coc-rename)')
vim.keymap.set('n', '<leader>rn', '<Plug>(coc-rename)')

-- coc configs
vim.keymap.set('n', '<leader>coe', ':CocEnable<CR>')
vim.keymap.set('n', '<leader>cod', ':CocDisable<CR>')
vim.keymap.set('n', '<leader>cor', ':CocRestart<CR>')

-- vim.keymap.set('n', '', 'k')
