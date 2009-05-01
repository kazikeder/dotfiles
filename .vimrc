"--------------------------------------------------
" Update:2009/04/24
"
" ToDo
" プラグイン
"
"
"
"
"
"--------------------------------------------------

"--------------------------------------------------
" 基本設定
"--------------------------------------------------
set nocompatible        " Vi互換をオフ
set nobackup            " バックアップファイルを作成しない
set noswapfile          " スワップファイルを作成しない
set browsedir=buffer    " ファイル保存ダイアログの初期ディレクトリをバッファファイル位置に設定
set number              " 行番号を表示する
set ruler               " ルーラーの表示
set nowrap              " 折り返し表示をしない
set cursorline          " カーソル行の強調表示
set scrolloff=5         " スクロール時の余白確保
set textwidth=0         " 一行に長い文章を書いていても自動折り返しをしない
set autoread            " 他で書き換えられたら自動で読み直す
set hidden              " 編集中でも他のファイルを開けるようにする
set backspace=indent,eol,start " バックスペースでなんでも消せるように
set formatoptions=lmoq  " テキスト整形オプション，マルチバイト系を追加
set vb t_vb=            " ビープをならさない
set whichwrap=b,s,h,l,<,>,[,]  " カーソルを行頭、行末で止まらないようにする
filetype on             " ファイルタイプ
filetype indent off     " ファイルタイプによるインデント
filetype plugin on      " ファイルタイプごと

if has('win32')
    set clipboard=unnamed   " クリップボードをWindowsと連携
endif

"set list               " タブ文字、行末など不可視文字を表示する
"set listchars=eol:$,tab:>\ ,extends:< " listで表示される文字のフォーマットを指定する


"--------------------------------------------------
" インデント / TAB
"--------------------------------------------------
set autoindent          " 新しい行のインデントを現在行と同じにする
set smartindent         " 新しい行を作ったときに高度な自動インデントを行う
set cindent

set expandtab           " タブの代わりに空白文字を挿入する
set shiftwidth=4        " シフト移動幅
set smarttab            " 行頭の余白内でTabを打ち込むと、'shiftwidth' の数だけインデントする。
set tabstop=4           " ファイル内のTabが対応する空白の数

" タブ幅をリセット
" au BufNewFile,BufRead * set tabstop=4 shiftwidth=4
" .rhtmlと.rbと.ymlでタブ幅を変更
au BufNewFile,BufRead *.rhtml set tabstop=2 shiftwidth=2
au BufNewFile,BufRead *.rb set tabstop=2 shiftwidth=2
au BufNewFile,BufRead *.yml set tabstop=2 shiftwidth=2



"--------------------------------------------------
" 検索
"--------------------------------------------------
set ignorecase          " 検索時に大文字小文字を無視
set smartcase           " 検索時に大文字を含んでいたら大/小を区別
set incsearch           " インクリメンタルサーチを行う
set hlsearch            " 検索文字列のハイライト


"--------------------------------------------------
" 表示
"--------------------------------------------------
syntax on               " シンタックスハイライトを有効にする
colorscheme darkspectrum " カラースキーマを設定

set showmatch           " 対応する括弧を表示する
set display=uhex        " 印字不可能文字を16進数で表示



"--------------------------------------------------
" ステータスライン
"--------------------------------------------------
set laststatus=2        " ステータスラインを常に表示
set showcmd             " 入力中のコマンドをステータスに表示する
" ステータスラインに文字コードと改行文字を表示する
set statusline=%<%F\ %r%h%w%y%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%4v(ASCII=%03.3b,HEX=%02.2B)\ %l/%L(%P)%m

"-------------------------------------------------------------------------------
" キーバインド
" 行単位で移動
nnoremap j gj
nnoremap k gk
" バッファ周り
nmap <silent> <C-l> :bnext<CR>
nmap <silent> <C-h> :bprevious<CR>
nmap <silent> ,l    :BufExplorer<CR>
" 検索などで飛んだらそこを真ん中に
nmap n nzz
nmap N Nzz
nmap * *zz
nmap # #zz
nmap g* g*zz
nmap g# g#zz
nmap G Gzz

"--------------------------------------------------
" Syntax チェック
"--------------------------------------------------
"autocmd FileType php :map <C-n> <ESC>:!php -l %<CR>
"autocmd FileType php :map <C-e> <ESC>:!php %<CR>
autocmd FileType ruby :map <C-n> <ESC>:!ruby -cW %<CR>
autocmd FileType ruby :map <C-e> <ESC>:!ruby %<CR>




"--------------------------------------------------
" プラグイン
"--------------------------------------------------

"======================================
" snippetsEmu
" http://www.vim.org/scripts/script.php?script_id=1318
" .vim/ 以下にダウンロード
" インストール
" snippetsemu1.2.1.vbaをvimで開き、以下を実行
" :source %
"======================================
" set file type with file extension
au BufNewFile,BufRead *.phtml set ft=php
au BufNewFile,BufRead *.ctp set ft=php

" set help file location
helptags ~/.vim/doc



"======================================
" autocomplpop.vim
" http://www.vim.org/scripts/script.php?script_id=1879
" .vim/plugin 以下にダウンロード
"======================================




"======================================
" css_color.vim
" http://vim.sourceforge.net/scripts/script.php?script_id=2150
" .vim/plugin 以下にダウンロード
"======================================





"--------------------------------------------------
" エンコーディング
"--------------------------------------------------
"デフォルトの文字コード
set enc=utf-8
set fenc=utf8

" 文字コードの自動認識
if &encoding !=# 'utf-8'
set encoding=japan
set fileencoding=japan
endif
if has('iconv')
let s:enc_euc = 'euc-jp'
let s:enc_jis = 'iso-2022-jp'
" iconvがeucJP-msに対応しているかをチェック
if iconv("\x87\x64\x87\x6a", 'cp932', 'eucjp-ms') ==# "\xad\xc5\xad\xcb"
let s:enc_euc = 'eucjp-ms'
let s:enc_jis = 'iso-2022-jp-3'
" iconvがJISX0213に対応しているかをチェック
elseif iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
let s:enc_euc = 'euc-jisx0213'
let s:enc_jis = 'iso-2022-jp-3'
endif
" fileencodingsを構築
if &encoding ==# 'utf-8'
let s:fileencodings_default = &fileencodings
let &fileencodings = s:enc_jis .','. s:enc_euc .',cp932'
let &fileencodings = &fileencodings .','. s:fileencodings_default
unlet s:fileencodings_default
else
let &fileencodings = &fileencodings .','. s:enc_jis
set fileencodings+=utf-8,ucs-2le,ucs-2
if &encoding =~# '^\(euc-jp\|euc-jisx0213\|eucjp-ms\)$'
set fileencodings+=cp932
set fileencodings-=euc-jp
set fileencodings-=euc-jisx0213
set fileencodings-=eucjp-ms
let &encoding = s:enc_euc
let &fileencoding = s:enc_euc
else
let &fileencodings = &fileencodings .','. s:enc_euc
endif
endif
" 定数を処分
unlet s:enc_euc
unlet s:enc_jis
endif
" 日本語を含まない場合は fileencoding に encoding を使うようにする
if has('autocmd')
function! AU_ReCheck_FENC()
if &fileencoding =~# 'iso-2022-jp' && search("[^\x01-\x7e]", 'n') == 0
let &fileencoding=&encoding
endif
endfunction
autocmd BufReadPost * call AU_ReCheck_FENC()
endif
" 改行コードの自動認識
set fileformats=unix,dos,mac
" □とか○の文字があってもカーソル位置がずれないようにする
if exists('&ambiwidth')
set ambiwidth=double
endif
