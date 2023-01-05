-- Use system clipboard as default clipboard
vim.opt.clipboard = "unnamedplus"
-- https://github.com/neovim/neovim/issues/1822
-- clipboard = unnamedplus modifies the block copy/paste behavior
-- To be able to copy/paste in block correctly, set clipboard-=unnamedplus

-- Search with insensitive case (and smartcase)
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Full mouse
vim.opt.mouse = "a"

-- No wrapping
vim.opt.wrap = false

-- Scrolloff offset of minimum number of lines above and under the cursor
vim.opt.scrolloff = 5

-- Open splits in right / bottom
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Jenkinsfile VIM syntax highlighting
vim.cmd [[
  au BufNewFile,BufRead Jenkinsfile setf groovy
]]

-- Dockerfile.dev as dockerfile filetype
vim.cmd [[
  au BufRead,BufNewFile Dockerfile.dev set filetype=dockerfile
]]

-- Cursor column
vim.keymap.set('n', '<leader>cc', ':set cursorcolumn!<cr>')


vim.cmd [[ iabbrev TODO TODO(lucasrrt): ]]
