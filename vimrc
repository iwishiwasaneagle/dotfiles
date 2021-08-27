" Install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.vim/plugged')

Plug 'Valloric/YouCompleteMe'
Plug 'farmergreg/vim-lastplace'
Plug 'Yggdroot/indentLine'
Plug 'ryanoasis/vim-devicons'
Plug 'preservim/nerdtree'
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'mhinz/vim-signify', { 'branch': 'legacy' }

call plug#end()

" Colour Scheme
set termguicolors
set background=dark
colorscheme gruvbox
let g:gruvbox_contrast_dark='hard'

let mapleader=','

" Input mode settings
set cursorline
autocmd InsertEnter * highlight CursorLine guifg=white guibg=#689d6a ctermfg=white ctermbg=blue
autocmd InsertEnter * highlight CursorLineNr guifg=white guibg=#689d6a ctermfg=white ctermbg=blue
autocmd InsertLeave * highlight CursorLine guifg=white guibg=#3c3836 ctermfg=white ctermbg=darkblue
autocmd InsertLeave * highlight CursorLineNr guifg=white guibg=#3c3836 ctermfg=white ctermbg=blue

" Alacritty colour fix
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48:2;%lu;%lu;%lum"

" Numbering
set synmaxcol=0
set number relativenumber nu

" Update time for signify
autocmd ColorScheme * highlight! link SignColumn LineNr
set updatetime=100

" Use system keyboard
set clipboard=unnamedplus

" Makes the backspace key behave like you'd expect, and go through EVERYTHINuG
set backspace=indent,eol,start

" Searching ignores case unless an upper case letter is present in the query
set ignorecase smartcase

"Begin searching while typing, hightlighting matches
set incsearch hlsearch

" Automatic Syntax for code
syntax on
set laststatus=2
" Dont wrap long lines
set nowrap
set smarttab
" Use spaces instead of tabs
set expandtab
" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4
" Linebreak on 500 characters
set lbr
set tw=500
set autoindent smartindent "Smart automatic indent
" Don't create swap files
set noswapfile
" enable mouse clicks
set mouse=a
" show whitespace
set list 
" edit conceallevel to 0
set conceallevel=0

" disbale capital q and w commands
cabbrev W w
cabbrev Q q

" Remove all trailing whitespace by pressing F5
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

" YCM bindings {
nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_global_ycm_extra_conf = '~/.vim/plugged/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_semantic_triggers = { 'cpp': [ 're!.' ] }
" }

" Tab keybinds {
map <F7> :tabp <CR>
map <F8> :tabn <CR>
" }

" Disable Arrow keys -> you gotta learn hjkl somehow bro
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

"NERDTREE SETTINGS {{
" set fillchars=
map <C-n> :NERDTreeToggle<CR>
" map <C-N> :NERDTreeFind<CR>
" Close NERDtree when files was opened
let NERDTreeQuitOnOpen=1
" " Display arrows instead of ascii art in NERDTree
" let NERDTreeDirArrows=1
" Change current working directory based on root directory in NERDTree
let NERDTreeChDirMode=2
" Start NERDTree in minimal UI mode (No help lines)
" let NERDTreeMinimalUI=1
let g:indentLine_char = '┊'
let g:NERDTreeWinSize=50
" }
