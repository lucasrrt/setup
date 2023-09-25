vim.keymap.set('n', '<leader>tb', ':Telescope git_branches<cr>')
vim.keymap.set('n', '<leader>tf', ':Telescope git_files<cr>')
vim.keymap.set('n', '<leader>tF', ':Telescope find_files<cr>')
vim.keymap.set('n', '<leader>ts', ':Telescope git_stash<cr>')

require("telescope").setup {
  pickers = {
    find_files = {
      mappings = {
        i = {
          ["<C-F>"] = "select_vertical",
        },
        n = {
          ["<C-F>"] = "select_vertical",
        },
      }
    },
    git_files = {
      mappings = {
        i = {
          ["<C-F>"] = "select_vertical",
        },
        n = {
          ["<C-F>"] = "select_vertical",
        },
      }
    }
  }
}
