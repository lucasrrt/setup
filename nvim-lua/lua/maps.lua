-- <space> as the leader key
-- Remove default functionality of <space>
vim.keymap.set('n', '<space>', '')
vim.g.mapleader = " "

-- <bs> as the localleader key
-- TODO: not working
vim.keymap.set('n', '<bs>', '')
vim.g.maplocalleader = "<bs>"


-- Avoid escape
vim.keymap.set('i', 'jk', '<esc>', {})


-- Command mode without shift
vim.keymap.set('n', '<leader>;', ':')
vim.keymap.set('n', '<localleader>;', ':')


-- Moving between panes
vim.keymap.set('n', '<c-h>', '<c-w>h')
vim.keymap.set('n', '<c-j>', '<c-w>j')
vim.keymap.set('n', '<c-k>', '<c-w>k')
vim.keymap.set('n', '<c-l>', '<c-w>l')

-- Window mappings
vim.keymap.set('n', '<leader>w', '<c-w>')

-- Resize pane
vim.keymap.set('n', '<leader>wg', '<c-w>_<c-w>|')

-- Change splits configuration
vim.keymap.set('n', '<leader>th', '<c-w>t<c-w>H')
vim.keymap.set('n', '<leader>tk', '<c-w>t<c-w>K')

-- Tab navigation
vim.keymap.set('n', 'gr', 'gT')

-- Leave only the current pane open
vim.keymap.set('n', '<leader>o', '<c-w>o')


-- File navigation
-- Explore directory navigation
vim.keymap.set('n', '-', '')
vim.keymap.set('n', '<leader>-', ':Explore<cr>')
vim.keymap.set('n', '<leader>ex', ':Explore<cr>')
vim.keymap.set('n', '<leader>vex', ':Vexplore<cr>')
vim.keymap.set('n', '<leader>hex', ':Hexplore<cr>')


-- Center the results of the search
vim.keymap.set('n', 'n', 'nzz')
vim.keymap.set('n', 'N', 'Nzz')
vim.keymap.set('n', '*', '*zz')
vim.keymap.set('n', '#', '#zz')
vim.keymap.set('n', 'g*', 'g*zz')
vim.keymap.set('n', 'g#', 'g#zz')
vim.keymap.set('n', '}', '}zz')
vim.keymap.set('n', '{', '{zz')


-- Terminal
vim.keymap.set('t', 'jk', '<c-\\><c-n>')
vim.keymap.set('n', '<leader>term', ':tabnew<cr>:term<cr>')
vim.keymap.set('n', '<leader>vterm', ':vsplit<cr>:term<cr>')
vim.keymap.set('n', '<leader>sterm', ':split<cr>:term<cr>')

-- Reexecute the last terminal command
vim.keymap.set('n', '<F5>', 'i<C-c><Esc>k<CR><C-\\><C-n>G')


-- Syntax
vim.keymap.set('n', '\\\\', ':syntax sync minlines=1000<cr>', { silent = true })


-- Folding
vim.keymap.set('n', '<leader>zf', '$zf%')

-- TODO: this is not working
-- Edit init.vim
-- vim.keymap.set('n', '<leader>ev', ':vsplit $MYVIMRC<CR>', { silent = true })
-- vim.keymap.set('n', '<leader>sv', ':source $MYVIMRC<CR>', { silent = true })

