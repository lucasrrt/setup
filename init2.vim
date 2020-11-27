" # vim-plug
call plug#begin()

Plug 'easymotion/vim-easymotion'
" <Leader> is configured as \\
" Useful commands:
" - <Leader>s find one character on the page

Plug 'tpope/vim-surround'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Color scheme
hi Pmenu ctermbg=DarkGray ctermfg=White
hi CocWarningSign ctermfg=Yellow

" mapping errors and warnings navigation
nnoremap ]x :call CocAction('diagnosticNext')<CR>
nnoremap [x :call CocAction('diagnosticPrevious')<CR>

" mapping coc-tsserver
nmap <silent> \gd <Plug>(coc-definition)
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


Plug 'mileszs/ack.vim'


" Fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
nnoremap <leader>f :GFiles<CR>
nnoremap <leader>ag :Ag<CR>
nnoremap <leader>h :History<CR>

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

Plug 'airblade/vim-gitgutter'
" ]c jump to next-hunk
" [c jump to next-hunk

" Update diff markers. Can also update other things in Vim
set updatetime=200

" Database in Vim O_o
Plug 'vim-scripts/dbext.vim'
" <Leader>sbp to connect
" <Leader>sel to execute
let g:dbext_default_profile_dex_staging = 'type=PGSQL:user=lucas.ricarte:host=dex-staging.ctjm30jokcz3.sa-east-1.rds.amazonaws.com:dbname=dex_staging'
let g:dbext_default_profile_dex_dev = 'type=PGSQL:user=postgres:host=localhost:dbname=dex_development'

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

:autocmd TextYankPost * call SaveLastReg()

" Scrolloff offset of minimum number of lines above and under the cursor
set scrolloff=5

" Center the results of the search
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

" Moving between panes
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" [TESTING] resizing panes
nnoremap <C-w>g <C-w>_<C-w>\|
nnoremap <silent> <Up> :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Down> :exe "resize " . (winheight(0) * 2/3)<CR>
nnoremap <silent> <Right> :exe "vertical resize " . (winwidth(0) * 3/2)<CR>
nnoremap <silent> <Left> :exe "vertical resize " . (winwidth(0) * 2/3)<CR>

" Terminal mappings
tnoremap <Esc> <C-\><C-n>
tnoremap <leader><Esc> <Esc>

