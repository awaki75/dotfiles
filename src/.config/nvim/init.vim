scriptencoding utf-8

set autoindent                  " 直前の行から新しい行のインデントを得る
set autoread                    " vim以外でファイル変更した時に自動再読み込みする
set background=dark             " ハイライト色の指定に使用
set backspace=indent,eol,start  " 行頭でのバックスペースの振る舞いをカスタマイズ
set display=lastline            " テキストの表示方法を指定する
set expandtab                   " <Tab>入力でスペースを入力する
set fileignorecase              " ファイル名の大文字と小文字を区別するかどうか
set hlsearch                    " 最後に検索したパターンを強調表示する
set ignorecase                  " 検索パターンで大文字と小文字を区別しない
set incsearch                   " 検索パターン入力中にその文字を強調表示する
set lazyredraw                  " マクロ実行中に表示を更新しない
set list                        " <Tab>や<EOL>を表示する
set listchars=tab:>-,trail:-    " 'list' オン時に使う文字
set number                      " 行番号を表示する
set scrolloff=999               " カーソルの上下に確保する表示行
set shiftwidth=2                " 自動的なインデントに使うシフト幅
set showmatch                   " 括弧入力時に対応する括弧を知らせる
set smartcase                   " パターンが大文字を含むときは文字の大小を区別する
set smartindent                 " C言語用の高度な自動インデント
set smarttab                    " <Tab>入力時に 'shiftwidth' を使う
set tabstop=2                   " <Tab>の表示幅
set ttyfast                     " 高速ターミナル接続を行う
set virtualedit=block           " フリーカーソルモードを使う場面
set whichwrap=<,>,[,]           " 行を越えて機能するキーを設定する
set wrapscan                    " 検索がファイル末尾まで進んだら先頭から再検索
set hidden                      " バッファが捨てられても破棄しない

set laststatus=2
set statusline=%<%F%m%r%h%w%y%q%=[C=%c/%{col('$')-1}][L=%l/%L]

set t_Co=256

augroup vimrc
  autocmd!
  autocmd FileType cpp set shiftwidth=4 tabstop=4
augroup END

if has('python3') && executable('git')
  if &compatible
    set nocompatible
  endif

  let s:dein_dir = expand('~/.cache/dein')
  let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . s:dein_repo_dir

  call dein#begin(s:dein_dir)

  call dein#add('Shougo/dein.vim')

  call dein#add('Shougo/denite.nvim')
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('nathanaelkane/vim-indent-guides')
  call dein#add('tomasr/molokai')
  call dein#add('tomtom/tcomment_vim')
  call dein#add('tpope/vim-surround')

  call dein#end()

  filetype plugin indent on
  syntax enable

  if dein#check_install()
    call dein#install()
  endif

  let g:deoplete#auto_complete_delay = 50
  let g:deoplete#auto_complete_start_length = 1
  let g:deoplete#enable_at_startup = 1
  let g:indent_guides_auto_colors = 0
  let g:indent_guides_enable_on_vim_startup = 1
  let g:indent_guides_guide_size = 1
  let g:molokai_original = 1

  augroup dein
    autocmd!
    autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=235
    autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=235
  augroup END

  colorscheme molokai
endif

if filereadable(expand('~/.vimrc.local'))
  source ~/.vimrc.local
endif
