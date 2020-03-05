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

autocmd Filetype html setlocal ts=2 sw=2 expandtab
autocmd Filetype javascript setlocal ts=2 sw=2 expandtab
autocmd Filetype css setlocal ts=2 sw=2 expandtab
autocmd Filetype vue setlocal ts=2 sw=2 expandtab

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

syntax on

" Vim NerdTree Settings
map <F3> :nohlsearch<CR>
nmap <F4> <ESC>:NERDTree<CR>
"Smart way to move between windows
"map <C-j> <C-W>j
"map <C-k> <C-W>k
"map <C-h> <C-W>h
"map <C-l> <C-W>l


inoremap <C-s> <esc> 
nnoremap <C-s> i

autocmd Filetype go nmap <C-[> :GoReferrers<CR>
autocmd Filetype go imap <C-[> <esc>:GoReferrers<CR>

nmap <C-h> H
nmap <C-m> M
nmap <C-l> L

inoremap <C-e> <esc>$a
inoremap <C-a> <esc>0i

call plug#begin('~/.vim/plugged')

"colorscheme
Plug 'joshdick/onedark.vim'

"tree and tagbar
Plug 'scrooloose/nerdtree'
" Plug 'majutsushi/tagbar'
" Plug 'pseewald/nerdtree-tagbar-combined'
" Plug 'jistr/vim-nerdtree-tabs'

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

"php
"Plug 'spf13/PIV'
"Plug 'arnaud-lb/vim-php-namespace'
"Plug 'beyondwords/vim-twig'

" Javascript
"Plug 'elzr/vim-json'
"Plug 'groenewege/vim-less'
"Plug 'pangloss/vim-javascript'
"Plug 'briancollins/vim-jst'
"Plug 'kchmck/vim-coffee-script'

" TypeScript
"Plug 'leafgarland/typescript-vim'
" Plug 'mhartington/nvim-typescript'

" Vue
"Plug 'posva/vim-vue'
"Plug 'w0rp/ale'
" be sure to read full install instructions. this still needs
" you to cd ~/.vim/plugged/YouCompleteMe
" python ./install.py --js-completer
"Plug 'Valloric/YouCompleteMe'
"Plug 'ap/vim-css-color'
"Plug 'leafgarland/typescript-vim'

" Dart
"Plug 'dart-lang/dart-vim-plugin'

call plug#end()

" let dart_style_guide = 2

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

let g:ale_fixers = {'vue': ['remove_trailing_lines', 'trim_whitespace']}
let g:ale_fix_on_save = 1

"let b:ale_linters = ['eslint']
"let g:ale_linters = {'javascript': ['eslint']}
"let g:ale_linter_aliases = {'vue': ['javascript', 'html', 'scss']}

let g:ale_linter_aliases = {'vue': ['vue', 'javascript']}
let g:ale_linters = {'vue': ['eslint', 'vls']}

" Do not lint or fix minified files.
let g:ale_pattern_options = {
\ '\.min\.js$': {'ale_linters': [], 'ale_fixers': []},
\ '\.min\.css$': {'ale_linters': [], 'ale_fixers': []},
\}
" If you configure g:ale_pattern_options outside of vimrc, you need this.
let g:ale_pattern_options_enabled = 1

"let g:ale_linters_explicit = 1

let g:ale_completion_enabled = 0

let g:go_def_mode = 'godef'

"let g:deoplete#sources#go#package_dot = 1

"let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"

"map <C-n> :cnext<CR>
"map <C-m> :cprevious<CR>
"nnoremap <leader>a :cclose<CR>
let g:go_fmt_command = "goimports"

let g:nvim_typescript#default_mappings = 1
