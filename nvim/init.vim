" <space> as the leader key
nnoremap <space> <nop>
let mapleader = " "

" # vim-plug
call plug#begin()

Plug 'easymotion/vim-easymotion'
" <Leader> is configured as \\
" Useful commands:
" - <Leader>s find one character on the page
" map <Space><Space> <Plug>(easymotion-prefix)
map <Leader>/ <Plug>(easymotion-s)
nmap f <Plug>(easymotion-s)

" quote ', parentheses (, brackets { [, tags <> manipulation and
" auto-completition
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'

" Typescript syntax hightlighting
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Color scheme
hi Pmenu ctermbg=DarkGray ctermfg=White
hi CocWarningSign ctermfg=Yellow

" mapping errors and warnings navigation
nnoremap ]] :call CocAction('diagnosticNext')<CR>
nnoremap [[ :call CocAction('diagnosticPrevious')<CR>

" mapping coc-tsserver
nmap <silent> \gd <Plug>(coc-definition)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> \gs :split<CR><Plug>(coc-definition)
nmap <silent> \gv :vsplit<CR><Plug>(coc-definition)
nmap <silent> \gt :vsp<CR><Plug>(coc-definition)<C-W>T
" Some suggestions of mapping
" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)

" Show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Refresh the suggestions
inoremap <silent><expr> <C-space> coc#refresh()

Plug 'mileszs/ack.vim'


" Fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
nnoremap <leader>f     :GFiles<CR>
nnoremap <leader>ag    :Ag<CR>
nnoremap <leader>h     :History<CR>
nnoremap <leader>b :Buffers<CR>

command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, {'options': '--delimiter : --nth 4..'}, <bang>0)

" Some suggestions for mappings
" " Fzf
" nnoremap <leader><leader> :GFiles<CR>
" nnoremap <leader>fi       :Files<CR>
" nnoremap <leader>C        :Colors<CR>
" nnoremap <leader><CR>     :Buffers<CR>
" nnoremap <leader>fl       :Lines<CR>
" nnoremap <leader>ag       :Ag! <C-R><C-W><CR>
" nnoremap <leader>m        :History<CR>

" Git
Plug 'tpope/vim-fugitive'
" for patch adds check: https://vi.stackexchange.com/a/14888
nnoremap <silent> gs :Gstatus<CR>
nnoremap <silent> gb :Gblame<CR>

" nnoremap gl :Git pull
" nnoremap gh :Git push

Plug 'airblade/vim-gitgutter'
" ]c jump to next-hunk
" [c jump to next-hunk
nmap ) <Plug>(GitGutterNextHunk)
nmap ( <Plug>(GitGutterPrevHunk)

" Update diff markers. Can also update other things in Vim
set updatetime=200

" Database in Vim O_o
Plug 'vim-scripts/dbext.vim'
" <Leader>sbp to connect
" <Leader>sel to execute
let g:dbext_default_profile_dex_dev = 'type=PGSQL:user=postgres:host=localhost:dbname=dex_development'
let g:dbext_default_profile_dex_staging = 'type=PGSQL:user=lucas.ricarte:host=dex-staging.ctjm30jokcz3.sa-east-1.rds.amazonaws.com:dbname=dex_staging'
let g:dbext_default_profile_dex_production = 'type=PGSQL:user=lucas.ricarte:host=dex-production.ctjm30jokcz3.sa-east-1.rds.amazonaws.com:dbname=dex_production'
let g:dbext_default_profile_boardsgroups_dev = 'type=PGSQL:user=postgres:host=localhost:dbname=boardsgroups_dev'
let g:dbext_default_profile_boardsgroups_staging = 'type=PGSQL:user=boardsgroups:host=db1-postgres-staging.ctjm30jokcz3.sa-east-1.rds.amazonaws.com:dbname=boardsgroups'

" TODO list in vim
Plug 'aserebryakov/vim-todo-lists'
nnoremap <silent> <leader>todo :vsplit .todo.md<CR>
augroup todo_mappings
  autocmd!
  autocmd Filetype todo setlocal linebreak
  autocmd Filetype todo setlocal wrap
  autocmd Filetype todo nnoremap <silent><buffer> <enter> :VimTodoListsToggleItem<cr>
augroup END

" Markdown
augroup markdown_mappings
  autocmd!
  autocmd Filetype markdown setlocal linebreak
  autocmd Filetype markdown setlocal wrap
augroup END

" Comment blocks of text easily
Plug 'tpope/vim-commentary'

call plug#end()

" # Default configurations

" Use system clipboard as default clipboard
set clipboard+=unnamedplus
" https://github.com/neovim/neovim/issues/1822
" clipboard = unnamedplus modifies the block copy/paste behavior
" To be able to copy/paste in block correctly, set clipboard-=unnamedplus

" Show line number and relative
set relativenumber
set number

" Set tabsize to 2 spaces
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab 

" Search with insensitive case (and smartcase)
set ignorecase
set smartcase

" Full mouse
set mouse=a

" No wrapping
set nowrap

" Avoid escape
imap jk <Esc>

" Stop commenting next line
set formatoptions=jcql

" Register yank history
function! SaveLastReg()
  if v:event['regname']==""
    if v:event['operator']=='y'
      for i in range(8,1,-1)
        exe "let @".string(i+1)."=@".string(i) 
      endfor
      if exists("g:last_yank")
        let @1=g:last_yank
      endif
      let g:last_yank=@"
    endif 
  endif
endfunction 

augroup text_yank
  autocmd!
  autocmd TextYankPost * call SaveLastReg()
augroup END

" Scrolloff offset of minimum number of lines above and under the cursor
set scrolloff=5

" Center the results of the search
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz
nnoremap } }zz
nnoremap { {zz

" Window management
" * Moving between panes
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" * [TESTING] resizing panes
nnoremap <C-w>g <C-w>_<C-w>\|
nnoremap <silent> <Up> :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Down> :exe "resize " . (winheight(0) * 2/3)<CR>
nnoremap <silent> <Right> :exe "vertical resize " . (winwidth(0) * 3/2)<CR>
nnoremap <silent> <Left> :exe "vertical resize " . (winwidth(0) * 2/3)<CR>

" * Number of screens
nnoremap <leader>o <C-w>o

" Terminal
" Terminal mappings
tnoremap bb <C-\><C-n>
nnoremap <leader>term :tabnew<cr>:term<cr>
nnoremap <leader>vterm :vsplit<cr>:term<cr>
nnoremap <leader>sterm :split<cr>:term<cr>

" Terminal reexecute the last terminal command
nnoremap <F5> i<C-c><Esc>k<CR><C-\><C-n>G

" Highlighting with limit
nnoremap <silent> \\ :syntax sync minlines=1000<CR>

" Jenkinsfile VIM syntax highlighting
au BufNewFile,BufRead Jenkinsfile setf groovy

" Edit init.vim
nnoremap <silent> <leader>ev :vsplit $MYVIMRC<CR>
nnoremap <silent> <leader>sv :source $MYVIMRC<CR>

" Learn Vimscript the hard way
source ~/.config/nvim/configs/learn-vimscript-the-hard-way.vim

" Buffers selector when :buffer has more than one match
source ~/.config/nvim/configs/bufsel.vim
" Changed this buffer for the :Buffers from FZF
" nnoremap <leader>buf :buffers<cr>:buffer<space>

" Explore directories and files
nnoremap <silent> <leader>ex :Explore<cr>
nnoremap <silent> <leader>vex :Vexplore<cr>
nnoremap <silent> <leader>hex :Hexplore<cr>
" augroup netrw
"   autocmd!
"   autocmd FileType netrw :nnoremap <buffer> <c-

" Quickfix List
" :copen " Open the quickfix window
" :ccl   " Close it
" :cw    " Open it if there are 'errors', close it otherwise (some people prefer this)
" :cn    " Go to the next error in the window
" :cp    " Go to the previous error in the window
" :cnf   " Go to the first error in the next file
" :.cc   " Go to error under cursor (if cursor is in quickfix window)

" Snippets
inoremap \lam () => {}<Esc>i
inoremap \desc describe('', () => {<Return><Return>});<Esc>kkf'a
inoremap \it it('', () => {<Return>expect(true).toBe(true);<Return>});<Esc>kkf'a

" Tab navigation
nnoremap gr gT

" Column cursor
nnoremap <leader>cc :set cursorcolumn!<return>
