# Vim 
personal vim configuration

![LastDrawing](https://github.com/libingli/vim/blob/master/doc/demo.png)

# vundle

项目托管在github上https://github.com/gmarik/vundle。
其特色在于使用git来管理插件,更新方便，支持搜索，一键更新，从此只需要一个vimrc走
天下。

## 安装vundle.vim
```
mkdir ~/.vim/bundle
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim 
```

在vimrc文件中添加如下内容来启用vundle管理vim插件的功能：
linux系统如下添加：
```
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
```
在.vimrc文件顶部添加有关Vundle.vim的配置：
```
set nocompatible              " be iMproved, required
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
```

## vundle命令
```
:BundleList -列举出列表中(.vimrc中)配置的所有插件
:BundleInstall -安装列表中全部插件
:BundleInstall! -更新列表中全部插件
:BundleSearch foo -查找foo插件
:BundleSearch! foo -刷新foo插件缓存
:BundleClean -清除列表中没有的插件
:BundleClean! -清除列表中没有的插件
```
# 常用插件的安装和使用

# vim-go
编辑~/.vimrc，在vundle#begin和vundle#end间增加一行：
```
Plugin 'fatih/vim-go'
```
在vim内执行 ``:PluginInstall``

## ctags和taglist

taglist是一个用于显示定位程序中各种符号的插件，例如宏定义、变量名、结构名、函数
名这些东西.我们将其称之为符号(symbols)，而在taglist中将其称之为tag。
显然，要想将程序文件中的tag显示出来，需要事先了解全部tag的信息，并将其保存在一
个文件中，然后去解析对应的tag文件。
taglist做的仅仅是将tag文件中的内容解析完后显示在Vim上而已。
tag扫描以及数 据文件的生成则是由ctags(Exuberant Ctags)这一工具完成的，所以在使
用taglist之前，你的电脑需要装有ctags。

vimrc配置信息：
```
Bundle 'taglist.vim'
let Tlist_Ctags_Cmd='ctags'
let Tlist_Show_One_File=1            "不同时显示多个文件的tag，只显示当前文件的
let Tlist_WinWidt =28                "设置taglist的宽度
let Tlist_Exit_OnlyWindow=1          "如果taglist窗口是最后一个窗口，则退出vim
"let Tlist_Use_Right_Window=1        "在右侧窗口中显示taglist窗口
let Tlist_Use_Left_Windo =1          "在左侧窗口中显示taglist窗口
```

## tagbar

tagbar是一个taglist的替代品，比taglist更适合c++使用，函数能够按类区分，支持按类
折叠显示等，显示结果清晰简洁。
由于taglist在使用过程中对中文支持不好，当文件夹是中文的时候，没法生成taglist，
于是这里我使用tagbar，它可以很好的解决中文的问题。
https://github.com/majutsushi/tagbar

关于tagbar的配置：
```
Bundle 'majutsushi/tagbar'
"nmap <Leader>tb :TagbarToggle<CR>      "快捷键设置
let g:tagbar_ctags_bin='ctags'          "ctags程序的路径
let g:tagbar_width=30                   "窗口宽度的设置
map <F3> :Tagbar<CR>
"如果是c语言的程序的话，tagbar自动开启
"autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx call tagbar#autoopen()     
```
更多的配置请参看:help tagbar
配置好之后可以使用:Tagbar或者按配置的快捷键F3开启。

## NERDTree

NERDTree是一个用于浏览文件系统的树形资源管理外挂,它可以让你像使用Windows档案总
管一样在VIM中浏览文件系统并且打开文件或目录。
https://github.com/scrooloose/nerdtree

vimrc配置信息：
```
Bundle 'scrooloose/nerdtree'
let NERDTreeWinPos='right'
let NERDTreeWinSize=30
map <F2> :NERDTreeToggle<CR>
```
配置之后可以使用:NERDTree或者配置的快捷键F2开启。

## MiniBufExplorer

MiniBufExplorer提供多文件同时编辑功能，并在编辑器上方显示文件的标签。
https://github.com/fholgado/minibufexpl.vim

vimrc配置信息：
```
Bundle 'fholgado/minibufexpl.vim'
let g:miniBufExplMapWindowNavVim = 1   
let g:miniBufExplMapWindowNavArrows = 1   
let g:miniBufExplMapCTabSwitchBufs = 1   
let g:miniBufExplModSelTarget = 1  
let g:miniBufExplMoreThanOne=0

map <F11> :MBEbp<CR>
map <F12> :MBEbn<CR>
```
这里配置了F11和F12键来进行前后buffer的跳转，比较方便。
如果要关闭某个buffer的话，可以使用命令:MBEbd [num]，
如果只是输入:MBEbd是关闭当前buffer，
如果后面跟有buffer的数字标号，则关闭指定的buffer。

这里还想说一些BufExplorer这个插件，这个插件和MiniBufExplorer的功能差不多，
网上也有一些讨论他们之间的优缺点，但是我将BufExplorer和WinManager一起使用的时候
总是会有些问题，导致一些错误和冲突，于是还是决定使用简单的MiniBufExplorer。

## vim-airline

vim-airline其实是powerline的copy，它相比powerline有几个好处：它是纯vim script，
powerline则用到python；它简单，速度比powerline快。
这是一款状态栏增强插件，可以让你的Vim状态栏非常的美观，
同时包括了buffer显示条扩展smart tab line以及集成了一些插件。
https://github.com/bling/vim-airline

vimrc配置信息：
```
Bundle 'bling/vim-airline'
set laststatus=2
```
