" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.local/share/nvim/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-master branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Unmanaged plugin (manually installed and updated)
Plug '~/my-prototype-plugin'

" Oceanic next theme
Plug 'mhartington/oceanic-next'

Plug 'Valloric/YouCompleteMe'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'adimit/prolog.vim'
Plug 'nikvdp/ejs-syntax'
Plug 'leafgarland/typescript-vim'
Plug 'tpope/vim-rails'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-eunuch'

" Plugins to change status line
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
set laststatus=2
" Launch vim and run :PluginInstall

" Initialize plugin system
call plug#end()

filetype plugin indent on    " required

"YouCompleteMe
let g:ycm_confirm_extra_conf    = 0
let g:ycm_global_ycm_extra_conf = '~/.vim/ycm.py'
let g:ycm_extra_conf_vim_data   = ['&filetype']
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']

"UtilSnips
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"


au BufNewFile,BufRead *.html.ejs set filetype=html

" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"Pessoal

map <f9> :NERDTreeToggle<CR>

let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
set autoindent

" colorscheme desert

" Or if you have Neovim >= 0.1.5
if (has("termguicolors"))
 set termguicolors
endif

" Theme
syntax enable
colorscheme OceanicNext

"set rnu
set nu
set whichwrap+=<,>,h,l,[,]
set nowrap
set tabstop=4
set scrolloff=3
set hlsearch
set incsearch
set ignorecase
set nobackup
set nowritebackup
set noswapfile
set list listchars=tab:\│\  
set ts=4
set sw=4
set t_Co=256
hi Normal ctermbg=233
hi SpecialKey ctermfg=235
set mouse=nv
set timeout
set timeoutlen=0
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
map <C-Down> <C-W>j
map <C-Up> <C-W>k
map <C-Left> <C-W>h
map <C-Right> <C-W>l
map <BS> X
map <TAB> i<TAB>
map <SPACE> i<SPACE><ESC>
map ç o<ESC>O
map <ENTER> i<ENTER><ESC>
" inoremap <silent> <Esc> <Esc>`^

"set background=dark
"hi cursorline   cterm=none ctermbg=235 
"hi cursorcolumn cterm=none ctermbg=235 
"autocmd InsertLeave *  hi cursorline   cterm=none ctermbg=235
"autocmd InsertLeave *  hi cursorcolumn   cterm=none ctermbg=235
"autocmd InsertEnter *  hi cursorline   cterm=none ctermbg=black
"autocmd InsertEnter *  hi cursorcolumn   cterm=none ctermbg=black
"augroup BgHighlight
"	autocmd!
"	autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline cursorcolumn
"	autocmd WinLeave * setlocal nocursorline nocursorcolumn
"augroup END

" Default register unnamedplus
set clipboard=unnamedplus
