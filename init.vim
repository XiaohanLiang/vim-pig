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
set guicursor+=a:blinkon0
set belloff=all
hi Folded ctermbg=015
cnoreabbrev ack Ack

autocmd Filetype html setlocal ts=2 sw=2 expandtab
autocmd Filetype javascript setlocal ts=2 sw=2 expandtab
autocmd Filetype css setlocal ts=2 sw=2 expandtab
autocmd Filetype vue setlocal ts=2 sw=2 expandtab
augroup typescript
  au!
  autocmd BufNewFile,BufRead *.tsx  setlocal filetype=typescript ts=2 sw=2 expandtab
  autocmd BufNewFile,BufRead *.tsx  setlocal syntax=typescriptreact ts=2 sw=2 expandtab
  autocmd BufNewFile,BufRead *.ts   setlocal filetype=typescript ts=2 sw=2 expandtab
  autocmd BufNewFile,BufRead *.ts   setlocal syntax=javascript ts=2 sw=2 expandtab
augroup END


noremap <Up> <Nop>              "" 禁用方向键
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>
inoremap <C-v> <C-c>
imap <C-a> <Nop>                "" 忽略ctrl-a
map Q <Nop>                     "" 关闭ex模式
nmap <C-n> :tabprevious<cr>     "" 上/下一个标签
nmap <C-m> :tabnext<cr>
" imap <C-c> <esc>               
nmap <C-x> ZQ                   "" 退出
imap <C-j> <C-c>:w<CR>          "" 快速保存
nmap <C-j> :w<CR>
nmap <C-f> [[zt                 "" 函数置顶
imap <C-f> <esc>[[zt
nmap <C-k> :!
imap <C-k> <C-c>:!
noremap o <Nop>                 "" 将o/p切换成ctrl-o/p
noremap p <Nop>
noremap <C-o> o
noremap <C-p> p
nnoremap <C-l> <C-o>
nmap <F5> :noh<CR>
nmap <C-g> :!make<CR>                 "" 当场编译
nmap <F4> <ESC>:NERDTree<CR>          "" 打开文件树
nmap <C-w> <C-w>w                     "" 切换文件树与编辑区
autocmd StdinReadPre * let s:std_in=1 "" 没有指定文件的时候自动打开文件树
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif


call plug#begin('~/.vim/plugged')

Plug 'joshdick/onedark.vim'           " 某种主题
Plug 'scrooloose/nerdtree'            " 文件树
Plug 'vim-airline/vim-airline'        " 状态栏
Plug 'vim-airline/vim-airline-themes' " 状态栏主题
Plug 'luochen1990/rainbow'            " 彩色括号

Plug 'tpope/vim-commentary'    " 注释
Plug 'preservim/nerdcommenter' " 注释
Plug 'mileszs/ack.vim'         " ack搜索
Plug 'tpope/vim-fugitive'      " git内置
Plug 'mhinz/vim-signify'       " 显示gitdiff

Plug 'SirVer/ultisnips'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " 补全工具组
Plug 'zchee/deoplete-go', { 'do': 'make'}                     " 补全工具Golang
Plug 'honza/vim-snippets'                                     " 补全小工具组
Plug 'ervandew/supertab'                                      " tab进入补全弹窗
Plug 'jiangmiao/auto-pairs'                                   " 补齐另一个括号

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries', 'for': 'go'}  " golang 套件
Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }      " ts 套件
Plug 'Quramy/tsuquyomi', { 'for': 'typescript' }                " ts 套件
Plug 'jason0x43/vim-js-indent', { 'for': 'typescript' }         " ts 套件
Plug 'Shougo/vimproc.vim', {'do' : 'make', 'for': 'typescript'} " ts 套件

call plug#end()


let $NVIM_TUI_ENABLE_TRUE_COLOR=1
let g:onedark_termcolors=256
syntax on " 必须放在后面否则相当于没开

let g:ackprg = "/usr/local/bin/ack -s -H --nocolor --nogroup --column"
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#go#pointer = 1
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
let g:deoplete#sources#go#gocode_binary = '/go/bin/gocode'
set completeopt-=preview

let g:ycm_use_golang = 0
let g:tagbar_compact = 1
let g:ctrlp_extensions = ['tag']
let g:go_autodetect_gopath = 1
let g:rainbow_active = 1
let g:rainbow_conf = {
            \'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
            \'ctermfgs': ['blue', 'magenta', 'red', 'black'],
            \}

let g:SuperTabDefaultCompletionType = "<c-n>"
let g:SuperTabContextDefaultCompletionType = "<c-n>"
"let g:go_def_mode='godef'
let g:go_fmt_command = "goimports"
let g:NERDSpaceDelims = 1

" X - 试验区
" Plug 'ianding1/leetcode.vim'
" Plug 'vim-scripts/applescript' 
" Plug 'shougo/vimshell.vim'
"set shell=/usr/local/bin/zsh
"set shellcmdflag=-ic
"let g:leetcode_china = 1
"let g:leetcode_solution_filetype = 'golang'
"let g:leetcode_browser = 'chrome'
