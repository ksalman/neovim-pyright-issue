call plug#begin()
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
call plug#end()
lua require'lspconfig'.pyright.setup{ on_attach=require'completion'.on_attach}

