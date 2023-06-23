set number
set nowrap
set sidescroll=1
tmap <Esc> <C-\><C-n>
set number
set noswapfile
set mouse=a
set background=dark

set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set autoindent
set fileformat=unix
filetype plugin indent on
syntax on

set wrap breakindent
set encoding=utf-8
set wildmode=longest,list
set cc=80
set cursorline
set ttyfast
set spell
set visualbell 
set title

set exrc

:filetype plugin on

call plug#begin('~/.vim/plugged')
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'
Plug 'ryanoasis/vim-devicons'
Plug 'godlygeek/tabular'
Plug 'elzr/vim-json'
Plug 'plasticboy/vim-markdown'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'jiangmiao/auto-pairs'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-sleuth'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'rcarriga/nvim-notify'
Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins' }
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'sbdchd/neoformat'
Plug 'davidhalter/jedi-vim'
Plug 'neomake/neomake'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }}
Plug 'preservim/nerdtree'
call plug#end()
let g:python3_host_prog = 'C:\Users\ryhunsaker\AppData\Local\Programs\Python\Python311\python.exe'
" disable autocompletion, because we use deoplete for completion
let g:jedi#completions_enabled = 0
let g:neomake_python_enabled_makers = ['flake8']
call neomake#configure#automake('nrwi', 500)
" open the go-to function in split, not another buffer
let g:jedi#use_splits_not_buffers = "right"

let g:deoplete#enable_at_startup = 1
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
colorscheme tokyonight-night

" Enable alignment
let g:neoformat_basic_format_align = 1

" Enable tab to space conversion
let g:neoformat_basic_format_retab = 1

" Enable trimmming of trailing whitespace
let g:neoformat_basic_format_trim = 1

" neovim LSP Configuration
" lua require('lua_config')

" Enable Tab / Shift Tab to cycle completion options
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
let g:completion_enable_fuzzy_match = 1
set completeopt=menuone,noinsert,noselect

autocmd StdinReadPre * let s:std_in=1

lua << EOF
vim.opt.termguicolors = true
vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]]

vim.opt.list = true
vim.opt.listchars:append "space:⋅"
vim.opt.listchars:append "eol:↴"

require("indent_blankline").setup {
    space_char_blankline = " ",
    char_highlight_list = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
        "IndentBlanklineIndent3",
        "IndentBlanklineIndent4",
        "IndentBlanklineIndent5",
        "IndentBlanklineIndent6",
    },
}
EOF

let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_conceal = 0
let g:tex_conceal = ""
let g:vim_markdown_math = 1
let g:vim_markdown_frontmatter = 1  
let g:vim_markdown_toml_frontmatter = 1  
let g:vim_markdown_json_frontmatter = 1  

augroup pandoc_syntax
    au! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
augroup END

let g:mkdp_auto_close = 0
nnoremap <M-s> :MarkdownPreview
nnoremap <M-m> :MarkdownPreviewToggle

let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeQuitOnOpen = 1
Let NERDTreeAutoDeleteBuffer = 1
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree ~/. <CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

