scriptencoding utf-8

"高速化
set ttyfast
set lazyredraw

"256色表示
set t_Co=256

"左右キーで行間を移動
set whichwrap+=<,>,[,]

"外部でファイルが変更されたら自動再読み込み
set autoread

"短形選択で行末より後ろにカーソルを移動できる
set virtualedit=block

"カーソルを常に画面の中央に表示させる
set scrolloff=999

"タブは半角スペース4つ
set tabstop=4
set shiftwidth=4
set softtabstop=0
set expandtab
set smarttab

"自動インデント
set smartindent
set autoindent

"タブと行末の空白を表示
set list
set listchars=tab:>\ ,trail:-

"行番号を表示
set number

set display=lastline

set hidden

"検索
set incsearch
set hlsearch
set ignorecase
set smartcase
set wrapscan

"ステータス行
set laststatus=2
set statusline=%<%F%m%r%h%w%y%=[C=%c/%{col('$')-1}][L=%l/%L]

autocmd BufRead,BufNewFile *.html set tabstop=2 shiftwidth=2
autocmd BufRead,BufNewFile Vagrantfile set filetype=ruby

colorscheme default

if isdirectory(expand('~/.vim/bundle'))
    if has('vim_starting')
        if &compatible
            set nocompatible
        endif

        set runtimepath+=~/.vim/bundle/neobundle.vim/
    endif

    call neobundle#begin(expand('~/.vim/bundle'))

    NeoBundleFetch 'Shougo/neobundle.vim'

    "NeoBundle 'Shougo/vimproc.vim'

    NeoBundle 'Shougo/unite.vim'
    NeoBundle 'Shougo/vimfiler.vim'
    let g:vimfiler_as_default_explorer = 1

    NeoBundle 'nathanaelkane/vim-indent-guides'
    let g:indent_guides_enable_on_vim_startup = 1
    let g:indent_guides_guide_size = 1
    let g:indent_guides_auto_colors = 0
    autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=233
    autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=233

    "NeoBundle 'davidhalter/jedi-vim'

    NeoBundle 'nvie/vim-flake8'
    "let g:flake8_max_line_length = 99
    if executable('flake8')
        autocmd BufWritePost *.py call Flake8()
    endif

    "NeoBundle 'vim-jp/vimdoc-ja'
    "set helplang=ja

    call neobundle#end()

    filetype plugin indent on

    NeoBundleCheck
endif
