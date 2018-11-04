""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" go
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()
Bundle 'gmarik/vundle'

call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'fatih/vim-go'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

Bundle 'majutsushi/tagbar'
"输入:Tagbar就可以打开tagbar，右侧的窗口会显示一系列符号。
nmap tb :TagbarToggle<CR>
" tagbar可以在加载代码时自动打开
autocmd BufReadPost *.go,*.cpp,*.c,*.h,*.hpp,*.cc,*.cxx call tagbar#autoopen()
" 打开时自动focus
let g:tagbar_autofocus = 1

"可以通过Ctrl + ]跳至符号定义处，Ctrl + t返回。
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 显示相关
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable
"set background=dark
"colorscheme solarized
"set  t_ti= t_te=
"set cc=120
"set shortmess=atI   " 启动的时候不显示那个援助乌干达儿童的提示
set go=             " 不要图形按钮
"color asmanian2     " 设置背景主题
"set guifont=Courier_New:h10:cANSI   " 设置字体
syntax on           " 语法高亮
autocmd InsertLeave * se nocul  " 用浅色高亮当前行
autocmd InsertEnter * se cul    " 用浅色高亮当前行
"set ruler           " 显示标尺
set showcmd         " 输入的命令显示出来，看的清楚些
set scrolloff=3     " 光标移动到buffer的顶部和底部时保持3行距离
set nocompatible  "去掉讨厌的有关vi一致性模式，避免以前版本的一些bug和局限
" 显示中文帮助
if version >= 603
    set helplang=cn
    set encoding=utf-8
endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"新文件标题
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"新建.c,.h,.sh,.java文件，自动插入文件头
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.java exec ":call SetTitle()"
"定义函数SetTitle，自动插入文件头
func SetTitle()
    "如果文件类型为.sh文件
    if &filetype == 'sh'
        call setline(1,          "\#########################################################################")
        call append(line("."),   "\# File     : ".expand("%"))
        call append(line(".")+1, "\# Author   : libingli")
        call append(line(".")+2, "\# Created  : ".strftime("%c"))
        call append(line(".")+3, "\#########################################################################")
        call append(line(".")+4, "\#!/bin/bash")
        call append(line(".")+5, "")
    else
        call setline(1,          "/*************************************************************************")
        call append(line("."),   " * File     : ".expand("%"))
        call append(line(".")+1, " * Author   : libingli")
        call append(line(".")+2, " * Created  : ".strftime("%c"))
        call append(line(".")+3, "*************************************************************************/")
        call append(line(".")+4, "")
    endif
    autocmd BufNewFile * normal G
endfunc
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"实用设置
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 设置当文件被改动时自动载入
set autoread
" quickfix模式
autocmd FileType c,cpp map <buffer> <leader><space> :w<cr>:make<cr>
"代码补全
set completeopt=preview,menu
"允许插件
filetype plugin on
"共享剪贴板
set clipboard+=unnamed
"从不备份
set nobackup
"make 运行
:set makeprg=g++\ -Wall\ \ %
"自动保存
set autowrite
set ruler                   " 打开状态栏标尺
"set cursorline              " 突出显示当前行
set magic                   " 设置魔术
set guioptions-=T           " 隐藏工具栏
set guioptions-=m           " 隐藏菜单栏
" 设置在状态行显示的信息
set foldcolumn=0
set nocompatible
" 语法高亮
set syntax=on
" 去掉输入错误的提示声音
set noeb
" 在处理未保存或只读文件的时候，弹出确认
set confirm
" 自动缩进
"set autoindent
"set cindent
" Tab键的宽度
set tabstop=4
" 统一缩进为4
set softtabstop=4
set shiftwidth=4
" 不要用空格代替制表符
"set noexpandtab
set expandtab
" 在行和段开始处使用制表符
"set smarttab
" 显示行号
set number
" 历史记录数
set history=1000
"禁止生成临时文件
set nobackup
set noswapfile
"搜索忽略大小写
set ignorecase
"搜索逐字符高亮
set hlsearch
set incsearch
"行内替换
set gdefault
"编码设置
set enc=utf-8
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
"语言设置
set langmenu=zh_CN.UTF-8
set helplang=cn
" 命令行（在状态行下）的高度，默认为1，这里是2
"set cmdheight=2
" 侦测文件类型
filetype on
" 载入文件类型插件
filetype plugin on
" 为特定文件类型载入相关缩进文件
filetype indent on
" 保存全局变量
set viminfo+=!
" 带有如下符号的单词不要被换行分割
set iskeyword+=_,$,@,%,#,-
" 字符间插入的像素行数目
set linespace=0
" 增强模式中的命令行自动完成操作
set wildmenu
" 使回格键（backspace）正常处理indent, eol, start等
set backspace=2
" 允许backspace和光标键跨越行边界
set whichwrap+=<,>,h,l
" 可以在buffer的任何地方使用鼠标（类似office中在工作区双击鼠标定位）
"set mouse=a
set selection=exclusive
set selectmode=mouse,key
" 通过使用: commands命令，告诉我们文件的哪一行被改变过
set report=0
" 在被分割的窗口间显示空白，便于阅读
set fillchars=vert:\ ,stl:\ ,stlnc:\
" 高亮显示匹配的括号
set showmatch
" 匹配括号高亮的时间（单位是十分之一秒）
set matchtime=1
" 光标移动到buffer的顶部和底部时保持3行距离
set scrolloff=3
" 为C程序提供自动缩进
set smartindent
" 高亮显示普通txt文件（需要txt.vim脚本）
au BufRead,BufNewFile *  setfiletype txt
filetype plugin indent on
"打开文件类型检测, 加了这句才可以用智能补全
set completeopt=longest,menu
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"NERDtee设定
let NERDChristmasTree=1
let NERDTreeAutoCenter=1
let NERDTreeBookmarksFile=$VIM.'\Data\NerdBookmarks.txt'
let NERDTreeMouseMode=2
let NERDTreeShowBookmarks=1
let NERDTreeShowFiles=1
let NERDTreeShowHidden=1
let NERDTreeShowLineNumbers=1
let NERDTreeWinPos='left'
let NERDTreeWinSize=31
nnoremap f :NERDTreeToggle
map <F7> :NERDTree<CR>

let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1
nmap mo :MiniBufExplorer<cr>
nmap mc :CMiniBufExplorer<cr>

"taglist plugin
"设置ctags路径
let Tlist_Ctags_Cmd = '/usr/bin/ctags'
"启动vim后自动打开taglist窗口
let Tlist_Auto_Open = 1
"不同时显示多个文件的tag，仅显示一个
let Tlist_Show_One_File = 1
"taglist为最后一个窗口时，退出vim
let Tlist_Exit_OnlyWindow = 1
"taglist窗口显示在右侧，缺省为左侧
"let Tlist_Use_Right_Window =1
"设置taglist窗口大小
let Tlist_WinHeight = 100
let Tlist_WinWidth = 39
"设置taglist窗口打开快捷键
nmap tl :Tlist<CR>

Bundle 'scrooloose/nerdtree'
"let NERDTreeWinPos='right'
let NERDTreeWinSize=30
nmap tr :NERDTreeToggle<CR>

Bundle 'bling/vim-airline'
set laststatus=2
