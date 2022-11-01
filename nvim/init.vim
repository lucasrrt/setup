" Leader and localleader settings {{{
" <space> as the leader key
nnoremap <space> <nop>
let mapleader = " "

" <bs> as the localleader key
nnoremap <bs> <nop>
let maplocalleader = "\<bs>"

" Command mode without shift
nnoremap <leader>; :
" }}}

" # vim-plug
call plug#begin()

" File navigation settings {{{
Plug 'easymotion/vim-easymotion'
" <Leader> is configured as \\
" Useful commands:
" - <Leader>s find one character on the page
" map <Space><Space> <Plug>(easymotion-prefix)
map <Leader>/ <Plug>(easymotion-s2)
nmap ff <Plug>(easymotion-s)
" }}}

" Color scheme settings {{{
" Color scheme
" hi Pmenu ctermbg=DarkGray ctermfg=White
" hi CocWarningSign ctermfg=Yellow
Plug 'morhetz/gruvbox'
set termguicolors
autocmd vimenter * ++nested colorscheme gruvbox
" }}}

" quote ', parentheses (, brackets { [, tags <> manipulation and
" auto-completition
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'

" Typescript syntax hightlighting
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

" LSP Code completition {{{
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" mapping errors and warnings navigation
nnoremap <Right> :call CocAction('diagnosticNext')<CR>
nnoremap <Left> :call CocAction('diagnosticPrevious')<CR>

" mapping coc-tsserver
nmap <silent> \gd <Plug>(coc-definition)
nmap <silent> <leader>gd <Plug>(coc-definition)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> \gs :split<CR><Plug>(coc-definition)
nmap <silent> <leader>gs :split<CR><Plug>(coc-definition)
nmap <silent> \gv :vsplit<CR><Plug>(coc-definition)
nmap <silent> <leader>gv :vsplit<CR><Plug>(coc-definition)
nmap <silent> \gt :vsp<CR><Plug>(coc-definition)<C-W>T
nmap <silent> <leader>gt :vsp<CR><Plug>(coc-definition)<C-W>T
" Some suggestions of mapping
" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
nmap  <leader>gr <Plug>(coc-references)
nmap  <leader>coe :CocEnable<CR>
nmap  <leader>cod :CocDisable<CR>
nmap  <leader>cor :CocRestart<CR>

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

" Prettier with Coc.vim
command! -nargs=0 Prettier :CocCommand prettier.formatFile
" }}}

" Vue syntax
Plug 'posva/vim-vue'

Plug 'mileszs/ack.vim'

" Workdir settings {{{
" Fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
nnoremap <leader>f      :GFiles<CR>
nnoremap <leader>F      :Files<CR>
nnoremap <leader>ag     :Ag<CR>
nnoremap <leader>h      :History<CR>
nnoremap <leader>b      :Buffers<CR>

" Remove file name from Ag silver grep search
" command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, {'options': '--delimiter : --nth 4..'}, <bang>0)

" let $FZF_DEFAULT_OPTS="--ansi --preview-window 'right:60%' --layout reverse --margin=1,4 --preview 'bat --color=always --style=header,grid --line-range :300 {}'"

let $FZF_DEFAULT_OPTS="--ansi --preview-window 'right:60%' --margin=1,4 --preview 'bat --color=always --style=header,grid --line-range :300 {}'"
command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'right:50%'), <bang>0)

" command! -bang -nargs=+ -complete=dir Rag 
"         \ call fzf#vim#ag_raw(<q-args> . ' ~/Documents/Projects/',
"         \ fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}), <bang>0)

" Some suggestions for mappings
" " Fzf
" nnoremap <leader><leader> :GFiles<CR>
" nnoremap <leader>fi       :Files<CR>
nnoremap <leader>C        :Colors<CR>
" nnoremap <leader><CR>     :Buffers<CR>
" nnoremap <leader>fl       :Lines<CR>
" nnoremap <leader>ag       :Ag! <C-R><C-W><CR>
" nnoremap <leader>m        :History<CR>
" }}}

" Git settings {{{
Plug 'tpope/vim-fugitive'
" for patch adds check: https://vi.stackexchange.com/a/14888
nnoremap <silent> gs :Git<CR>
nnoremap <silent> gb :Git blame<CR>
nnoremap <silent> gl :0Gclog<CR> 

nnoremap <leader>gi :Git 

" nnoremap gl :Git pull
" nnoremap gh :Git push

Plug 'airblade/vim-gitgutter'
" ]c jump to next-hunk
" [c jump to next-hunk
nmap <Down> <Plug>(GitGutterNextHunk)
nmap ) <Plug>(GitGutterNextHunk)

nmap <Up> <Plug>(GitGutterPrevHunk)
nmap ( <Plug>(GitGutterPrevHunk)

" Wrap text for git commit body messages
au FileType gitcommit setlocal tw=72
" }}}

" Update diff markers. Can also update other things in Vim
set updatetime=200

" Database in Vim O_o
Plug 'vim-scripts/dbext.vim'
" <Leader>sbp to connect
" <Leader>sel to execute

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

" Plantuml viewer
Plug 'aklt/plantuml-syntax'
Plug 'tyru/open-browser.vim'
Plug 'weirongxu/plantuml-previewer.vim'

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

" Window management I can use <leader>w as prefix of commands
nmap <leader>w <C-w>

" * Moving between panes
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" * [TESTING] resizing panes
nnoremap <C-w>g <C-w>_<C-w>\|
" nnoremap <silent> <Up> :exe "resize " . (winheight(0) * 3/2)<CR>
" nnoremap <silent> <Down> :exe "resize " . (winheight(0) * 2/3)<CR>
" nnoremap <silent> <Right> :exe "vertical resize " . (winwidth(0) * 3/2)<CR>
" nnoremap <silent> <Left> :exe "vertical resize " . (winwidth(0) * 2/3)<CR>

" * Number of screens
nnoremap <leader>o <C-w>o

" Splits and pane management
set splitright

" Change split windows from vertical to horizontal and vice versa
map <leader>th <C-w>t<C-w>H
map <leader>tk <C-w>t<C-w>K

" Terminal
" Terminal mappings
tnoremap jk <C-\><C-n>
nnoremap <leader>term :tabnew<cr>:term<cr>
nnoremap <leader>vterm :vsplit<cr>:term<cr>
nnoremap <leader>sterm :split<cr>:term<cr>

" Terminal reexecute the last terminal command
nnoremap <F5> i<C-c><Esc>k<CR><C-\><C-n>G

" Highlighting with limit
nnoremap <silent> \\ :syntax sync minlines=1000<CR>

" Jenkinsfile VIM syntax highlighting
au BufNewFile,BufRead Jenkinsfile setf groovy

" Dockerfile.dev as dockerfile filetype
au BufRead,BufNewFile Dockerfile.dev set filetype=dockerfile

" Edit init.vim
nnoremap <silent> <leader>ev :vsplit $MYVIMRC<CR>
nnoremap <silent> <leader>sv :source $MYVIMRC<CR>

" Learn Vimscript the hard way
source ~/.config/nvim/configs/learn-vimscript-the-hard-way.vim

" Buffers selector when :buffer has more than one match
source ~/.config/nvim/configs/bufsel.vim
" Changed this buffer for the :Buffers from FZF
" nnoremap <leader>buf :buffers<cr>:buffer<space>

" Change buffer name (:help file_f)
" :file newname

" Explore directories and files
nnoremap <silent> - :Explore<cr>
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
nnoremap <silent> <leader>cn :cn<cr>
nnoremap <silent> <leader>cp :cp<cr>

" Snippets
inoremap \lam () => {}<Esc>i
inoremap \desc describe('', () => {<Return><Return>});<Esc>kkf'a
inoremap \it it('', () => {<Return>expect(true).toBe(true);<Return>});<Esc>kkf'a
inoremap \debug // eslint-disable-next-line no-debugger<Esc>o<Esc>Sdebugger;

" Tab navigation
nnoremap gr gT

" Column cursor
nnoremap <leader>cc :set cursorcolumn!<return>

" Folding
nnoremap <leader>zf $zf% 

" Capitalize single word
nnoremap <leader>U viwU

" Replacing strings with the correct first letter case
source ~/.config/nvim/configs/smartreplace.vim

nnoremap <leader>r :call SmartCaseReplace()<CR>
vnoremap <leader>r :call SmartCaseReplace()<CR>

" Jumplist mutations
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'

" Vimscript file fold settings {{{
augroup filetype_vim
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
augroup END

augroup filetype_lua
  autocmd!
  autocmd FileType lua setlocal foldmethod=marker
augroup END
" }}}
