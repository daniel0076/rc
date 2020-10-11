"{{{let &colorcolumn=join(range(81,999),",")
highlight ColorColumn ctermbg=235 guibg=#2c2d27
"}}}
" 一般設定{{{

set runtimepath+=~/.vimstyles

set tags=./tags,./TAGS,tags;~,TAGS;~

" set filetype on
filetype plugin indent on

" when scrolling, keep cursor 4 lines away from screen border
set scrolloff=4

" 開啟關鍵字上色功能
syntax on
"airline的status bar正常運作，用來設定亞洲字形用幾格來顯示
set ambiwidth=single
" 定義tab 的空格數 (ts)
set tabstop=4
" 自動縮排所使用的空格數 (sw)
set shiftwidth=4
"  不用空白來當作tab (et)
set expandtab

" File encoding for rare encodings
set fileencodings=ucs-bom,utf-8,utf-16,gbk,big5,gb18030,latin1

au FileType htmldjango,html,xml,css,ts set tabstop=2
au FileType htmldjango,html,xml,css,ts set shiftwidth=2
au FileType python set tabstop=4

" 顯示行號
" set nu == set number
set nu
"顯示當前的行號列號
set ruler
"顯示 編輯模式 在左下角的狀態列
set noshowmode
" 尋找時，符合字串會反白表示
set hlsearch
"search 字串時不分大小寫
"set ignorecase == set ic
"set noignorecase == set noic
set ignorecase

"即時搜尋
"set is == set imsearch (immediate)
set is

"設定可以使用backspace
set bs=2

" 游標線
" set cul == set cursorline
set cursorline
set cursorcolumn

"hi CursorLine term=none cterm=none ctermbg=none ctermbg=none
"au InsertEnter * hi CursorLine term=none cterm=underline
"au InsertLeave * hi CursorLine term=none cterm=none ctermbg=none

" 不和舊式語法相容(相容會仿舊 vi 的 bug)
set nocompatible

"狀態列
set laststatus=2

"游標留底
"set scrolloff=5

" Ctrl + N 自動補完會列出待選清單
set showmatch

" vim 裡打指令，按tab 會列出待選列表
set wildmenu

"依文件類型設置自動縮排
"filetype plugin indent on

" C and C++ specific settings (C 語法縮排)
autocmd FileType c,cpp set cindent

"自動縮排
"set ai == set autoindent
set ai

"在狀態欄顯示正在輸入的命令
set showcmd

"disable mouse for vim
"autocmd BufEnter * set mouse=

"設定 w!!，當忘記用sudo 編輯時用w!! 儲存
cmap w!! w !sudo tee %


"}}}
"其它設定{{{
"tabline settin in .vim/plugin/tabline.vim
hi TabLine     ctermfg=black ctermbg=white        "not active tab page label
hi TabLineSel  ctermfg=white ctermbg=black    "active tab page label
hi TabLineFill ctermfg=white ctermbg=blue     "fill the other place
hi VIMlogo     ctermfg=white ctermbg=blue

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Visual block indent
"vnoremap < <gv
"vnoremap > >gv
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" make < and  > as a pair, useful in C++
set matchpairs+=<:>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" automatically read the file again when it changed outside vim
set autoread
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set foldmethod=syntax
au FileType python set foldmethod=indent
au FileType vim,conf set foldmethod=marker foldlevel=0
set foldlevel=99

"let pyedit=expand('~/.vim/ftplugin/python_editing.vim')
"if !filereadable(pyedit)
"    silent !mkdir ~/.vim/ftplugin
"    silent !wget -O ~/.vim/ftplugin/python_editing.vim http://www.vim.org/scripts/download_script.php?src_id=5492
"endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"顯示tab
set list
"讓tab顯示成 >- 而行尾多餘的空白顯示成 -
set listchars=tab:>-,trail:~
"}}}
"熱鍵設定{{{
"map儲存
map <F12> <ESC>:w<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"map Ctrl-hjkl 為方向鍵
"imap <C-h> <left>
"imap <C-j> <down> "not work O_o
"imap <C-k> <up>   "not work O_o
"imap <C-l> <right>
"強制不使用方向鍵
"map <up> <nop>
"map <down> <nop>
"map <left> <nop>
"map <right> <nop>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"設定paste mode 的切換
function! PasteSwitch()
    if &paste
        set nopaste
    else
        set paste
    endif
endfunction
map <leader>p :call PasteSwitch()<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"see :help key-notation
"M(eta) is meta key
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"對視窗切換做map

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

"設定換tab
nmap tp :tabprevious<CR>
nmap tn :tabnext<CR>
nmap tt :tabe<SPACE>
nmap ts :tab split<CR>
nmap vs :vs<space>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ignores
set wildignore+=*.o,*.obj,*.pyc " output objects
set wildignore+=*.png,*.jpg,*.gif,*.ico " image format
set wildignore+=*.swf,*.fla " image format
set wildignore+=*.mp3,*.mp4,*.avi,*.mkv " media format
set wildignore+=*.git*,*.hg*,*.svn* " version control system
" set wildignore+=log/**
" set wildignore+=tmp/**
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 自動移除每行最後多餘的空白
autocmd BufWritePre * :%s/\s\+$//e

" 按 = 自動 format
autocmd FileType c,cpp,objc nnoremap <buffer>= :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer>= :ClangFormat<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" quick open vimrc in a new tab
nmap <leader>v :tabe ~/.vimrc<CR>
"quick source .vimrc
map <leader>s :source ~/.vimrc<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Return to last edit position when opening files (You want this!)
" 回到上次關閉前的位置
autocmd BufReadPost *
            \ if line("'\"") > 0 && line("'\"") <= line("$") |
            \   exe "normal! g`\"" |
            \ endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"當你用 :make , :vimgrep
"之類的指令時，產生的結果會顯示在另外一個新開的視窗，這個視窗就是
"Quickfix，要自己叫出來就得用 :copen , :cclose , :clist 這類指令叫出來
"
"quickfix window toggle function
"from c9s
"leader 一般預設是 \
com! -bang -nargs=? QFix cal QFixToggle(<bang>0)
fu! QFixToggle(forced)
    if exists("g:qfix_win") && a:forced == 0
        cclose
        unlet g:qfix_win
    else
        copen 8
        let g:qfix_win = bufnr("$")
    en
endf
nmap <leader>q :QFix<cr>

"map ctrl+n 和ctrl+p
map <C-n> :cnext<CR>
map <C-p> :cprev<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"}}}
"compile鍵{{{
"!gcc 時，會用C99編譯程同檔名(但不加副檔名( %:r ))的執行檔
"!gcr ，編譯後執行
"cmapgcc !gcc -std=c11 -Wall -Wextra -pedantic -Ofast % -lm -g -o %:r.out
"cmap !gcc99 !gcc -std=c99 -Wall -Wextra -pedantic -Ofast % -lm -g -o %:r.out
"這裡的!gcc會被上面的取代
"cmap !g++ !g++-4.8 -std=c++11 -g -Wall -Wextra -pedantic -Ofast % -lm -g -o %:r.out

"clang
"cmap !clang   !clang -std=c99 -Wall -Wextra -pedantic % -lm -g -o %:r.out
"cmap !clang89 !clang -std=c89 -Wall -Wextra -pedantic % -lm -g -o %:r.out
"cmap !clang++ !clang++ -std=c++11 -g -Wall -Wextra -pedantic % -lm -g -o %:r.out
"cmap !clang++03 !clang++ -std=c++03 -g -Wall -Wextra -pedantic % -lm -g -o %:r.out

"cmap !clangr   !clang && ./%:r.out
"cmap !clangr89 !clang89 && ./%:r.out

"cmap !clang++   !clang++ -std=c++11 -g -Wall -Wextra -pedantic % -lm -g -o %:r.out
"cmap !clang+r   !clang++ && ./%:r.out

au FileType c   set makeprg=gcc\ -std=c11\ -Wall\ -Ofast\ %\ -lm\ -g\ -o\ %:r.out
au FileType cpp set makeprg=g++\ -std=c++11\ -Ofast\ %\ -lm\ -g\ -o\ %:r.out


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"會依照上面的map
"python時，F9是python3，Ctrl+F9是python2
"au   FileType   c        map   <F9>     :w<CR>:make && ./%:r.out<CR>
"au   FileType   c        map   <F9>     :w<CR>:!gcr<CR>
au   FileType   c,cpp     noremap   <F9>     :w<CR>:make && ./%:r.out<CR>
au   FileType   c,cpp     noremap   <F8>     :w<CR>:make
au   FileType   python    noremap   <F9>     :w<CR>:!python3   %<CR>
au   FileType   python    noremap   <F8>   :w<CR>:!python2   %<CR>
au   FileType   perl      noremap   <F9>     :w<CR>:!perl      %<CR>
au   FileType   sh       map   <F9>     :w<CR>:!sh %
au   FileType   sh       map   <C-F9>   :w<CR>:!bash %<CR>

"F11為使用gdb (c,cpp)
"au   FileType   c,cpp    map   <F11>    :!gdb   -q   %<   <CR>

"設qq為離開
map qq :q<CR>
"在man裡，設qq為強制離開
au   FileType   man      map   qq       :q!<CR>

" K to lookup current word in perldoc
au FileType perl nmap K :!perldoc <cword> <bar><bar> perldoc -f <cword><CR><CR>

" K to lookup current word in cppman
au FileType cpp nmap K :!cppman <cword> <bar><bar> cppman -f <cword><CR><CR>
"}}}
"other syntax {{{
" Markdown
"au BufNewFile,BufRead *.markdown,*.mdown,*.mkd,*.mkdn,README.md  setf markdown
au BufRead,BufNewFile *.md set filetype=markdown
"}}}
"vimgdb {{{
"詳細請看vimgdb的code
"let g:vimgdb_debug_file =""
"在需要的時候按F12載入/移除vimgdb的map
"map <F12> :run macros/gdb_mappings.vim<CR>
"nmap <silent><LEADER>g :run macros/gdb_mappings.vim<cr>
"map <leader>g :call gdb("")<CR>

"set mouse=a
" set gdb window initial height or width(if you set splitright)
"set previewheight=50
" don't show any assembly stuff
" set asm=0
" set GDB invocation string (default 'gdb')
" set gdbprg=/usr/bin/gdb
" map <C-F12> :bel 30vsplit gdb-variables<cr>

"wait to fix
"au FileType gdb set gdbprg=gdb\ --args

" set gdb windows split in right side
"set splitright
" set gdb windows not split below
"set nosplitbelow

"let gdb_var_win = 0
"function! GdbVar()
"    if g:gdb_var_win
"關閉視窗(未完成)
"let g:gdb_var_win = 0
"    else
"        :bel 8 split gdb-variables<CR>
"        let g:gdb_var_win = 1
"    endif
"endfunction

"nmap <silent><> :call GdbVar()<CR>
"nmap <silent><leader>v :bel 8 split gdb-variables<CR>

"只要 Ctrl + V 就可以打開 variable window，要讓 variable 顯示在 variable
"window 中，用 visual mode 選擇一個 variable ，之後再按 Ctrl + P ，即可
"在vimgdb 的macros/gdb_mappings.vim裡：let s:gdb_k = 1
"macros/gdb_mappings.vim
"   ToggleGDB()
"if s:gdb_k
"    nmap <silent> <C-V> :bel 8 split gdb-variables<CR>  " setl ctrl+v show variable window in button
"endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"}}}
" Setting up vim-plug - the vim plugin manager{{{
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
"}}}
"插件及設定{{{
"自定的vim套件
"installed Plugins{{{
"
" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')


" Better file browser
Plug 'scrooloose/nerdtree'
" Code commenter https://github.com/scrooloose/nerdcommenter
Plug 'scrooloose/nerdcommenter'
" Class/module browser
Plug 'majutsushi/tagbar'
" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Pending tasks list
Plug 'fisadev/FixedTaskList.vim'
" Indent text object vii to select same indent contents
Plug 'michaeljsmith/vim-indent-object'
"git related
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
" Python and other languages code checker
"Plug 'scrooloose/syntastic'
" ColorScheme
Plug 'sainnhe/sonokai'
Plug 'sheerun/vim-polyglot'
" Autocomplete
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" install needed language supports
" https://github.com/neoclide/coc.nvim/wiki/Using-coc-extensions
" C/C++ format
Plug 'rhysd/vim-clang-format'

" Initialize plugin system
call plug#end()


"}}}
"plugin settings{{{
"references
"https://github.com/fisadev/fisa-vim-config/blob/master/.vimrc
"https://github.com/fisadev/fisa-vim-config
"plugins settings and mappings
" Edit them as you wish.
" coc.nvim{{{
" https://github.com/neoclide/coc.nvim/wiki/Completion-with-sources#improve-the-completion-experience
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" }}}
"Tagbar -----------------------------{{{
"
" " toggle tagbar display
map <F4> :TagbarToggle<CR>
" " autofocus on tagbar open
let g:tagbar_autofocus = 1
"}}}
"NERDTree -----------------------------{{{
"
" " toggle nerdtree display
map <F3> :NERDTreeToggle<CR>
" " open nerdtree with the current file selected
nmap ,t :NERDTreeFind<CR>
" " don;t show these file types
let NERDTreeIgnore = ['\.pyc$', '\.pyo$']
" close the nerdtree after file open
let NERDTreeQuitOnOpen=1

"-------按鍵說明
"
":NERDTree 開啟
" ? Help
" i 開在 split 視窗(水平)
" s 開在 split 視窗(垂直)
" t 開在新的 tab
" o Open file / directory
" x close directory
" q 關掉
"
"
"}}}
"Tasklist ------------------------------{{{
"
" " show pending tasks list
map <F2> :TaskList<CR>

"}}}
" Vim-debug ------------------------------{{{
"
" " disable default mappings, have a lot of conflicts with oter plugins
" let g:vim_debug_disable_mappings = 1
" " add some useful mappings
" map <F5> :Dbg over<CR>
" map <F6> :Dbg into<CR>
" map <F7> :Dbg out<CR>
" map <F8> :Dbg here<CR>
" map <F9> :Dbg break<CR>
" map <F10> :Dbg watch<CR>
" map <F11> :Dbg down<CR>
" map <F12> :Dbg up<CR>
"
"}}}
" Syntastic ------------------------------{{{
let g:syntastic_cpp_config_file = '.syntastic_include_config'
let g:syntastic_c_config_file = '.syntastic_include_config'
let g:syntastic_cpp_compiler_options = ' -std=c++11 -Wall'

function! ToggleLocationList()
    if g:loaded_syntastic_loclist == 0
        let g:loaded_syntastic_loclist = 1
        Error
    elseif g:loaded_syntastic_loclist == 1
        let g:loaded_syntastic_loclist = 0
        lclose
    endif
endfunction

map <leader>e :call ToggleLocationList()<cr>

let g:syntastic_loc_list_height = 6
" show list of errors and warnings on the current file
let g:syntastic_auto_loc_list = 2
"nmap <leader>e :Errors<CR>
" check also when just opened the file
let g:syntastic_check_on_open = 0
" don't put icons on the sign column (it hides the vcs status icons of signify)
let g:syntastic_enable_signs = 1
let g:syntastic_error_symbol = '✗>'
let g:syntastic_warning_symbol = '>⚠'
let g:syntastic_style_error_symbol = '✗'
let g:syntastic_style_warning_symbol = '>⚠'
"}}}
" Airline ------------------------------{{{
"themes
"let g:airline_powerline_fonts = 0
"let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline_detect_modified=1
let g:airline_detect_paste=1
let g:airline#extensions#tagbar#enabled = 1
" " to use fancy symbols for airline, uncomment the following
" lines and use a patched font (more info on the README.rst)
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'
"}}}
"pymode{{{
let g:pymode_lint_checkers = ['pep8',]
let g:pymode_lint_ignore = "E501,W"
let g:pymode_lint_cwindow = 0
" if you have large project in same dir, this can make rope faster
let g:pymode_rope_autoimport = 0
let g:pymode_rope_lookup_project = 0
" }}}
"colorscheme: Sonokai{{{
" Put the color scheme install by vim-plug here so it can be automatically
" activate
" Important!!
if has('termguicolors')
    set termguicolors
endif
"
" The configuration options should be placed before `colorscheme sonokai`.
let g:sonokai_style = 'andromeda'
let g:sonokai_enable_italic = 1
let g:sonokai_disable_italic_comment = 1

colorscheme sonokai


"}}}
" fzf {{{
set rtp+=/opt/local/share/fzf/vim
" }}}
" cscope{{{
cs add ./cscope.out

" }}}
"}}}
