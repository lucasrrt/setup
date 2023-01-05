vim.keymap.set('n', '<leader>f', ':GFiles<CR>')
vim.keymap.set('n', '<leader>F', ':Files<CR>')
vim.keymap.set('n', '<leader>ag', ':Ag<CR>')
vim.keymap.set('n', '<leader>h', ':History<CR>')
vim.keymap.set('n', '<leader>b', ':Buffers<CR>')

vim.cmd [[
  let $FZF_DEFAULT_OPTS="--ansi --preview-window 'right:60%' --margin=1,4 --preview 'bat --color=always --style=header,grid --line-range :300 {}'"
  command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'right:50%'), <bang>0)
]]
