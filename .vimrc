set nocompatible              " be iMproved, required
set wildmenu                  " vim 自身命令行模式只能补全
"set gcr=a:block-blinkon0     " 禁止光标闪烁
set cursorline                " 高亮显示当前行
set cursorcolumn              " 高亮显示当前列
filetype off                  " required

" set the runtime path to include Vundle and initialize
 set rtp+=~/.vim/bundle/Vundle.vim
 call vundle#begin()
" " alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')
"
" " let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Plugin 'Raimondi/delimitMate'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'thinca/vim-quickrun'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'vim-scripts/matchit.zip'
Plugin 'kshenoy/vim-signature'
Plugin 'terryma/vim-expand-region'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'bling/vim-airline'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'majutsushi/tagbar'
Plugin 'hdima/python-syntax'
Plugin 'kevinw/pyflakes-vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'Lokaltog/vim-powerline'
Plugin 'shanzi/autoHEADER'
Plugin 'octol/vim-cpp-enhanced-highlight'
"lua plugins
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-lua-ftplugin'
Plugin 'rdnetto/YCM-Generator'


call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
""
" Brief help
" " :PluginList       - lists configured plugins
" " :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" " :PluginSearch foo - searches for foo; append `!` to refresh local cache
" " :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal
" "
" " see :h vundle for more details or wiki for FAQ
" " Put your non-Plugin stuff after this line
" "
"
" "YouCompleteMe setting

let g:ycm_path_to_python_interpreter='/usr/bin/python'
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'
nnoremap <leader>gc :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gd :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gr :YcmCompleter GoToReferences<CR>

set nu
set mouse=a
set history=2000
set autoread
set noswapfile
set magic    "For regular expressions
set ruler
" 命令行（在状态行下）的高度，默认为1，这里是2
set statusline=%<%f\ %h%m%r%=%k[%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}]\ %-14.(%l,%c%V%)\ %P
" Always show the status line - use 2 lines for the status bar
set laststatus=2
set showmatch    "Show the matching bracket"
set hlsearch
set incsearch
set ignorecase
set smartcase

let mapleader = ','
let g:mapleader = ','

syntax on

filetype on
filetype indent on
filetype plugin on

"Keep contents in terminal after exiting vim
"set t_ti= t_te=
"create undo file
if has('persistent_undo')
  set undolevels=1000         " How many undos
  set undoreload=10000        " number of lines to save for undo
  set undofile                " So is persistent undo ...
  set undodir=/tmp/vimundo/
endif
" 代码折叠
set foldenable
" 折叠方法
" " manual    手工折叠
" " indent    使用缩进表示折叠
" " expr      使用表达式定义折叠
" " syntax    使用语法定义折叠
" " diff      对没有更改的文本进行折叠
" " marker    使用标记进行折叠, 默认标记是 {{{ 和 }}}
set foldmethod=indent
set foldlevel=99
" 代码折叠自定义快捷键
let g:FoldMethod = 0
map <leader>zz :call ToggleFold()<cr>
fun! ToggleFold()
    if g:FoldMethod == 0
        exe "normal! zM"
        let g:FoldMethod = 1
    else
        exe "normal! zR"
        let g:FoldMethod = 0
    endif
endfun
set smartindent   " Smart indent
set autoindent    " 打开自动缩进

" tab相关变更
set tabstop=4     " 设置Tab键的宽度        [等同的空格个数]
set shiftwidth=4  " 每一次缩进对应的空格数
set softtabstop=4 " 按退格键时可以一次删掉 4 个空格
set smarttab      " insert tabs on the start of a line according to shiftwidth, not tabstop 按退格键时可以一次删掉 4 个空格
set expandtab     " 将Tab自动转化成空格    [需要输入真正的Tab键时，使用 Ctrl+V + Tab]
set shiftround    " 缩进时，取整 use multiple of shiftwidth when indenting with '<' and '>'

" 自动补全配置
" "让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
set completeopt=longest,menu
"Treat long lines as break lines (useful when moving around in them)
""se swap之后，同物理行上线直接跳
nnoremap k gk
nnoremap gk k
nnoremap j gj
nnoremap gj j

" I can type :help on my own, thanks.  Protect your fat fingers from the evils
" of <F1>
noremap <F1> <Esc>"
"Smart way to move between windows 分屏窗口移动
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

"Map ; to : and save a million keystrokes
"" ex mode commands made easy 用于快速进入命令行
nnoremap ; :
" 命令行模式增强，ctrl - a到行首， -e 到行尾
cnoremap <C-j> <t_kd>
cnoremap <C-k> <t_ku>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
"Keep search pattern at the center of the screen."
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz
" for # indent, python文件中输入新行时#号注释不切回行首
autocmd BufNewFile,BufRead *.py inoremap # X<c-h>#
autocmd BufWritePost $MYVIMRC source $MYVIMRC

" select all
map <Leader>sa ggVG"
"
" w!! to sudo & write a file
cmap w!! w !sudo tee >/dev/null %
" 滚动Speed up scrolling of the viewport slightly
nnoremap <C-e> 2<C-e>
nnoremap <C-y> 2<C-y>

nnoremap U <C-r>

" 保存python文件时删除多余空格
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd FileType c,cpp,java,go,php,javascript,puppet,python,rust,twig,xml,yml,perl autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()


" 定义函数AutoSetFileHead，自动插入文件头
autocmd BufNewFile *.sh,*.py exec ":call AutoSetFileHead()"
function! AutoSetFileHead()
    "如果文件类型为.sh文件
    if &filetype == 'sh'
        call setline(1, "\#!/bin/bash")
    endif

    "如果文件类型为python
    if &filetype == 'python'
        call setline(1, "\#!/usr/bin/env python")
        call append(1, "\# encoding: utf-8")
    endif

    normal G
    normal o
    normal o
endfunc

" theme主题
 "set background=dark
 set t_Co=256
"colorscheme sexy-railscasts
"colorscheme vividchalk
"colorscheme railscasts
"colorscheme molokai
"colorscheme blackboard
"colorscheme codeschool
colorscheme jellybeans

"codeschool color config
"set guifont=Monaco:h12
""let g:NERDTreeWinPos = "right"
"set guioptions-=T " Removes top toolbar
"set guioptions-=r " Removes right hand scroll bar
"set go-=L " Removes left hand scroll bar"

"Let vim remember the line when reopen
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

map <F8> :NERDTreeToggle<CR>
nmap <F9> :TagbarToggle<CR>

nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

"Show current row and col number
set ruler
"Show current command
set showcmd
"Show current mode
set showmode

"Retain lines while moving cursor
set scrolloff=7


"tab operation
map <leader>th :tabfirst<cr>
map <leader>tl :tablast<cr>

map<leader>k :tabnext<cr>
map<leader>j :tabprev<cr>
"map<C-Tab> : tabnext<cr>
"map<C-S-Tab> : tabprev<cr>

map<leader>te :tabedit<cr>
map<leader>td :tabclose<cr>
map<leader>tm :tabm<cr>

"switch to exact tab under normal mode
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

"Create new tab
nnoremap <C-t>  :tabnew<CR>
inoremap <C-t>  <Esc>:tabnew<CR>

"Yank selected to system clipboard
vnoremap <leader>y "+y
"Paste from system clipboard
nnoremap <leader>p "+p

"Select block
nnoremap <leader>v V`}

"udt configuration. for cpp code self-defined-class syntax highlight
let g:udt_recursive=1
let g:udt_typedef_atts="guifg=red ctermfg=white gui=bold"
let g:udt_struct_atts="guifg=blue ctermfg=white gui=bold"
let g:udt_class_atts="guifg=green ctermfg=white gui=bold"
"let g:udt_dynamic_laod

"autoheader setting
let g:autoHEADER_auto_enable=0
let g:autoHEADER_default_author="Ye Yangang"
let g:autoHEADER_fill_char_repeat=80

"lua settings
let g:lua_compiler_name = '/usr/local/bin/luajit'
