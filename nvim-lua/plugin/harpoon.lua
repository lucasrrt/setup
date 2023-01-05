vim.keymap.set('n', '<leader>hh', ':lua require("harpoon.ui").toggle_quick_menu()<cr>')
vim.keymap.set('n', '<leader>ha', ':lua require("harpoon.mark").add_file()<cr>')
vim.keymap.set('n', '<leader>hn', ':lua require("harpoon.ui").nav_next()<cr>')
vim.keymap.set('n', '<leader>hN', ':lua require("harpoon.ui").nav_prev()<cr>')
-- TODO(lucasrrt): Auto index
vim.keymap.set('n', '<leader>h1', ':lua require("harpoon.ui").nav_file(1)<cr>')
vim.keymap.set('n', '<leader>h2', ':lua require("harpoon.ui").nav_file(2)<cr>')
vim.keymap.set('n', '<leader>h3', ':lua require("harpoon.ui").nav_file(3)<cr>')
vim.keymap.set('n', '<leader>h4', ':lua require("harpoon.ui").nav_file(4)<cr>')
vim.keymap.set('n', '<leader>h5', ':lua require("harpoon.ui").nav_file(5)<cr>')

require("harpoon").setup({
    menu = {
        width = vim.api.nvim_win_get_width(0) - 4,
    }
})
