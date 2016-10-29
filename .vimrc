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
" どの文字でタブや改行を表示するかを設定
set listchars=tab:>-,extends:<,trail:-,eol:<
" 長い行を折り返して表示 (nowrap:折り返さない)
set nowrap
" カラースキームの設定
colorscheme monokai
" カーソル業の強調
set cursorline

" 検索の設定
" 大文字小文字を無視
set ignorecase
" 検索対象に大文字小文字が混在する場合、大文字小文字を識別する
set smartcase


" 開いてるファイルのディレクトリにカレントディレクトリを変更する
set autochdir


