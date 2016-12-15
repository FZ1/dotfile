scriptencoding utf-8

"===========================================================================
" Start dein Scripts
"===========================================================================
if &compatible
	  set nocompatible               " Be iMproved
	  endif

	  " Required:
	  set runtimepath+=$HOME/.cache/dein/repos/github.com/Shougo/dein.vim

	  " Required:
	  call dein#begin('$HOME/.cache/dein')

	  " Let dein manage dein
	  " Required:
	  call dein#add('Shougo/dein.vim')

	  " Add or remove your plugins here:
	  call dein#add('Shougo/neosnippet.vim')
	  call dein#add('Shougo/neosnippet-snippets')

	  " 追加
	  call dein#add('Shougo/neocomplete.vim')
	  call dein#add('Shougo/unite.vim')
	  call dein#add('honza/vim-snippets')
	  call dein#add('thinca/vim-quickrun')
	  call dein#add('Shougo/vimproc.vim', {'build' : 'make'})
	  call dein#add('osyo-manga/shabadou.vim')
	  call dein#add('osyo-manga/vim-watchdogs')
	  call dein#add('jceb/vim-hier')
	  call dein#add('scrooloose/nerdtree')

	  " You can specify revision/branch/tag.
	  call dein#add('Shougo/vimproc.vim', {'build' : 'make'})
	  call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

	  " Required:
	  call dein#end()

	  " Required:
	  filetype plugin indent on
	  syntax enable

	  " If you want to install not installed plugins on startup.
	  if dein#check_install()
	    call dein#install()
	  endif

"===========================================================================
"Start neocomplete Setting
"===========================================================================
"Note: This option must be set in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3

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
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType c setlocal omnifunc=ccomplete#Complete

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

let g:neocomplete#include_paths = {
  \ 'c'    : '.,/usr/include,/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.12.sdk/usr/include/c++/4.2.1/',
  \ }

"===========================================================================
"start neosnippet用設定
"===========================================================================
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

"===========================================================================
" Start QuickRun setting
"===========================================================================
" 出力先
" 成功した場合：quickrun 専用の出力バッファ
" 失敗した場合：quickfix を :copen で開く
" バッファの開き方：botright 8sp
"
" コマンドの実行は vimproc.vim を使用する
" runner に vimproc を設定
" runner/vimproc/updatetime には更新するタイミングを設定
" この値が大きいとコンパイルが終了していても
" 結果が出力されるまでに時間がかかる可能性がある。

" , 区切りで複数のディレクトリを設定する事ができる
" setlocal path+=.,/usr/includ,/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.12.sdk/usr/include/c++/4.2.1
let $CPP_INCLUDE_PATH = "/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.12.sdk/usr/include/c++/4.2.1"
setlocal path+=/usr/includ
setlocal path+=$CPP_INCLUDE_PATH

let g:quickrun_config = {
\   "_" : {
\       "outputter" : "error",
\       "outputter/error/success" : "buffer",
\       "outputter/error/error"   : "quickfix",
\       "outputter/buffer/split" : ":botright 8sp",
\       "outputter/quickfix/open_cmd" : "copen",
\       "runner" : "vimproc",
\       "runner/vimproc/updatetime" : 500,
\   },
\   "c/gcc" : {
\       "cmdopt" : "-std=c99 -Wall -g -O0",
\   },
\   "c/watchdogs_checker" : {
\       "type" : "watchdogs_checker/gcc",
\   },
\   "watchdogs_checker/gcc" : {
\       "cmdopt" : "-std=c99 -Wall -g -o0",
\   },
\}

" この関数に g:quickrun_config を渡す
" この関数で g:quickrun_config にシンタックスチェックを行うための設定を追加する
" 関数を呼び出すタイミングはユーザの g:quickrun_config 設定後
call watchdogs#setup(g:quickrun_config)

" 書き込み後にシンタックスチェックを行う
let g:watchdogs_check_BufWritePost_enable = 1

" filetype ごとに有効無効を設定することも出来る
let g:watchdogs_check_BufWritePost_enables = {
\   "cpp" : 0, 
\   "haskell" : 1,
\}

" :QuickRun 時に quickfix の中身をクリアする
" こうしておかないと quickfix の中身が残ったままになってしまうため
let s:hook = {
\   "name" : "clear_quickfix",
\   "kind" : "hook",
\}

function! s:hook.on_normalized(session, context)
    call setqflist([])
endfunction

call quickrun#module#register(s:hook, 1)
unlet s:hook

"===========================================================================
" vim-heirの設定
"===========================================================================
"execute 'highlight ucurl_my ctermbg=DarkRed cterm=undercurl'
"let g:hier_highlight_group_qf = 'ucurl_my'

let g:hier_enabled              = 1

"===========================================================================
" NERDTreeの設定
"===========================================================================

nnoremap <silent><C-e> :NERDTreeToggle<CR>

"===========================================================================

set ts=4 sts=4 sw=4 tw=0

"---------------------------------------------------------------------------
" 編集に関する設定:
"
" タブの画面上での幅
"set tabstop=8
" タブをスペースに展開しない (expandtab:展開する)
set noexpandtab
" オートインデント
set autoindent
" かしこいインデント
set smartindent

"---------------------------------------------------------------------------
" GUI固有ではない画面表示の設定:
"
" 行番号を非表示 (number:表示)
set number
" タブや改行を表示 (list:表示)
set nolist
" シンタックスハイライト
syntax on
" どの文字でタブや改行を表示するかを設定
set listchars=tab:>-,trail:-,eol:<,extends:<,precedes:<,nbsp:%
" 長い行を折り返して表示 (nowrap:折り返さない)
set nowrap
" カラースキームの設定
colorscheme monokai
" カーソル業の強調
set cursorline
" ターミナルのタイトル表示
set title
" 対応する括弧を一瞬強調
set showmatch


" 検索の設定
" 大文字小文字を無視
set ignorecase
" 検索対象に大文字小文字が混在する場合、大文字小文字を識別する
set smartcase
" 検索対象文字列をハイライト
set hlsearch
" インクリメンタルサーチ
set incsearch
" 循環検索
set nowrapscan


" 開いてるファイルのディレクトリにカレントディレクトリを変更する
set autochdir
" ステータスライン表示設定
" 0: 表示しない
" 1: ウィンドウが2つ以上の時表示
" 2: 常に表示
set laststatus=2
" ステータスラインの表示項目設定
set statusline=%F%r%h%=%l/%L,%c/%V%8p%%
set wildmenu
set wildmode=list:full


set tags+=$HOME/soft/glibc/glibc-2.23/tags
set tags+=/usr/src/linux-4.8.12/tags

