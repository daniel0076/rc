" 一般設定{{{
" set filetype on
filetype plugin indent on

" when scrolling, keep cursor 4 lines away from screen border
set scrolloff=4
" 開啟關鍵字上色功能
"syntax on
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
set ignorecase

"即時搜尋
"set is == set imsearch (immediate)
set is

"設定可以使用backspace
set bs=2

" 游標線
set cursorline
set cursorcolumn
" 不和舊式語法相容(相容會仿舊 vi 的 bug)
set nocompatible
"狀態列
set laststatus=2
" vim 裡打指令，按tab 會列出待選列表
set wildmenu
"自動縮排
"set ai == set autoindent
set ai

"在狀態欄顯示正在輸入的命令
set showcmd
"disable mouse for vim
"autocmd BufEnter * set mouse=
" enable mouse for vim
set mouse=a
"設定 w!!，當忘記用sudo 編輯時用w!! 儲存
cmap w!! w !sudo tee %

if &term =~ '256color'
    " disable Background Color Erase (BCE) so that color schemes
    " render properly when inside 256-color tmux and GNU screen.
    " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
    " https://stackoverflow.com/questions/6427650/vim-in-tmux-background-color-changes-when-paging/15095377#15095377
    set t_ut=
endif

"}}}
" 檔案格設定 {{{
au FileType htmldjango,html,xml,css,ts set tabstop=2
au FileType htmldjango,html,xml,css,ts set shiftwidth=2
au FileType python set tabstop=4 shiftwidth=4

" C and C++ specific settings (C 語法縮排)
autocmd FileType c,cpp set cindent

set foldmethod=syntax
au FileType python set foldmethod=indent
au FileType vim,conf set foldmethod=marker foldlevel=0
set foldlevel=99

" }}}
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
"
"顯示tab
set list
"讓tab顯示成 >- 而行尾多餘的空白顯示成 -
set listchars=tab:>-,trail:~
"}}}
"熱鍵設定{{{
"map儲存
noremap <nowait> s <ESC>:w<CR>

"設qq為離開
map qq :q<CR>
"在man裡，設qq為強制離開
au   FileType   man      map   qq       :q!<CR>

"設定paste mode 的切換
function! PasteSwitch()
    if &paste
        set nopaste
    else
        set paste
    endif
endfunction
map <leader>p :call PasteSwitch()<CR>

" Split window
nmap sv :vsplit<CR><C-w>w
nmap ss :split<CR><C-w>w
" Move window
map sh <C-w>h
map sk <C-w>k
map sj <C-w>j
map sl <C-w>l
" resize splited windows
nmap th <C-w>5>
nmap tj <C-w>5-
nmap tk <C-w>5+
nmap tl <C-w>5<

"設定換tab
nmap tp :tabprevious<CR>
nmap tn :tabnext<CR>
nmap tt :tabe<SPACE>
nmap ts :tab split<space>
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
"autocmd BufWritePre * :%s/\s\+$//e

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

au FileType c   set makeprg=clang\ -std=c11\ -Wall\ -Ofast\ %\ -lm\ -g\ -o\ %:r.out
au FileType cpp set makeprg=clang++\ -std=gnu++20\ -Ofast\ %\ -lm\ -g\ -o\ %:r.out


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"會依照上面的map
au FileType c,cpp  noremap   <space>r     :w<CR>:make && ./%:r.out<CR>
au FileType python noremap   <space>r     :w<CR>:!python3   %<CR>
au FileType sh     noremap   <space>r     :w<CR>:!sh %

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
"Plug 'airblade/vim-gitgutter'
" Python and other languages code checker
"Plug 'scrooloose/syntastic'
" ColorScheme
Plug 'sainnhe/sonokai'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim' "needed for previews
Plug 'antoinemadec/coc-fzf'
" Autocomplete
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" C++ highlight with clangd
"Plug 'octol/vim-cpp-enhanced-highlight'
" install needed language supports
" https://github.com/neoclide/coc.nvim/wiki/Using-coc-extensions
" C/C++ format and highlighting
Plug 'rhysd/vim-clang-format'
Plug 'jackguo380/vim-lsp-cxx-highlight'
" gdb support
Plug 'puremourning/vimspector'

" Copilot
Plug 'github/copilot.vim'

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
let g:coc_global_extensions = ['coc-json', 'coc-explorer']

" https://github.com/neoclide/coc.nvim/wiki/Completion-with-sources#improve-the-completion-experience
inoremap <expr> <C-j> coc#pum#visible() ? coc#pum#next(1) : "\<C-j>"
inoremap <expr> <C-k> coc#pum#visible() ? coc#pum#prev(1) : "\<C-k>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=400

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> td :call CocAction('jumpDefinition', 'tabe')<CR>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')
nmap = :Format<CR>

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" toggle coc explorer
map ,e :CocCommand explorer<CR>

" }}}
"Tagbar -----------------------------{{{
"
" " toggle tagbar display
map ,o :TagbarToggle<CR>
" " autofocus on tagbar open
let g:tagbar_autofocus = 1
"}}}
"Tasklist ------------------------------{{{
"
" " show pending tasks list
map <C-F2> :TaskList<CR>

"}}}
" Syntastic ------------------------------{{{
let g:syntastic_cpp_compiler_options = ' -std=c++2a -Wall'

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
let g:sonokai_transparent_background = 0

colorscheme sonokai


"}}}
" fzf {{{
" mappings
nnoremap <silent><nowait> <space><space> :<C-u>CocFzfList<CR>
nnoremap <silent><nowait> <space>d       :<C-u>CocFzfList diagnostics<CR>
nnoremap <silent><nowait> <space>b       :<C-u>CocFzfList diagnostics --current-buf<CR>
nnoremap <silent><nowait> <space>c       :<C-u>CocFzfList commands<CR>
nnoremap <silent><nowait> <space>e       :<C-u>Files<CR>
nnoremap <silent><nowait> <space>l       :<C-u>CocFzfList location<CR>
nnoremap <silent><nowait> <space>o       :<C-u>CocFzfList outline<CR>
nnoremap <silent><nowait> <space>s       :<C-u>CocFzfList symbols<CR>
nnoremap <silent><nowait> <space>p       :<C-u>CocFzfListResume<CR>
" fzf preview bindkeys
let $FZF_DEFAULT_OPTS="--preview-window 'right:57%' --preview 'bat --style=numbers --line-range :300 {}'
            \ --bind ctrl-u:preview-half-page-up,ctrl-d:preview-half-page-down"
" }}}
" cscope{{{
"cs add ./cscope.out

" }}}
" cpp-enhanced-highlight{{{
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_class_scope_highlight = 1

" }}}
" cxx-highlight {{{
hi LspCxxHlGroupMemberVariable ctermfg=LightYellow guifg=LightYellow
" }}}
" vimspector {{{
let g:vimspector_install_gadgets = [ 'debugpy', 'vscode-cpptools']
let g:vimspector_enable_mappings = 'VISUAL_STUDIO'
nmap <Leader>di <Plug>VimspectorBalloonEval
" }}}
" copilot {{{

" }}}
