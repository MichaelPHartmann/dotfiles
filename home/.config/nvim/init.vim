" This is Michael Hartmann's NeoVim Config

let g:coc_disable_startup_warning = 1

" These are the plugins I use
call plug#begin()

Plug 'tpope/vim-surround' " Surround
Plug 'tpope/vim-commentary' " Comments
Plug 'sheerun/vim-polyglot' " Syntax Highlighting
Plug 'vim-airline/vim-airline' " Bottom Status Bar
Plug 'thaerkh/vim-indentguides' " Simple Indentation Guides
Plug 'preservim/tagbar' " Tag Bar Viewer
Plug 'preservim/nerdtree' " Tree File Viewer
Plug 'tpope/vim-fugitive' " Git Tool
Plug 'Xuyuanp/nerdtree-git-plugin' " GIT for NerdTree
Plug 'ap/vim-css-color' " CSS Color Preview
Plug 'jaredgorski/spacecamp' " Space Camp Color Theme
Plug 'mg979/vim-visual-multi' " Multi Cursor
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Completion and Snippets Support
Plug 'yuezk/vim-js' " Javascript syntax highlighting
Plug 'maxmellon/vim-jsx-pretty' " React styling, indentation and completion

call plug#end()

" Vim standard settings
:set number relativenumber "Hybrid Side Numbers
:set autoindent " Automatic Indentation - Kinda Works
:set tabstop=2 " Columns of Space for /t
:set softtabstop=2 " Columns of Space for <Tab>
:set mouse=a " Mouse Available in All Modes
:set nocompatible " Not Compatible w/ Vi
:set path+=** " Path is all Children Folders
:set wildmenu " For Finding Things
:syntax enable " Simple Syntax Highlighting
colorscheme spacecamp
set foldmethod=indent " Allow folding at indent levels
set foldlevel=99 " Start with the file unfolded

" Set Sizing
:let g:NERDTreeWinSize=20 " Nerd Tree Size Left Sidebar
:let g:tagbar_width=40 " Tag Bar Size Right Sidebar

" Simple Autoclose Brackets
inoremap { {}<Esc>ha
inoremap ( ()<Esc>ha
inoremap [ []<Esc>ha
inoremap " ""<Esc>ha
inoremap ' ''<Esc>ha
inoremap ` ``<Esc>ha
inoremap <C-/> <Esc>gcc

" Toggle SideBars
nnoremap <C-g> :TagbarToggle<CR>
nnoremap <C-t> :NERDTreeToggle<CR>

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

nmap <silent> gd <Plug>(coc-definition) 
nmap <silent> gy <Plug>(coc-type-definition) 
nmap <silent> gi <Plug>(coc-implementation) 
nmap <silent> gr <Plug>(coc-references) 

if has("patch-8.1.1564")
  set signcolumn=number
else
  set signcolumn=no
endif

" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)
