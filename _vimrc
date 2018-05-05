"==========================================
" Forked from: https://github.com/wklken/k-vim
" Author:  Jase Chen
" Version: 2.1
" Email: xxmm@live.cn
" ReadMe: README.md
" Last_modify: 2018-4-26
" Platform: Windows/Mac/Linux
" Sections:
"       -> Initial Plugin 加载插件
"       -> General Settings 基础设置
"       -> Display Settings 展示/排版等界面格式设置
"       -> FileEncode Settings 文件编码设置
"       -> Others 其它配置
"       -> HotKey Settings  自定义快捷键
"       -> FileType Settings  针对文件类型的设置
"       -> Theme Settings  主题设置
"
"       -> 插件配置和具体设置在vimrc.bundles中
"==========================================
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  依赖项目                                  "
"                           Yapf, fyflakes, ctags                         "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"==========================================
" Initial Plugin 加载插件
"==========================================


"Vundle必须
set nocompatible              " required
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
" 自动补全jedi-vim - awesome Python autocompletion with VIM
Plugin 'davidhalter/jedi-vim'
" pep8-indent用于自动缩进
Plugin 'Vimjas/vim-python-pep8-indent'
" flake8用于代码检查
Plugin 'nvie/vim-flake8'
Plugin 'tell-k/vim-autopep8'
" 目录树
Plugin 'scrooloose/nerdtree'
" nerdtree目录树增强.
Plugin 'jistr/vim-nerdtree-tabs'
" A plugin of NERDTree showing git status flags.
Plugin 'Xuyuanp/nerdtree-git-plugin'
" python自动缩进
Plugin 'vim-scripts/indentpython.vim'
" 语法检查和高亮
Plugin 'scrooloose/syntastic'
" solarized 主题风格
"Plugin 'altercation/vim-colors-solarized'
" 将代码行最后无效的空格标红
Plugin 'bronson/vim-trailing-whitespace'
" CTRLP[文件搜索]
Plugin 'kien/ctrlp.vim'
" TAGBAR[大纲式导航]
Plugin 'majutsushi/tagbar'
" 与命令行 git 工具相辅相成，可以无缝的插入到工作流程中。
Plugin 'tpope/vim-fugitive'
" view
" airline
" 状态栏增强展示
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" PowerLine
"Plugin 'Lokaltog/vim-powerline'
" 括号高亮
"Plugin 'kien/rainbow_parentheses.vim'
" YouCompleteMe
Plugin 'Valloric/YouCompleteMe'
" 快速插入自定义的代码片段
Plugin 'SirVer/ultisnips'
" 安装代码块集合
Plugin 'honza/vim-snippets'
"Plugin 'OmniSharp/omnisharp-vim'
" Python模式
"Plugin 'klen/python-mode'
" 自动括号匹配
Plugin 'jiangmiao/auto-pairs'
" 批量加减注释 ,cc变注释 ,cu解除注释
Plugin 'scrooloose/nerdcommenter'
" 缩进线
Plugin 'Yggdroot/indentLine'
" markdown插件2017-09-26
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
" markdown预览插件2017-09-26
"Plugin 'suan/vim-instant-markdown'
"add author info in any source files
Plugin 'chenomg/AuthorInfo'
" 字体环绕2017-09-27
" 详见https://gist.github.com/wilon/ac1fc66f4a79e7b0c161c80877c75c94
" NormalMode: (word):ys w [ (sentece):ys s [ && VisualMode:选中后 S [
Plugin 'tpope/vim-surround'
" repeat 重复插件操作
Plugin 'tpope/vim-repeat'
"Yapf格式化代码
Plugin 'mindriot101/vim-yapf'
Plugin 'flazz/vim-colorschemes'
" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
"
" 修改leader键
let mapleader = ','
let g:mapleader = ','



" 开启语法高亮
syntax on

" Use CTRL-S for saving, also in Insert mode
noremap <C-S> :update<CR>
vnoremap <C-S> <C-C>:update<CR>
inoremap <C-S> <C-O>:update<CR>

" 光标移动到buffer的顶部和底部时保持3行距离
set scrolloff=3

" install bundles
if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
elseif filereadable(expand("~/.config/nvim/vimrc.bundles")) " neovim
  source ~/.config/nvim/vimrc.bundles
endif

" ensure ftdetect et al work by including this after the bundle stuff
filetype plugin indent on

" NOTE: 以下配置有详细说明，一些特性不喜欢可以直接注解掉

"==========================================
" General Settings 基础设置
"==========================================
if has('python3') " if dynamic py|py3, this line already activates python2.
  let s:python_version = 3
elseif has('python')
  let s:python_version = 2
else
  let s:python_version = 0
endif
"echomsg 'Using python'.s:python_version

" history存储容量
set history=2000

" 检测文件类型
filetype on
" 针对不同的文件类型采用不同的缩进格式
filetype indent on
" 允许插件
filetype plugin on
" 启动自动补全
filetype plugin indent on

" 文件修改之后自动载入
set autoread
" 启动的时候不显示那个援助乌干达儿童的提示
set shortmess=atI

" 使用系统粘贴板
set clipboard=unnamed

" 备份,到另一个位置. 防止误删, 目前是取消备份
"set backup
"set backupext=.bak
"set backupdir=/tmp/vimbk/

" 取消备份。 视情况自己改
set nobackup
" 关闭交换文件
set noswapfile

set wildignore=*.swp,*.bak,*.pyc,*.class,.svn

" 突出显示当前列highlight
"set cursorcolumn
" 突出显示当前行
set cursorline


" 设置 退出vim后，内容显示在终端屏幕, 可以用于查看和复制, 不需要可以去掉
" 好处：误删什么的，如果以前屏幕打开，可以找回
set t_ti= t_te=


" 鼠标暂不启用, 键盘党....
"set mouse-=a
" 启用鼠标
 set mouse=a
" Hide the mouse cursor while typing
" set mousehide


" 修复ctrl+m 多光标操作选择的bug，但是改变了ctrl+v进行字符选中时将包含光标下的字符
set selection=inclusive
set selectmode=mouse,key

" change the terminal's title
set title
" 去掉输入错误的提示声音
set novisualbell
set noerrorbells
set t_vb=
set tm=500

" Remember info about open buffers on close
set viminfo^=%

" For regular expressions turn magic on
set magic

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

"==========================================
" Display Settings 展示/排版等界面格式设置
"==========================================


"切换窗口 split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" 在 80 个字符的位置显示一条竖线来警示我们写代码不要超过 80 个字符
set colorcolumn=81

"" 在超过 80 个字符的时候自动换行
"set tw=80
"" 使中文也能和英文一样设置80字符
"set fo+=Mm

"多余的空格显示红色
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match Error /\s\+$/

" 显示当前的行号列号
set ruler
" 在状态栏显示正在输入的命令
set showcmd
" 左下角显示当前vim模式
set showmode

" 在上下移动光标时，光标的上方或下方至少会保留显示的行数
set scrolloff=7

" set winwidth=79

" 检测当前系统是否为Mac,并调整启动窗口大小
function! MySys()
	if has("win32")
        function! WindowCenterInScreen_win()
            set lines=9999 columns=9999
            let g:windowsSizeFixX = 58
            let g:windowsSizeFixY = 118
            let g:windowsScaleX = 7.75
            let g:windowsScaleY = 17.0
            let g:windowsPosOldX = getwinposx()
            let g:windowsPosOldY = getwinposy()
            let g:windowsScreenWidth = float2nr(winwidth(0) * g:windowsScaleX) + g:windowsPosOldX + g:windowsSizeFixX
            let g:windowsScreenHeight = float2nr(winheight(0) * g:windowsScaleY) + g:windowsPosOldY + g:windowsSizeFixY
            set lines=30 columns=108
            let g:windowsSizeWidth = float2nr(winwidth(0) * g:windowsScaleX) + g:windowsSizeFixX
            let g:windowsSizeHeight = float2nr(winheight(0) * g:windowsScaleY) + g:windowsSizeFixY
            let g:windowsPosX = ((g:windowsScreenWidth - g:windowsSizeWidth) / 2)
            let g:windowsPosY = ((g:windowsScreenHeight - g:windowsSizeHeight) / 2)
            exec ':winpos ' . g:windowsPosX . ' ' . g:windowsPosY
        endfunc
        au GUIEnter * call WindowCenterInScreen_win()
	elseif has("unix")
        function! WindowCenterInScreen_mac()
            set lines=9999 columns=9999
            "let g:windowsSizeFixX = 58
            "let g:windowsSizeFixY = 118
            let g:windowsSizeFixX = 58
            let g:windowsSizeFixY = 118
            "let g:windowsScaleX = 7.75
            "let g:windowsScaleY = 17.0
            let g:windowsScaleX = 77.75
            let g:windowsScaleY = 177
            let g:windowsPosOldX = getwinposx()
            let g:windowsPosOldY = getwinposy()
            let g:windowsScreenWidth = float2nr(winwidth(0) * g:windowsScaleX) + g:windowsPosOldX + g:windowsSizeFixX
            let g:windowsScreenHeight = float2nr(winheight(0) * g:windowsScaleY) + g:windowsPosOldY + g:windowsSizeFixY
            set lines=999 columns=182
            let g:windowsSizeWidth = float2nr(winwidth(0) * g:windowsScaleX) + g:windowsSizeFixX
            let g:windowsSizeHeight = float2nr(winheight(0) * g:windowsScaleY) + g:windowsSizeFixY
            let g:windowsPosX = ((g:windowsScreenWidth - g:windowsSizeWidth) / 2)
            let g:windowsPosY = ((g:windowsScreenHeight - g:windowsSizeHeight) / 2)
            exec ':winpos ' . g:windowsPosX . ' ' . g:windowsPosY
        endfunc
        au GUIEnter * call WindowCenterInScreen_mac()
        " Do Mac stuff hereWindowCenterInScreen_mac
    endif
endfunction
call MySys()
" 设置gvim启动窗口的位置，以及大小
"winpos 100 50
"set lines=35 columns=120

" 命令行（在状态行下）的高度，默认为1，这里是2
"set statusline=%<%f\ %h%m%r%=%k[%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}]\ %-14.(%l,%c%V%)\ %P
" Always show the status line - use 2 lines for the status bar
set laststatus=2

" 显示行号
"set number
set nu
" 取消换行
set wrap

" 括号配对情况, 跳转并高亮一下匹配的括号
set showmatch
" How many tenths of a second to blink when matching brackets
set matchtime=2

"自动缩排
set ai

"使用每层缩进的空格数
set sw=4
"编辑时一个TAB字符占多少个空格的位置
set ts=4

" 为光标所在行添加标识(Windows下为高亮模式，Linux下为下划线)
setlocal cursorline
set dy=lastline "显示最多行，不用@@

" 设置文内智能搜索提示
" 高亮search命中的文本
set hlsearch
" 打开增量搜索模式,随着键入即时搜索
set incsearch
" 搜索时忽略大小写
set ignorecase
" 有一个或以上大写字母时仍大小写敏感
set smartcase

" 代码折叠
set foldenable
" 折叠方法
" manual    手工折叠
" indent    使用缩进表示折叠
" expr      使用表达式定义折叠
" syntax    使用语法定义折叠
" diff      对没有更改的文本进行折叠
" marker    使用标记进行折叠, 默认标记是 {{{ 和 }}}
set foldmethod=indent
set foldlevel=99
"空格键折叠 Enable folding with the spacebar
nnoremap <space> za

" 缩进配置
" Smart indent
set smartindent
" 打开自动缩进
" never add copyindent, case error   " copy the previous indentation on autoindenting
set autoindent

" tab相关变更
" 设置Tab键的宽度        [等同的空格个数]
set tabstop=4
" 每一次缩进对应的空格数
set shiftwidth=4
" 按退格键时可以一次删掉 4 个空格
set softtabstop=4
" insert tabs on the start of a line according to shiftwidth, not tabstop 按退格键时可以一次删掉 4 个空格
set smarttab
" 将Tab自动转化成空格[需要输入真正的Tab键时，使用 Ctrl+V + Tab]
set expandtab
" 缩进时，取整 use multiple of shiftwidth when indenting with '<' and '>'
set shiftround

" A buffer becomes hidden when it is abandoned
set hidden
set wildmode=list:longest
set ttyfast

" 00x增减数字时使用十进制
set nrformats=

" 相对行号: 行号变成相对，可以用 nj/nk 进行跳转
set relativenumber number
au FocusLost * :set norelativenumber number
au FocusGained * :set relativenumber
" 插入模式下用绝对行号, 普通模式下用相对
autocmd InsertEnter * :set norelativenumber number
autocmd InsertLeave * :set relativenumber
function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber number
  else
    set relativenumber
  endif
endfunc
nnoremap <C-n> :call NumberToggle()<cr>

" 防止tmux下vim的背景色显示异常
" Refer: http://sunaku.github.io/vim-256color-bce.html
if &term =~ '256color'
  " disable Background Color Erase (BCE) so that color schemes
  " render properly when inside 256-color tmux and GNU screen.
  " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
  set t_ut=
endif
"

" Ctrl-T新建tab时，在tab前添加序号，方便切换
set tabline=%!MyTabLine()  " custom tab pages line
function! MyTabLine()
    let s = '' " complete tabline goes here
    " loop through each tab page
    for t in range(tabpagenr('$'))
        " set highlight
        if t + 1 == tabpagenr()
            let s .= '%#TabLineSel#'
        else
            let s .= '%#TabLine#'
        endif
        " set the tab page number (for mouse clicks)
        let s .= '%' . (t + 1) . 'T'
        let s .= ' '
        " set page number string
        let s .= t + 1 . ' '
        " get buffer names and statuses
        let n = ''      "temp string for buffer names while we loop and check buftype
        let m = 0       " &modified counter
        let bc = len(tabpagebuflist(t + 1))     "counter to avoid last ' '
        " loop through each buffer in a tab
        for b in tabpagebuflist(t + 1)
            " buffer types: quickfix gets a [Q], help gets [H]{base fname}
            " others get 1dir/2dir/3dir/fname shortened to 1/2/3/fname
            if getbufvar( b, "&buftype" ) == 'help'
                let n .= '[H]' . fnamemodify( bufname(b), ':t:s/.txt$//' )
            elseif getbufvar( b, "&buftype" ) == 'quickfix'
                let n .= '[Q]'
            else
                let n .= pathshorten(bufname(b))
            endif
            " check and ++ tab's &modified count
            if getbufvar( b, "&modified" )
                let m += 1
            endif
            " no final ' ' added...formatting looks better done later
            if bc > 1
                let n .= ' '
            endif
            let bc -= 1
        endfor
        " add modified label [n+] where n pages in tab are modified
        if m > 0
            let s .= '[' . m . '+]'
        endif
        " select the highlighting for the buffer names
        " my default highlighting only underlines the active tab
        " buffer names.
        if t + 1 == tabpagenr()
            let s .= '%#TabLineSel#'
        else
            let s .= '%#TabLine#'
        endif
        " add buffer names
        if n == ''
            let s.= '[New]'
        else
            let s .= n
        endif
        " switch to no underlining and add final space to buffer list
        let s .= ' '
    endfor
    " after the last tab fill with TabLineFill and reset tab page nr
    let s .= '%#TabLineFill#%T'
    " right-align the label to close the current tab page
    if tabpagenr('$') > 1
        let s .= '%=%#TabLineFill#Xclose'
    endif
    return s
endfunction

"==========================================
" FileEncode Settings 文件编码,格式
"==========================================
" 设置新文件的编码为 UTF-8
set encoding=utf-8
" 自动判断编码时，依次尝试以下编码：
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set helplang=cn
"set langmenu=zh_CN.UTF-8
"set enc=2byte-gb18030
" 下面这句只影响普通模式 (非图形界面) 下的 Vim
set termencoding=utf-8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" 如遇Unicode值大于255的文本，不必等到空格再折行
set formatoptions+=m
" 合并两行中文时，不在中间加空格
set formatoptions+=B


"==========================================
" others 其它设置
"==========================================
" vimrc文件修改之后自动加载, windows
autocmd! bufwritepost _vimrc source %
" vimrc文件修改之后自动加载, linux
autocmd! bufwritepost .vimrc source %

" 自动补全配置
" 让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
set completeopt=longest,menu

" 增强模式中的命令行自动完成操作
set wildmenu
" Ignore compiled files
set wildignore=*.o,*~,*.pyc,*.class

" 离开插入模式后自动关闭预览窗口
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" 回车即选中当前项
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"

"" In the quickfix window, <CR> is used to jump to the error under the
"" cursor, so undefine the mapping there.
"autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>
"" quickfix window  s/v to open in split window,  ,gd/,jd => quickfix window => open it
"autocmd BufReadPost quickfix nnoremap <buffer> v <C-w><Enter><C-w>L
"autocmd BufReadPost quickfix nnoremap <buffer> s <C-w><Enter><C-w>K

" command-line window
autocmd CmdwinEnter * nnoremap <buffer> <CR> <CR>


" 上下左右键的行为 会显示其他信息
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"

" 打开自动定位到最后编辑的位置, 需要确认 .viminfo 当前用户可写
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

"==========================================
" HotKey Settings  自定义快捷键设置
"==========================================

" 主要按键重定义

"Treat long lines as break lines (useful when moving around in them)
"se swap之后，同物理行上线直接跳
nnoremap k gk
nnoremap gk k
nnoremap j gj
nnoremap gj j

" F1 - F6 设置

" F1 废弃这个键,防止调出系统帮助
" I can type :help on my own, thanks.  Protect your fat fingers from the evils of <F1>
noremap <F1> <Esc>"
" F1 setted to NERDTREE switcher

" F2 行号开关，用于鼠标复制代码用
" 为方便复制，用<F2>开启/关闭行号显示:
function! HideNumber()
  if(&relativenumber == &number)
    set relativenumber! number!
  elseif(&number)
    set number!
  else
    set relativenumber!
  endif
  set number?
endfunc
nnoremap <F2> :call HideNumber()<CR>

"F3 结构大纲 Tagbar
let g:tagbar_width=35
let g:tagbar_autofocus=1
let g:tagbar_right = 1
nmap <F3> :TagbarToggle<CR>
" F3 显示可打印字符开关
"nnoremap <F3> :set list! list?<CR>

" F4 NERDTree开关
"nnoremap <F4> :set wrap! wrap?<CR>
nmap  <F4> :NERDTreeTabsToggle<cr>

"自动添加作者信息
nmap <F5> :AuthorInfoDetect<cr>
"" F5 运行Python Windows
"autocmd! FileType python nnoremap <buffer> <F5> :exec '!python3' shellescape(@%, 1)<cr>
" <leader>r 运行Python
autocmd! FileType python nnoremap <buffer> <leader>r :exec '!python3' shellescape(@%, 1)<cr>

" F6 语法开关，关闭语法可以加快大文件的展示
nnoremap <F6> :exec exists('syntax_on') ? 'syn off' : 'syn on'<CR>

"set pastetoggle=<F5>            "    when in insert mode, press <F5> to go to
                                ""    paste mode, where you can paste mass data
                                ""    that won't be autoindented

" disbale paste mode when leaving insert mode
au InsertLeave * set nopaste

"Autopep8格式化
"autocmd FileType python noremap <buffer> <leader>f :call Autopep8()<CR>

""F8 Yapf代码格式化
"nnoremap <F8> :call Yapf()<cr>
"<leader>f Yapf代码格式化
nnoremap <leader>f :call Yapf()<cr>

" F5 set paste问题已解决, 粘贴代码前不需要按F5了
" F5 粘贴模式paste_mode开关,用于有格式的代码粘贴
" Automatically set paste mode in Vim when pasting in insert mode
function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction
inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()



" 分屏窗口移动, Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l


" http://stackoverflow.com/questions/13194428/is-better-way-to-zoom-windows-in-vim-than-zoomwin
" Zoom / Restore window.
" 在单个tab标签下，<leader>z可以最大化/最小化当前分屏
function! s:ZoomToggle() abort
    if exists('t:zoomed') && t:zoomed
        execute t:zoom_winrestcmd
        let t:zoomed = 0
    else
        let t:zoom_winrestcmd = winrestcmd()
        resize
        vertical resize
        let t:zoomed = 1
    endif
endfunction
command! ZoomToggle call s:ZoomToggle()
nnoremap <silent> <Leader>z :ZoomToggle<CR>


" Go to home and end using capitalized directions
noremap H ^
noremap L $


" Map ; to : and save a million keystrokes 用于快速进入命令行
nnoremap ; :

" C-w切换窗口
nnoremap <C-w> <C-w><C-w>

" 命令行模式增强，ctrl - a到行首， -e 到行尾
cnoremap <C-j> <t_kd>
cnoremap <C-k> <t_ku>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>


" 搜索相关
" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
"map <space> /
" 进入搜索Use sane regexes"
nnoremap / /\v
vnoremap / /\v

" Keep search pattern at the center of the screen.
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz

" 去掉搜索高亮
"noremap <silent><leader>/ :nohls<CR>

" 当光标一段时间保持不动了，就禁用高亮
autocmd cursorhold * set nohlsearch
" 当输入查找命令时，再启用高亮
noremap n :set hlsearch<cr>n
noremap N :set hlsearch<cr>N
noremap / :set hlsearch<cr>/
noremap ? :set hlsearch<cr>?
noremap * *:set hlsearch<cr>


" switch # *
" 调整后#向下搜索，*向上搜索
nnoremap # *
nnoremap * #

" for # indent, python文件中输入新行时#号注释不切回行首
autocmd BufNewFile,BufRead *.py inoremap # X<c-h>#


" tab/buffer相关

" 切换前后buffer
nnoremap [b :bprevious<cr>
nnoremap ]b :bnext<cr>
" 使用方向键切换buffer
"noremap <left> :bp<CR>
"noremap <right> :bn<CR>


" tab 操作
" http://vim.wikia.com/wiki/Alternative_tab_navigation
" http://stackoverflow.com/questions/2005214/switching-to-a-particular-tab-in-vim

"" tab切换
"map <leader>th :tabfirst<cr>
"map <leader>tl :tablast<cr>

"map <leader>tj :tabnext<cr>
"map <leader>tk :tabprev<cr>
"map <leader>tn :tabnext<cr>
"map <leader>tp :tabprev<cr>

"map <leader>te :tabedit<cr>
"map <leader>tc :tabclose<cr>
"map <leader>tm :tabm<cr>

" normal模式下切换到确切的tab
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

" Toggles between the active and last active tab "
" The first tab is always 1 "
let g:last_active_tab = 1
" nnoremap <leader>gt :execute 'tabnext ' . g:last_active_tab<cr>
" nnoremap <silent> <c-o> :execute 'tabnext ' . g:last_active_tab<cr>
" vnoremap <silent> <c-o> :execute 'tabnext ' . g:last_active_tab<cr>
nnoremap <silent> <leader>tt :execute 'tabnext ' . g:last_active_tab<cr>
autocmd TabLeave * let g:last_active_tab = tabpagenr()

" 新建tab  Ctrl+t
nnoremap <leader>t     :tabnew<CR>
inoremap <leader>t     <Esc>:tabnew<CR>


" => 选中及操作改键

" 调整缩进后自动选中，方便再次操作
vnoremap < <gv
vnoremap > >gv

" y$ -> Y Make Y behave like other capitals
" Y向后复制到行末
map Y y$

" 复制选中区到系统剪切板中
vnoremap <leader>y "+y

" auto jump to end of select
" vnoremap <silent> y y`]
" vnoremap <silent> p p`]
" nnoremap <silent> p p`]

" Copy All. Linux - select all
map <Leader>sa ggVG"+y

" select block
" 向下选中内容块
nnoremap <leader>v V`}

" w!! to sudo & write a file
cmap w!! w !sudo tee >/dev/null %

" kj 替换 Esc
inoremap kj <Esc>

" 滚动Speed up scrolling of the viewport slightly
nnoremap <C-e> 2<C-e>
nnoremap <C-y> 2<C-y>


" Jump to start and end of line using the home row keys
" 增强tab操作, 导致这个会有问题, 考虑换键
"nmap t o<ESC>k
"nmap T O<ESC>j

" Quickly close the current window
nnoremap <leader>q :q<CR>

" Quickly save the current file
nnoremap <leader>w :w<CR>

" 交换 ' `, 使得可以快速使用'跳到marked位置
nnoremap ' `
nnoremap ` '

" remap U to <C-r> for easier redo
nnoremap U <C-r>

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

"去除所有行末空格，remove trailing whitespace blank
nnoremap <leader>b :%s/\s\+$//<CR>

"去除所有行末^M，remove trailing ^M
nnoremap <leader>m :%s/\r//g<CR>

"==========================================
" FileType Settings  文件类型设置
"==========================================

" 具体编辑文件类型的一般设置，比如不要 tab 等
autocmd FileType python set tabstop=4 shiftwidth=4 expandtab ai
autocmd FileType ruby,javascript,html,css,xml set tabstop=2 shiftwidth=2 softtabstop=2 expandtab ai
autocmd BufRead,BufNewFile *.md,*.mkd,*.markdown set filetype=markdown.mkd
autocmd BufRead,BufNewFile *.part set filetype=html
" disable showmatch when use > in php
au BufWinEnter *.php set mps-=<:>



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


" 设置可以高亮的关键字
if has("autocmd")
  " Highlight TODO, FIXME, NOTE, etc.
  if v:version > 701
    autocmd Syntax * call matchadd('Todo',  '\W\zs\(TODO\|FIXME\|CHANGED\|DONE\|XXX\|BUG\|HACK\)')
    autocmd Syntax * call matchadd('Debug', '\W\zs\(NOTE\|INFO\|IDEA\|NOTICE\)')
  endif
endif

"==========================================
" TEMP 设置, 尚未确定要不要
"==========================================



"==========================================
" Theme Settings  主题设置
"==========================================


"无菜单，工具栏
set go=

" theme主题
set background=light
set t_Co=256
let g:solarized_italic=0
" solarized {{{
    let g:solarized_termtrans=1
    let g:solarized_contrast="normal"
    let g:solarized_visibility="normal"
" }}}
"color evening
let g:monokai_term_italic = 1
let g:monokai_gui_italic = 0
" Sublime的配色方案
colorscheme monokai
"colorscheme desert
"colorscheme solarized
"colorscheme molokai
"colorscheme perun
colorscheme Tomorrow-Night-Eighties

""设置显示字体fonts
"set guifont=Consolas:h11 
"set guifont=Bitstream_Vera_Sans_Mono:h10:cANSI
"set gfw=幼圆:h10.5:cGB2312

" 设置标记一列的背景颜色和数字一行颜色一致
hi! link SignColumn   LineNr
hi! link ShowMarksHLl DiffAdd
hi! link ShowMarksHLu DiffChange

" for error highlight，防止错误整行标红导致看不清
highlight clear SpellBad
highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline
highlight clear SpellCap
highlight SpellCap term=underline cterm=underline
highlight clear SpellRare
highlight SpellRare term=underline cterm=underline
highlight clear SpellLocal
highlight SpellLocal term=underline cterm=underline




" ==========================================
" Vundle 插件管理和配置项
" ==========================================

"------------------------------------------- begin of configs --------------------------------------------


""""""""""""""""""""""""""""""""""""""""""""""""""""""syntastic
    " 检测到错误和警告时的标志
let g:syntastic_error_symbol='e'
let g:syntastic_warning_symbol='w'
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0
let g:syntastic_enable_highlighting=1
    " 使用pyflakes,速度比pylint快
    " 需要安装 pep8 或者 pyflakes，使用pip安装  ,pep8是python的格式检测神器，建议安装。
let g:syntastic_python_checkers=['pep8', 'pyflakes']
let g:syntastic_python_pep8_args='--ignore=E501,E225'
    " 修改高亮的背景色, 适应主题
highlight SyntasticErrorSign guifg=white guibg=black
" to see error location list
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_loc_list_height = 5
function! ToggleErrors()
    let old_last_winnr = winnr('$')
    lclose
    if old_last_winnr == winnr('$')
        " Nothing was closed, open syntastic error location panel
        Errors
    endif
endfunction
nnoremap <Leader>s :call ToggleErrors()<cr>
    " 跳转到下一个/上一个错误处
nnoremap <Leader>sn :lnext<cr>
nnoremap <Leader>sp :lprevious<cr>
    " 关闭 某一语言的（如C/C++） 的语法检测
" let g:syntastic_ignore_files=[".*\.c$", ".*\.h$", ".*\.cpp", ".*\.hpp"]

""""""""""""""""""""""""""""""""""""""""""""""""""""""syntastic


""""""""""""""""""""""""""""""""""""""""""""""""""""""youcompleteme
"let g:ycm_server_python_interpreter='/usr/bin/python'
"let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'

" YouCompleteMe {{{
    "youcompleteme  默认tab  s-tab 和自动补全冲突
    "let g:ycm_key_list_select_completion=['<c-n>']
    let g:ycm_key_list_select_completion = ['<Down>']
    "let g:ycm_key_list_previous_completion=['<c-p>']
    let g:ycm_key_list_previous_completion = ['<Up>']
    let g:ycm_complete_in_comments = 1  "在注释输入中也能补全
    let g:ycm_complete_in_strings = 1   "在字符串输入中也能补全
    let g:ycm_use_ultisnips_completer = 1 "提示UltiSnips
    let g:ycm_collect_identifiers_from_comments_and_strings = 1
    " 注释和字符串中的文字也会被收入补全
    let g:ycm_collect_identifiers_from_tags_files = 1
    " 开启语法关键字补全
    let g:ycm_seed_identifiers_with_syntax=1
    " 回车作为选中
    let g:ycm_key_list_stop_completion = ['<CR>']

    "let g:ycm_seed_identifiers_with_syntax=1   "语言关键字补全, 不过python关键字都很短，所以，需要的自己打开

    " 跳转到定义处, 分屏打开
    let g:ycm_goto_buffer_command = 'horizontal-split'
    let g:ycm_register_as_syntastic_checker = 0
    " nnoremap <leader>jd :YcmCompleter GoToDefinition<CR>
    nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
    nnoremap <leader>gd :YcmCompleter GoToDeclaration<CR>

    " 引入，可以补全系统，以及python的第三方包 针对新老版本YCM做了兼容
    " old version
    if !empty(glob("~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py"))
        let g:ycm_global_ycm_extra_conf = "~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py"
    endif
    " new version
    if !empty(glob("~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py"))
        let g:ycm_global_ycm_extra_conf = "~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py"
    endif

    " 直接触发自动补全 insert模式下
    " let g:ycm_key_invoke_completion = '<C-Space>'
    " 黑名单,不启用
    let g:ycm_filetype_blacklist = {
        \ 'tagbar' : 1,
        \ 'gitcommit' : 1,
        \}
" }}}


" ultisnips {{{
    let g:UltiSnipsExpandTrigger       = "<tab>"
    let g:UltiSnipsJumpForwardTrigger  = "<tab>"
    let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
    let g:UltiSnipsSnippetDirectories  = ['UltiSnips']
    let g:UltiSnipsSnippetsDir = '~/.vim/UltiSnips'
    " 定义存放代码片段的文件夹 .vim/UltiSnips下，使用自定义和默认的，将会的到全局，有冲突的会提示
    " 进入对应filetype的snippets进行编辑
    map <leader>us :UltiSnipsEdit<CR>

    " ctrl+j/k 进行选择
    func! g:JInYCM()
        if pumvisible()
            return "\<C-n>"
        else
            return "\<c-j>"
        endif
    endfunction

    func! g:KInYCM()
        if pumvisible()
            return "\<C-p>"
        else
            return "\<c-k>"
        endif
    endfunction
    inoremap <c-j> <c-r>=g:JInYCM()<cr>
    au BufEnter,BufRead * exec "inoremap <silent> " . g:UltiSnipsJumpBackwordTrigger . " <C-R>=g:KInYCM()<cr>"
    let g:UltiSnipsJumpBackwordTrigger = "<c-k>"
" }}}


" delimitMate {{{
    " for python docstring ",优化输入
    au FileType python let b:delimitMate_nesting_quotes = ['"']
    au FileType php let delimitMate_matchpairs = "(:),[:],{:}"
    " 关闭某些类型文件的自动补全
    "au FileType mail let b:delimitMate_autoclose = 0
" }}}


" closetag {{{
    let g:closetag_html_style=1
" }}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""youcompleteme

""""""""""""""""""""""""""""""""""""""""""""""""""""""NERDTree
" 是否自动开启nerdtree
" thank to @ListenerRi, see https://github.com/wklken/k-vim/issues/165
let g:nerdtree_tabs_open_on_console_startup=0
let g:nerdtree_tabs_open_on_gui_startup=0
"NERDTreeMapOpenInTab
let NERDTreeMapOpenInTab='<ENTER>'
""窗口尺寸
let g:NERDTreeSize=30
""窗口是否显示行号
let g:NERDTreeShowLineNumbers=1
""不显示隐藏文件
let g:NERDTreeHidden=0
" remove the 'press for help'
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""NERDTree


""""""""""""""""""""""""""""""""""""""""""""""""""""""IndentLine
map <leader>il :IndentLinesToggle<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""IndentLine

""""""""""""""""""""""""""""""""""""""""""""""""""""""pyflakes
" 错误高亮调整
highlight SpellBad term=reverse ctermbg=1
""""""""""""""""""""""""""""""""""""""""""""""""""""""pyflakes
""""""""""""""""""""""""""""""""""""""""""""""""""""""Autopep8
"Disable show diff window
let g:autopep8_disable_show_diff=1

"Chose diff window type. (default: horizontal)
"# default
"let g:autopep8_diff_type='horizontal'
"let g:autopep8_diff_type='vertical'

""""""""""""""""""""""""""""""""""""""""""""""""""""""Autopep8
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""Airline
" air-line
"let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.paste = 'ρ'
"let g:airline_symbols.paste = 'Þ'
"let g:airline_symbols.branch = '∥'
let g:airline_symbols.whitespace = 'Ξ'

""""""""""""""""""""""""""""""""""""""""""""""""""""""Airline
""""""""""""""""""""""""""""""""""""""""""""""""""""""AuthorInfo
let g:vimrc_author='Jase Chen'
let g:vimrc_email='xxmm@live.cn'
let g:vimrc_homepage='http://jase.im/'
""""""""""""""""""""""""""""""""""""""""""""""""""""""AuthorInfo
""""""""""""""""""""""""""""""""""""""""""""""""""""""vim-markdown
"disable the folding configuration
"let g:vim_markdown_folding_disabled = 1
"Folding level is a number between 1 and 6. By default, if not specified, it is set to 1.
let g:vim_markdown_folding_level = 6
let g:vim_markdown_toc_autofit = 1
"启用隐藏使用vim隐藏配置的标准。
set conceallevel=2
"要禁用隐藏而不考虑 conceallevel 设置
let g:vim_markdown_conceal=0
"要禁用启用 LaTeX 数学语法的数学隐藏功能
let g:tex_conceal=""
let g:vim_markdown_math=1
""""""""""""""""""""""""""""""""""""""""""""""""""""""vim-markdown
"
"------------------------------------------- end of configs --------------------------------------------
