call plug#begin(stdpath('config').'/plugged')
    " Utilities
    Plug 'petertriho/nvim-scrollbar'           " Diagnostic scrollbar
    Plug 'kevinhwang91/nvim-hlslens'           " Show search result better -> Can be displayed with diagnostic scrollbar above
    Plug 'mcauley-penney/tidy.nvim'            " Auto clean trailing whitespace, empty lines at the end of the buffer when save
    Plug 'simrat39/symbols-outline.nvim'       " See outline and all scope of code
    Plug 'jghauser/mkdir.nvim'                 " Automatically creates missing directories on saving
    Plug 'ziontee113/icon-picker.nvim'         " Icon picker
        Plug 'stevearc/dressing.nvim'              " -> UI for icon picker
    Plug 'ZhiyuanLck/smart-pairs'              " Auto add close bracket
    Plug 'luochen1990/rainbow'                 " Highlight brackets in a pair
    Plug 'lukas-reineke/indent-blankline.nvim' " Highlight block code
    Plug 'ziontee113/color-picker.nvim'        " Color picker
    Plug 'folke/which-key.nvim'                " Suggest key
    Plug 'utilyre/barbecue.nvim'               " Display block of code on winbar where cursor is hoverring
        Plug 'SmiteshP/nvim-navic'                 " -> LSP textDocument/documentSymbol provider, used by barbecue. Denending on nvim-lspconfig
    Plug 'folke/trouble.nvim'                  " Diagnose window using LSP
    Plug 'itchyny/vim-cursorword'              " Highlight current word and others under the cursor
    Plug 'kosayoda/nvim-lightbulb'             " Display a lightbulb when have a hint
    Plug 'kylechui/nvim-surround'              " Add bracket surround code

    " HTML Support
    Plug 'mattn/emmet-vim'                     " Add tag surround
    Plug 'alvan/vim-closetag'                  " Auto close tag
    Plug 'NvChad/nvim-colorizer.lua'           " Highlight color

    " LSP Support
    Plug 'neovim/nvim-lspconfig'             
    Plug 'williamboman/mason.nvim'           
    Plug 'williamboman/mason-lspconfig.nvim' 

    " Autocompletion Engine
    Plug 'hrsh7th/nvim-cmp'         
    Plug 'hrsh7th/cmp-nvim-lsp'    
    Plug 'hrsh7th/cmp-buffer'       
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/cmp-cmdline'         
    Plug 'saadparwaiz1/cmp_luasnip' 
    Plug 'hrsh7th/cmp-nvim-lua'     

    "  Snippets
    Plug 'L3MON4D3/LuaSnip'             
    Plug 'rafamadriz/friendly-snippets' 

    Plug 'VonHeikemen/lsp-zero.nvim', {'branch': 'v1.x'}

    " Find file, string browser 
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
        " Additional plugin for Telescope
        Plug 'nvim-telescope/telescope-file-browser.nvim'             " File browse telescope plugin
        Plug 'debugloop/telescope-undo.nvim'                          " Undo tree
    
    " Syntax highlight
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'nvim-treesitter/nvim-treesitter-textobjects'
    Plug 'nvim-treesitter/playground'                                 " Analyze syntax

    " Terminal manager
    Plug 'voldikss/vim-floaterm'

    " Tabline
    Plug 'romgrk/barbar.nvim'

    " File browser
    Plug 'nvim-tree/nvim-tree.lua'

    " Comment
    Plug 'preservim/nerdcommenter'
    Plug 'folke/todo-comments.nvim'      " Comment highlight
    Plug 'LudoPinelli/comment-box.nvim'  " Create box for comments

    " Icons
    Plug 'nvim-tree/nvim-web-devicons'   " Icon for file browser, file search, etc -> (OPTIONAL of many plugin) 

    " Theme
    Plug 'NTBBloodbath/doom-one.nvim'    " Better theme for barbar.nvim

    " Status bar
    Plug 'nvim-lualine/lualine.nvim'

    " Source code version control 
    Plug 'tpope/vim-fugitive'                     " Git infomation 
    Plug 'tpope/vim-rhubarb' 
    Plug 'airblade/vim-gitgutter'                 " Git show changes 
    Plug 'samoshkin/vim-mergetool'                " Git merge
call plug#end()

" Load general settings first
execute 'source' './general.vim'

" Load plugin settings
for setting_file in split(glob(stdpath('config').'/settings/*.*'))
    execute 'source' setting_file
endfor

syntax on
"  colorscheme onedark
colorscheme doom-one



" Some other plugins
"   Highlight color under cursor:
"       osyo-manga/vim-brightest      
"       dominikduda/vim_current_word 

" Status bar:
"       vim-airline/vim-airline
"       vim-airline/vim-airline-themes

" Theme:
"       joshdick/onedark.vim

" Icon on tab for vim-airline
"       ryanoasis/vim-devicons