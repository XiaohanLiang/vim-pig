set novisualbell
set nocompatible
set expandtab
set tabstop=4
set softtabstop=4
set nu
set autoindent
set cindent shiftwidth=4
set fileencodings=utf-8,gbk
set termencoding=utf-8
set encoding=utf-8
set bs=indent,eol,start

set cursorline
set hlsearch
set backspace=eol,start,indent
set smartindent
set incsearch
set background=light
set relativenumber
syntax on

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
    let g:onedark_termcolors=256
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
      "set termguicolors
  endif
endif

autocmd Filetype html setlocal ts=2 sw=2 expandtab
autocmd Filetype javascript setlocal ts=2 sw=2 expandtab
autocmd Filetype css setlocal ts=2 sw=2 expandtab
autocmd Filetype vue setlocal ts=2 sw=2 expandtab
autocmd Filetype go nmap <C-[> :GoReferrers<CR>
autocmd Filetype go imap <C-[> <esc>:GoReferrers<CR>
autocmd Filetype go nmap <C-f> :GoFillStruct<CR>

"General Settings
""disable ex mode
map Q <Nop>
""jump to line end/begining at insert mode
inoremap <C-e> <esc>$a
inoremap <C-a> <esc>0i


"NerdTree Settings
map <F3> :nohlsearch<CR>
""open nerdtree
nmap <F4> <ESC>:NERDTree<CR>
""open nerdtree when no file was specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
""switch between nerdtree and editor
nmap <C-w> <C-w>w
nmap <C-h> H
nmap <C-m> M
nmap <C-l> L
nmap <C-x> :q<CR>


call plug#begin('~/.vim/plugged')

"colorscheme
Plug 'joshdick/onedark.vim'

"tree and tagbar
Plug 'scrooloose/nerdtree'

"tag
Plug 'ctrlpvim/ctrlp.vim'

"style
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'luochen1990/rainbow'

"completion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'ervandew/supertab'
Plug 'jiangmiao/auto-pairs'
Plug 'zchee/deoplete-go', { 'do': 'make'}
Plug 'mileszs/ack.vim'

"git
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'

"golang
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'jodosha/vim-godebug'

call plug#end()

let g:ackprg = 'ag --nogroup --nocolor --column --ignore-dir=vendor --ignore-dir=doc --ignore-dir=.git'
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#go#pointer = 1
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
let g:deoplete#sources#go#gocode_binary = '/go/bin/gocode'
let g:ycm_use_golang = 0
let g:tagbar_compact = 1
let g:ctrlp_extensions = ['tag']
let g:go_autodetect_gopath = 1
let g:rainbow_active = 0
let g:rainbow_conf = {
            \'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
            \'ctermfgs': ['blue', 'magenta', 'red', 'black'],
            \}

let g:SuperTabDefaultCompletionType = "<c-n>"
let g:SuperTabContextDefaultCompletionType = "<c-n>"
let g:go_def_mode = 'godef'
let g:go_fmt_command = "goimports"

