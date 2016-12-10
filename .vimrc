"dein Scripts-----------------------------
if &compatible
	  set nocompatible               " Be iMproved
	  endif

	  " Required:
	  set runtimepath+=/home/ubuntu/.cache/dein/repos/github.com/Shougo/dein.vim

	  " Required:
	  call dein#begin('/home/ubuntu/.cache/dein')

	  " Let dein manage dein
	  " Required:
	  call dein#add('Shougo/dein.vim')

	  " Add or remove your plugins here:
	  call dein#add('Shougo/neosnippet.vim')
	  call dein#add('Shougo/neosnippet-snippets')

	  " 追加
	  call dein#add('Shougo/neocomplete.vim')
	  call dein#add('Shougo/unite.vim')

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
"End dein Scripts-------------------------

"start neosnippet用設定-------------------------------
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
"end  neosnippet用設定-------------------------------




scriptencoding utf-8

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


" 開いてるファイルのディレクトリにカレントディレクトリを変更する
set autochdir
" ステータスライン表示設定
" 0: 表示しない
" 1: ウィンドウが2つ以上の時表示
" 2: 常に表示
set laststatus=2
" ステータスラインの表示項目設定
set statusline=%F%r%h%=%l/%L,%c/%V%8p%%


set tags+=$HOME/soft/glibc/glibc-2.23/tags
set tags+=/usr/src/linux-4.8.12/tags

