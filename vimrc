"{{{let &colorcolumn=join(range(81,999),",")
highlight ColorColumn ctermbg=235 guibg=#2c2d27
"}}}
" 一般設定{{{
" autocompletion of files and commands behaves like shell
" (complete only the common part, list the options that match)
set wildmode=list:longest
" set filetype on
filetype plugin indent on

" when scrolling, keep cursor 4 lines away from screen border
set scrolloff=4

" 開啟關鍵字上色功能
syntax on
"airline的status bar正常運作，用來設定亞洲字形用幾格來顯示
set ambiwidth=single
" 用空白來當作tab (et)
set expandtab
" 定義tab 的空格數 (ts)
set tabstop=4
au FileType html,xml,css set tabstop=2
au FileType html,xml,css set shiftwidth=2
" 自動縮排所使用的空格數 (sw)
set shiftwidth=4
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


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" enable 256 colors in vim (this must put before setting the colorscheme)
set t_Co=256
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"background color (put behind colorscheme)
set bg=dark
"set bg=light
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"quickly shift that line UP or DOWN
"noremap <leader>j :m+<ENTER>
"noremap <leader>k :m-2<ENTER>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"在insert mode 時，一鍵插入時間戳記
"imap <leader>t <C-R>=strftime("%c")<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
au FileType cpp set makeprg=g++\ -std=c++11\ -g\ -Ofast\ %\ -lm\ -g\ -o\ %:r.out
au FileType go  set makeprg=go\ run\ %


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"會依照上面的map
"python時，F9是python3，Ctrl+F9是python2
"au   FileType   c        map   <F9>     :w<CR>:make && ./%:r.out<CR>
"au   FileType   c        map   <F9>     :w<CR>:!gcr<CR>
au   FileType   c,cpp     noremap   <F9>     :w<CR>:make && ./%:r.out<CR>
au   FileType   go     noremap   <F8>   :w<CR>:make<CR>
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
set splitright
" set gdb windows not split below
set nosplitbelow

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
" Setting up Vundle - the vim plugin bundler {{{
" 這裡包含自動安裝Vundle
let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
    echo "Installing Vundle.."
    echo ""
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
    let iCanHazVundle=0
endif


set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
Bundle 'gmarik/vundle'


if iCanHazVundle == 0
    echo "Installing Bundles, please ignore key map error messages"
    echo ""
    :BundleInstall
endif
" Setting up Vundle - the vim plugin bundler end

" Brief help
" :BundleList - list configured bundles
" :BundleInstall(!) - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!) - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"}}}
"插件及設定{{{
"自定的vim套件
"bundle setting{{{
"
"上面寫過了
"Bundle 'gmarik/vundle'

" ============================================================================
" Active plugins
" You can disable or add new ones here:

" Plugins from github repos:
"golang syntax
"C/C++ complete
Bundle 'Shougo/vimproc.vim'
Bundle 'osyo-manga/vim-marching'
"Python complete
Bundle 'davidhalter/jedi-vim'
" Python and PHP Debugger
"Bundle 'fisadev/vim-debug.vim'
" Better file browser
Bundle 'scrooloose/nerdtree'
" Code commenter
Bundle 'scrooloose/nerdcommenter'
" Class/module browser
Bundle 'majutsushi/tagbar'
" Zen coding
Bundle 'mattn/emmet-vim'
" Git integration
Bundle 'motemen/git-vim'
" Tab list panel
"Bundle 'kien/tabman.vim'
" Airline
Bundle 'bling/vim-airline'
" Terminal Vim with 256 colors colorscheme
Bundle 'fisadev/fisa-vim-colorscheme'
" Consoles as buffers
Bundle 'rosenfeld/conque-term'
" Pending tasks list
Bundle 'fisadev/FixedTaskList.vim'
" Surround
"Bundle 'tpope/vim-surround'
" Autoclose
"Bundle 'Townk/vim-autoclose'
" Indent text object
Bundle 'michaeljsmith/vim-indent-object'
" Python mode (indentation, doc, refactor, lints, code checking, motion and
" operators, highlighting, run and ipdb breakpoints)
" Better autocompletion
Bundle 'Shougo/neocomplete.vim'
Bundle 'Shougo/neosnippet.vim'
Bundle 'Shougo/neosnippet-snippets'
"Snippets manager (SnipMate), dependencies, and snippets repo
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
" Python and other languages code checker
Bundle 'scrooloose/syntastic'
" XML/HTML tags navigation
Bundle 'matchit.zip'
" Gvim colorscheme
Bundle 'Wombat'

" ============================================================================
" Install plugins the first time vim runs

if iCanHazVundle == 0
    echo "Installing Bundles, please ignore key map error messages"
    echo ""
    :BundleInstall
endif

" ============================================================================
" Vim settings and mappings
" You can edit them as you wish

" allow plugins by file type (required for plugins!)
filetype plugin on
filetype indent on

"}}}
"plugin settings{{{
"references
"https://github.com/fisadev/fisa-vim-config/blob/master/.vimrc
"https://github.com/fisadev/fisa-vim-config
"plugins settings and mappings
" Edit them as you wish.
            " vim marching c/c++ complete{{{
let g:marching_clang_command = "/usr/bin/clang"
let g:marching#clang_command#options = {
            \   "cpp" : "-std=c++11"
            \}
let g:marching_include_paths = filter(
          \ split(glob('/usr/include/c++/*'), '\n') +
          \ split(glob('/usr/include/*/c++/*'), '\n') +
          \ split(glob('/usr/include/*/'), '\n'),
          \ 'isdirectory(v:val)')
let g:marching_enable_neocomplete = 1
if !exists('g:neocomplete#force_omni_input_patterns')
      let g:neocomplete#force_omni_input_patterns = {}
  endif
"let g:neocomplete#force_omni_input_patterns.cpp =
"    \ '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'
set updatetime=200
"}}}
"  Jedi-Python complete----------------{{{
let g:jedi#popup_select_first = 0 "useless!
let g:jedi#auto_initialization = 1
let g:jedi#goto_assignments_command = ""
let g:jedi#goto_definitions_command = ""
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = ""
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = ""
let g:jedi#show_call_signatures = "1"

function! ToggleJedi()
	if  g:jedi#completions_enabled ==0
		let g:jedi#completions_enabled = 1
	elseif g:jedi#completions_enabled == 1
		let g:jedi#completions_enabled = 0
	endif
endfunction
map <leader>j :call ToggleJedi()<cr>

"20140706
"fix jedi auto select the first candidate (popup_select_first=0 won't effect)
"https://github.com/davidhalter/jedi-vim/issues/258
let g:jedi#popup_on_dot=0 "dont let jedi call the complete
let g:neocomplete#force_omni_input_patterns.python = '[^. \t]\.\w*'
"add below in Neocomplete, let Neocomplete call the omnifunc and complete
"autocmd FileType python setlocal omnifunc=jedi#completions

"}}}
" " Tagbar -----------------------------{{{
"
" " toggle tagbar display
map <F4> :TagbarToggle<CR>
" " autofocus on tagbar open
let g:tagbar_autofocus = 1
"}}}
" " NERDTree -----------------------------{{{
"
" " toggle nerdtree display
map <F3> :NERDTreeToggle<CR>
" " open nerdtree with the current file selected
nmap ,t :NERDTreeFind<CR>
" " don;t show these file types
let NERDTreeIgnore = ['\.pyc$', '\.pyo$']
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
" " Tasklist ------------------------------{{{
"
" " show pending tasks list
map <F2> :TaskList<CR>

"}}}
" " Vim-debug ------------------------------{{{
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
"               " Syntastic ------------------------------{{{

let g:syntastic_cpp_compiler_options = ' -std=c++11'
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

" show list of errors and warnings on the current file
let g:syntastic_auto_loc_list = 2
"nmap <leader>e :Errors<CR>
" check also when just opened the file
let g:syntastic_check_on_open = 1
" don't put icons on the sign column (it hides the vcs status icons of signify)
let g:syntastic_enable_signs = 0
"               " custom icons (enable them if you use a patched font, and
"               enable the previous
"               " setting)
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_style_error_symbol = '✗'
let g:syntastic_style_warning_symbol = '⚠'
"}}}
"               " NeoComplete ------------------------------{{{
"
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-q>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-s> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 0
" Shell like behavior(not recommended).

"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
set ofu=syntaxcomplete#Complete
"按~自動補全(不用std::也可以用)
"imap <silent> ` <C-X><C-O>

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"disable neocomplete for python(use jedi-vim instead)
autocmd FileType python setlocal omnifunc=jedi#completions
"autocmd FileType python NeoCompleteLock
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"遇到下面regex使用omnifunc,加上.*\w*則可啟動所有word都進行omnifunc
"\|是條件分隔符號
let g:neocomplete#sources#omni#input_patterns.cpp =
    \ '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*\|.*\w*'
" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
"}}}
"            " NeoSnippet-----------------------------{{{
"
"key-mappings.
imap <C-b>     <Plug>(neosnippet_expand_or_jump)
smap <C-b>     <Plug>(neosnippet_expand_or_jump)
xmap <C-b>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif
"
"}}}
"" Airline ------------------------------{{{
"themes
"let g:airline_theme="laederon"
"let g:airline_theme='molokai'
let g:airline_theme='wombat'
"let g:airline_theme='luna'
"let g:airline_theme='solarized'
"let g:airline_theme='badwolf'
"let g:airline_theme='simple'
"
"let g:airline_powerline_fonts = 0
"let g:airline_theme = 'bubblegum'
"let g:airline#extensions#whitespace#enabled = 0
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
"}}}
