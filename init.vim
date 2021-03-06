call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'preservim/nerdcommenter'
Plug 'zefei/vim-wintabs'
Plug 'frazrepo/vim-rainbow'
Plug 'tomasiser/vim-code-dark'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'dunstontc/vim-vscode-theme'
Plug 'easymotion/vim-easymotion'
Plug 'neoclide/coc.nvim', {'branch': 'release'},
Plug 'maxmellon/vim-jsx-pretty'
Plug 'jiangmiao/auto-pairs'
Plug 'mattn/emmet-vim'
Plug 'pangloss/vim-javascript'
Plug 'junegunn/vim-easy-align'
Plug 'kshenoy/vim-signature'
Plug 'evanleck/vim-svelte'
Plug 'codechips/coc-svelte', {'do': 'npm install'}

Plug 'honza/vim-snippets'

Plug 'inkarkat/vim-AdvancedSorters'

Plug 'voldikss/vim-floaterm'

Plug 'rust-lang/rust.vim'

"git
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'

call plug#end()

let mapleader = " "
nmap <leader>w <plug>(easymotion-w)
nmap <leader>b <plug>(easymotion-b)
nnoremap <Leader>h :set hls!<CR>
nnoremap <Leader>f :Prettier<CR>
imap jk <Esc>
imap kj <Esc>
tnoremap <Esc> <C-\><C-n>
map <C-H> <Plug>(wintabs_previous)
map <C-L> <Plug>(wintabs_next)
map <leader>t <Plug>(wintabs_close)
map <C-T>u <Plug>(wintabs_undo)
map <C-T>o <Plug>(wintabs_only)
map <C-W>c <Plug>(wintabs_close_window)
map <C-W>o <Plug>(wintabs_only_window)

nnoremap   <C-K>  :FloatermToggle<CR>
tnoremap  <C-K>  <C-\><C-n>:FloatermToggle<CR>

nnoremap <C-R> :FloatermSend cargo run<CR>:FloatermShow<CR>


nnoremap <silent> K :call CocAction('doHover')<CR>


inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

"ALIGNMENT
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Auto open nerdTree
au VimEnter *  NERDTree

let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'


"prefs
set showcmd
set nocompatible
set relativenumber
set number
set wildmenu
set path+=**
set incsearch
set hidden
set noswapfile
set ignorecase
"set completeopt=menuone,longest,preview
set shortmess+=c

set autoindent
set expandtab
set smartindent
set shiftwidth=2
set softtabstop=2
set tabstop=2

syntax enable
filetype plugin indent on
syntax on

" For vim git signs
set updatetime=100

" Floatterm width and height
let g:floaterm_width=0.8
let g:floaterm_height=0.8
let g:floaterm_positon='bottom'



" for transparent background
function! AdaptColorscheme()
   highlight clear CursorLine
   highlight Normal ctermbg=none
   highlight LineNr ctermbg=none
   highlight Folded ctermbg=none
   highlight NonText ctermbg=none
   highlight SpecialKey ctermbg=none
   highlight VertSplit ctermbg=none
   highlight SignColumn ctermbg=none
endfunction
autocmd ColorScheme * call AdaptColorscheme()

highlight Normal guibg=NONE ctermbg=NONE
highlight CursorColumn cterm=NONE ctermbg=NONE ctermfg=NONE
highlight CursorLine cterm=NONE ctermbg=NONE ctermfg=NONE
highlight CursorLineNr cterm=NONE ctermbg=NONE ctermfg=NONE
highlight clear LineNr
highlight clear SignColumn
highlight clear StatusLine


" Change Color when entering Insert Mode
autocmd InsertEnter * set nocursorline

" Revert Color to default when leaving Insert Mode
autocmd InsertLeave * set nocursorline

"" extra settings, uncomment them if necessary :) 
"set cursorline
"set noshowmode
"set nocursorline

" trasparent end

command Bd bp\|bd \#
