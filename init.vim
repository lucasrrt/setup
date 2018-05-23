let mapleader = ","
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
"Plug 'mhartington/oceanic-next'

"Plug 'Valloric/YouCompleteMe'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'adimit/prolog.vim'
Plug 'nikvdp/ejs-syntax'
Plug 'leafgarland/typescript-vim'
Plug 'mhartington/nvim-typescript', { 'do': ':UpdateRemotePlugins' }
Plug 'tpope/vim-rails'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-eunuch'
Plug 'wesQ3/vim-windowswap'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'davisdude/vim-love-docs'
Plug 'airblade/vim-gitgutter'
Plug 'elmcast/elm-vim'
Plug 'mileszs/ack.vim'

"Ack! be the default Ack
cnoreabbrev Ack Ack!
nnoremap π :Ack!<Space> 

"Autocomplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'w0rp/ale'
"Plug to identify ejs tags
Plug 'briancollins/vim-jst'

" Plugins to change status line
Plug 'bling/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
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
let g:python2_host_prog = '/usr/bin/python2'

"UtilSnips
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

"Ctrlpvim
"let ctrlp find dotfiles
let g:ctrlp_show_hidden = 1
"remove files number limit
let g:ctrlp_max_files=0

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
"syntax enable
"colorscheme OceanicNext

"set rnu
set nu
set whichwrap+=<,>,h,l,[,]
set wrap
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
set relativenumber
map <C-k> <C-W>j
map <C-l> <C-W>k
map <C-j> <C-W>h
map <C-;> <C-W>l
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

" Colorscheme for text
hi Visual guifg=Black
hi Search guifg=Black
hi DiffAdd guifg=Black
hi DiffChange guifg=Black
hi Pmenu guifg=Black
hi TabLine guifg=Black
hi CursorColumn guifg=Black
hi CursorLine guifg=Black
hi ColorColumn guifg=Black
hi MatchParen guifg=Black
hi GitGutterAddLine guifg=Black
hi GitGutterChangeLine guifg=Black
hi GitGutterChangeDeleteLine guifg=Black
hi airline_c_to_airline_x guifg=LightGrey
hi airline_c_to_airline_x_bold guifg=LightGrey


" ale plugin: identify errors
nmap ≤ <Plug>(ale_previous_wrap)
nmap ≥ <Plug>(ale_next_wrap)

" git modifications
set updatetime=100
nmap œ <Plug>GitGutterPrevHunk
nmap ∑ <Plug>GitGutterNextHunk

" mapping alt keys
nnoremap å :m .-2<CR>==
nnoremap ß :m .+1<CR>==

inoremap å <Esc>:m .-2<CR>==gi
inoremap ß <Esc>:m .+1<CR>==gi

vnoremap å :m '<-2<CR>gv==gv
vnoremap ß :m '>+1<CR>gv==gv

"set background=dark
"uuihi cursorline   cterm=none ctermbg=235 
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
" set clipboard=unnamedplus
set clipboard=unnamed

" ctrlp ignores untracked files for git
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files']
let g:ctrlp_custom_ignore = 'DS_Store'

"let g:ctrp_map = ',p'
"let g:ctrp_cmd = 'CtrlP'

"start deoplete
let g:deoplete#enable_at_startup = 1
