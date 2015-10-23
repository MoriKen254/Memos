"--------1---------2---------3----------4---------5---------6---------7---------8---------9---------0
"****************************************************************************************************
"" Neobundle インストール設定
set nocompatible
filetype off

if has('vim_starting')
	" 初回起動時のみruntimepathにneobundleのパスを指定する
	set runtimepath+=$HOME/.vim/bundle/neobundle.vim/
endif

" NeoBundleを初期化
call neobundle#begin(expand('~/.vim/bundle/'))
" インストールするプラグインをここに記述
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'davidhalter/jedi-vim'
NeoBundle 'Shougo/vimproc.vim', {
			\ 'build' : {
			\ 'windows' : 'make -f make_mingw32.mak',
			\ 'cygwin' : 'make -f make_cygwin.mak',
			\ 'mac' : 'make -f make_mac.mak',
			\ 'unix' : 'make -f make_unix.mak',
			\ },
			\ }
"Neobundle 'Shougo/vimshell.vim
NeoBundleLazy 'Shougo/vimshell', {
			\ 'depends' : 'Shougo/vimproc',
			\ 'autoload' : {
			\   'commands' : [{ 'name' : 'VimShell', 'complete' : 'customlist,vimshell#complete'},
			\                 'VimShellExecute', 'VimShellInteractive',
			\                 'VimShellTerminal', 'VimShellPop'],
			\   'mappings' : ['<Plug>(vimshell_switch)']
			\ }}
NeoBundle 'osyo-manga/vim-reunions'
NeoBundle 'osyo-manga/vim-marching'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'nathanaelkane/vim-indent-guides'                 " インデントハイライトプラグイン
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'tpope/vim-fugitive.git'
call neobundle#end()
" ファイルタイプ別のプラグイン/インデントを有効にする
filetype plugin indent on

NeoBundleCheck


"****************************************************************************************************
"--------1---------2---------3----------4---------5---------6---------7---------8---------9---------0
"****************************************************************************************************
"" Neobundle 詳細設定

""" lightline {{{
set guifont=Ricty\ 10

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'component': {
      \   'readonly': '%{&readonly?"x":""}',
      \ },
      \ 'separator': { 'left': "\u2b80", 'right': "\u2b82" },
      \ 'subseparator': { 'left': "\u2b81", 'right': "\u2b83" }
      \ }

"let g:lightline = {
"      \ 'colorscheme': 'wombat',
"      \ 'component': {
"      \   'readonly': '%{&readonly?"x":""}',
"      \ },
"      \ 'separator': { 'left': '', 'right': '' },
"      \ 'subseparator': { 'left': '|', 'right': '|' }
"      \ }

set laststatus=2
set t_Co=256
"""}}}

"""gitgutter
nnoremap <silent> ,gg :<C-u>GitGutterToggle<CR>
nnoremap <silent> ,gh :<C-u>GitGutterLineHighlightsToggle<CR>

""" neocomplete {{{
let g:neocomplete#enable_at_startup               = 1
let g:neocomplete#auto_completion_start_length    = 3
let g:neocomplete#enable_ignore_case              = 1
let g:neocomplete#enable_smart_case               = 1
let g:neocomplete#enable_camel_case               = 1
let g:neocomplete#use_vimproc                     = 1
let g:neocomplete#sources#buffer#cache_limit_size = 1000000
let g:neocomplete#sources#tags#cache_limit_size   = 30000000
let g:neocomplete#enable_fuzzy_completion         = 1
let g:neocomplete#lock_buffer_name_pattern        = '\*ku\*'
" docstringは表示しない
autocmd FileType python setlocal completeopt-=preview
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
""""}}}

""" vimshell {{{
nmap <silent> vs :<C-u>VimShell<CR>
nmap <silent> vp :<C-u>VimShellPop<CR>
" }}}

""" vimfiler {{{
let g:vimfiler_as_default_explorer  = 1
let g:vimfiler_safe_mode_by_default = 0
let g:vimfiler_data_directory       = expand('~/.vim/etc/vimfiler')
nmap <silent> vimf :<C-u>VimFilerBufferDir -split -simple -winwidth=35 -no-quit -toggle<CR>
" }}}

let g:seiya_auto_enable=1

""" vim-indent-guides {{{
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level=2
let g:indent_guides_auto_colors=0
"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=235
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=239
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=25
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=22
let g:indent_guides_color_change_percent = 30
let g:indent_guides_guide_size = 1

"let g:indent_guides_auto_colors=0
"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd   ctermbg=110
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven  ctermbg=140
"let g:indent_guides_enable_on_vim_startup=1
"let g:indent_guides_guide_size=1
" }}}

""" vim-easymotion {{{
" easy-motionのトレーニング
function! StartEMTraining ()
  noremap h <Nop>
  noremap j <Nop>
  noremap k <Nop>
  noremap l <Nop>
endfunction

" easy-motionのトレーニング解除
" ＿人人人人人人人＿
" ＞　非推奨！！　＜
" ￣Y^Y^Y^Y^Y^Y￣
function! StopEMTraining ()
  nnoremap h <Left>
  nnoremap j gj
  nnoremap k gk
  nnoremap l <Right>
endfunction
" }}}

command! StartEMTraining call StartEMTraining()
command! StopEMTraining call StopEMTraining()

" デフォルトはトレーニングモード"
call StartEMTraining()

"****************************************************************************************************
"--------1---------2---------3----------4---------5---------6---------7---------8---------9---------0
"****************************************************************************************************
""" jedi-vim(python complete) {{{
autocmd filetype python setlocal omnifunc=jedi#completions
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
if !exists('g:neocomplete#force_omni_input_patterns')
	    let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.python = '\h\w*\|[^. \t]\.\w*'
let g:python_highlight_all = 1
"""}}}

""" for some comlete function(cpp)
let g:neocomplete#force_omni_input_patterns.cpp =
      \ '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*' 


"****************************************************************************************************
"--------1---------2---------3----------4---------5---------6---------7---------8---------9---------0
"****************************************************************************************************
"" vim 標準設定
""" 中間ファイル設定 {{{
set nobackup                           "~の作成無効化
set writebackup                        "上書き成功時に~を削除
"""}}}

""" クリップボード設定 {{{
set guioptions+=a                      "クリップボードを共有(gvim用)
set clipboard+=unnamed,autosele        "クリップボードを共有
set clipboard=unnamedplus              "クリップボードを共有
"""}}}

""" スペルチェック {{{
"set spelllang=+cjk
"set spell
"""}}}

""" 操作設定 {{{
set mouse=a                            " 全モードでマウス利用可能
set ttymouse=xterm2                    " マウスホイール利用可能
set backspace=start,eol,indent         " backspace で削除可能
set incsearch                          " インクリメンタル検索
set wildmenu wildmode=list:full        " コマンドラインモード補完機能
set whichwrap=b,s,h,l,<,>,[,],~        " 横移動で行を移動できるようにする
"""}}}

""" 文字設定 {{{
set encoding=utf-8                     "vim
scriptencoding utf-8
set fileencoding=utf-8                 "保存するファイル
set termencoding=utf-8                 "開くファイル
set softtabstop=4                      " タブによる半角文字数
set shiftwidth=4                       "インデント幅
set expandtab
set smartindent                        "挿入モードでタブ文字有効
set smarttab	
"""}}}

""" 表示設定 {{{
syntax on                              "ハイライト表示
set number                             "タイトル
set title                              "行番号
set nohlsearch                         " 検索時ハイライトなし
set cursorline                         " カーソル行ハイライト
"""}}}

""" カラースキーマ設定 {{{
set t_Co=256
colorscheme molokai
let g:molokai_original=1
set background=dark
"highlight Comment ctermfg=LightCyan 
" 背景黒字のハイライト色を設定
highlight Normal ctermbg=black ctermfg=white
highlight statusline term=none cterm=none ctermfg=black ctermbg=grey
highlight cursorline term=none cterm=none ctermfg=none ctermbg=black
"highlight cursorline term=none cterm=none ctermfg=none ctermbg=darkgray
"""}}}

""" キーバインド設定 {{{
"<Leader>をスペースに設定
let mapleader = "\<Space>"

"""" normal mode ****
"""" ノーマルモードでのカーソル移動 {{{{
nnoremap <S-h> ^
nnoremap <S-j> )
nnoremap <S-k> (
nnoremap <S-l> $
"""}}}}

"""" find highlight cancel {{{{
nmap <silent> nh :<C-u>noh<CR>
"""" }}}}

""""ESCでIMEを確実に解除 {{{{
inoremap <silent> <ESC> <ESC>:call ForceImeOff()<CR>
function! ForceImeOff()
	let imeoff = system('xvkbd -text "\[Control]\[Shift]\[space]" > /dev/null 2>&1')
endfunction
"""" }}}}

"""" insert mode ****
"""" normalモードで上下左右ボタンを矯正無効化 {{{{
nnoremap <Up> <Nop>
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>
"""" }}}}

"""" insertモードから抜ける {{{{
inoremap <silent> jj <ESC>
inoremap <silent> kk <ESC>
inoremap <silent> hh <ESC>
"""" }}}}

"""" 挿入モードでのカーソル移動 {{{{
"inoremap <C-k> <Up>
"inoremap <C-j> <Down>
"inoremap <C-h> <Left>
"inoremap <C-l> <Right>
"""" }}}}

"""" command mode ****
"""" コマンドモードで履歴フィルタリング {{{{
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <expr> %% (getcmdtype() == ':') ? expand('%:h').'/' : '%%'
"""" }}}}


"****************************************************************************************************
"--------1---------2---------3----------4---------5---------6---------7---------8---------9---------0
"****************************************************************************************************
""" Vim-LaTeX {{{ 
filetype plugin on
filetype indent on
set shellslash
set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'
let g:Imap_UsePlaceHolders = 1
let g:Imap_DeleteEmptyPlaceHolders = 1
let g:Imap_StickyPlaceHolders = 0
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_MultipleCompileFormats='dvi,pdf'
"let g:Tex_FormatDependency_pdf = 'pdf'
let g:Tex_FormatDependency_pdf = 'dvi,pdf'
"let g:Tex_FormatDependency_pdf = 'dvi,ps,pdf'
let g:Tex_FormatDependency_ps = 'dvi,ps'
let g:Tex_CompileRule_pdf = 'ptex2pdf -u -l -ot "-synctex=1 -interaction=nonstopmode -file-line-error-style" $*'
"let g:Tex_CompileRule_pdf = 'pdflatex -synctex=1 -interaction=nonstopmode -file-line-error-style $*'
"let g:Tex_CompileRule_pdf = 'lualatex -synctex=1 -interaction=nonstopmode -file-line-error-style $*'
"let g:Tex_CompileRule_pdf = 'luajitlatex -synctex=1 -interaction=nonstopmode -file-line-error-style $*'
"let g:Tex_CompileRule_pdf = 'xelatex -synctex=1 -interaction=nonstopmode -file-line-error-style $*'
"let g:Tex_CompileRule_pdf = 'ps2pdf $*.ps'
let g:Tex_CompileRule_ps = 'dvips -Ppdf -o $*.ps $*.dvi'
let g:Tex_CompileRule_dvi = 'uplatex -synctex=1 -interaction=nonstopmode -file-line-error-style $*'
let g:Tex_BibtexFlavor = 'upbibtex'
let g:Tex_MakeIndexFlavor = 'upmendex $*.idx'
let g:Tex_UseEditorSettingInDVIViewer = 1
"let g:Tex_ViewRule_pdf = 'xdg-open'
let g:Tex_ViewRule_pdf = 'evince'
"let g:Tex_ViewRule_pdf = 'okular --unique'
"let g:Tex_ViewRule_pdf = 'zathura -s -x "vim --servername synctex -n --remote-silent +\%{line} \%{input}"'
"let g:Tex_ViewRule_pdf = 'qpdfview --unique'
"let g:Tex_ViewRule_pdf = 'texworks'
"let g:Tex_ViewRule_pdf = 'mupdf'
"let g:Tex_ViewRule_pdf = 'firefox -new-window'
"let g:Tex_ViewRule_pdf = 'chromium --new-window'
""" }}}

