vim.cmd [[ packadd packer.nvim ]]

return require('packer').startup(function(use)
  -- Plugin
  use 'wbthomason/packer.nvim'

  use 'neovim/nvim-lspconfig'

  -- File navigation
  use 'easymotion/vim-easymotion'

  -- Colorscheme
  use 'morhetz/gruvbox'

  -- TODO: reconsider
  -- quote ', parentheses (, brackets { [, tags <> manipulation and
  -- auto-completition
  use 'tpope/vim-surround'
  use 'jiangmiao/auto-pairs'

  -- TODO: reconsider
  -- Typescript syntax hightlighting
  use 'leafgarland/typescript-vim'
  use 'peitalin/vim-jsx-typescript'

  -- LSP Code completition {{{
  use { 'neoclide/coc.nvim', branch = 'release' }

  -- Fuzzy finder
  use 'junegunn/fzf'
  use 'junegunn/fzf.vim'

  -- Git related plugins
  use 'tpope/vim-fugitive'
  use 'airblade/vim-gitgutter'

  -- Comment blocks of text easily
  use 'tpope/vim-commentary'

  -- Treesitter and context
  -- nvim-treesitter-context was not working, testing this new one
  -- Plug 'nvim-treesitter/nvim-treesitter'
  -- Plug 'nvim-treesitter/nvim-treesitter-context'
  use 'wellle/context.vim'

  -- Harpoon, easy for file navigation and plenary for whatever reason
  -- Telescope
  use 'nvim-lua/plenary.nvim'
  use 'ThePrimeagen/harpoon'
  use { 'nvim-telescope/telescope.nvim', tag = '0.1.0' }

  -- Snippets
  use 'L3MON4D3/LuaSnip'

  -- Substitution with intelligent case
  use 'tpope/vim-abolish'

  -- Prisma
  use 'prisma/vim-prisma'

  -- In old configuration
  -- Plug 'posva/vim-vue'
  -- Plug 'mileszs/ack.vim'
end)
