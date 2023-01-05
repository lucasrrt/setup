-- Get file name

vim.keymap.set('n', 'cp', ':let @* = expand("%")<cr>')
vim.keymap.set('n', 'cP', ':let @* = expand("%:p")<cr>')
vim.keymap.set('n', 'co', ':let @* = expand("%:t")<cr>')

vim.cmd [[
" Copy file github url into clipboard
" TODO: make it work for https repos (only working for ssh because of the
" regex that searches for a :)
" TODO: Check if branch is online. If not, get the name in green branch
" nnoremap cu :let @* = 'https://github.com/Faire/web-retailer/blob/master/'.expand("%")<cr>
function! GetGithubURL(...)
  let github_base_url = 'https://github.com/' 
  let github_blob = '/blob/'
  let github_current_branch = substitute(system('git rev-parse --abbrev-ref HEAD'), '\n', '', '')

  " Get branch_argument from the first argument and checks if there's more
  " than 0 parameters
  let branch_argument = get(a:, 1, 0)
  let branch = a:0 > 0 ? branch_argument : github_current_branch
  let github_branch = branch.'/'

  let org_and_repo = substitute(system("git remote get-url origin"), '^.*:\(.*\)\n', '\1', '')
  let filename_with_path = expand("%")

  let github_line_number = '#L'
  let linenumber = line(".")

  return github_base_url.org_and_repo.github_blob.github_branch.filename_with_path.github_line_number.linenumber
endfunction

function! CopyToClipboard(string)
  let @* = a:string
endfunction

function! GetGithubURLInClipboard(...)
  " TODO: only pass the param if it receives one
  call CopyToClipboard(GetGithubURL(get(a:, 1, 0)))
endfunction

" TODO get 'main' branch
nnoremap <silent> cu :let @* = GetGithubURL('master')<cr>
nnoremap <silent> cU :let @* = GetGithubURL()<cr>
]]
