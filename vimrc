"  +----------------------------------------------+
"  | vimrc: Pappukant Dansale                     |
"  | Created: Sun 19 Feb 2012 02:34:16 PM CST     |
"  +----------------------------------------------+
"   

" **** Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" **** Automatically install missing pugins defined in Call Plugins section using PlugInstall command
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
    \| PlugInstall --sync | source $MYVIMRC
    \| endif

" **** Activate vim-plug to initiate plugins ****
" Call plugins
call plug#begin()
    Plug 'dense-analysis/ale'
    Plug 'tpope/vim-fugitive'
    Plug 'itchyny/lightline.vim'
    Plug 'jiangmiao/auto-pairs'
    Plug 'preservim/NERDTree'
    Plug 'preservim/nerdcommenter'
    Plug 'preservim/tagbar'
    Plug 'sonph/onehalf', {'rtp': 'vim/'}
    Plug 'tpope/vim-surround'
call plug#end()

" **** Set colorscheme ****
colorscheme onehalfdark                 " Set colorscheme to onehalfdark

" **** Misc. Configuration ****
let mapleader = '\'                     " Vim default is '\'

" **** NerdCommenter settings ***** <leader>cc
let g:NERDCommentEmptyLines = 1         " Allow commenting and inverting empty lines
let g:NERDCompactSexyComs = 1           " Use compact syntax for prettified multi-line comments
let g:NERDDefaultAlign = 'left'         " Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDSpaceDelims = 1               " Add spaces after comment
let g:NERDTrimTrailingWhitespace = 1    " Trim trailing whitespace when uncommenting
let g:NERDToggleCheckAllLines = 1       " Enable NERDCommenterToggle to check selected lines are commented

" **** lightline plugin ****
let g:lightline = {
    \ 'colorscheme': 'onehalfdark',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ], [ 'gitbranch', 'relativepath', 'modified', 'readonly' ] ],
    \   'right': [ [ 'bufnum'], [ 'percent', 'lineinfo', 'num_chrwrd', 'filesize' ], ['filetype', 'fileencoding', 'fileformat' ] ],
    \           },
    \ 'tabline': {
    \   'left': [ [ 'tabs' ] ],
    \   'right': [ [ 'close' ] ]
    \           },
    \ 'inactive': {
	\   'left': [ [ 'filename' ] ],
    \   'right': [ [ 'lineinfo' ], [ 'percent' ] ]
    \           },
    \ 'component': {
    \   'lineinfo': "%{printf('%2d/%-d : %2d', line('.'), line('$'), col('.'))}",
    \   'num_chrwrd': "%{printf('%d c : %d w', wordcount().chars, wordcount().words)}"
    \   },
    \ 'component_function': {
    \   'filesize': 'FileSize',
    \   'gitbranch': 'Lightlinegitbranch',
    \   },
    \}
   
" **** Functions ****
" == Calculate filesize - determines filesize rounded to x decimal places
function! FileSize()
    let base2 = 1024.0
    let base10 = 1000.0
    let bytes = getfsize(expand("%:p"))
        if (bytes >= 1024)
            let kbytes = bytes / base2
        endif
        if (exists('kbytes') && kbytes >= base2)
            let mbytes = kbytes / base2
        endif
        if (exists('mbytes') && mbytes >= base2)
            let gbytes = mbytes / base2
        endif
        if bytes <= 0
            return '0'
        endif

        if (exists('gbytes'))
            return printf("%.2f", gbytes) . 'Gi'
        elseif (exists('mbytes'))
            return printf("%.2f", mbytes) . 'Mi'
        elseif (exists('kbytes'))
            return printf("%.2f", kbytes) . 'Ki'
        else
            return bytes . 'b'
        endif
        " use Ki / Mi / Gi for base2 Kebibytes notation
endfunction

" == Determine git branch 
function! Lightlinegitbranch()
    let l:branch = FugitiveHead()
    return l:branch ==# '' ? '' : ' ' . l:branch
endfunction

"  **** Set startup defaults ****
    set laststatus=2            " Set Status line to always on
    set noshowmode              " Do not indicate input/replace mode on command line
        if &compatible          " Set nocompatible mode - avoiding side-effects if nocompatible has already been set
            set nocompatible
        endif
    " set cursorcolumn          " Highligt cursor column
    " set mouse=a               " Enable mouse usage (all modes) - if 'vim' installed
    " set relativenumber        " Display relative line numbers
    " set syntax=on             " Set Syntax on
    " set textwidth=0           " Use tw/textwidth=xx to wrap text at column xx, 0 default with nowrap
    " set wrapmargin=0          " Set wrapmargin to 0
    set autoindent              " Use indent of previous line
    set autowrite               " Automatically save before commands like :next and :make
    set backspace=indent,eol,start
    set breakindent             " Set line wrapping to indent
    set cursorline              " Highlight cursor line
    set directory=/tmp          " Set temp directory
    set encoding=utf-8          " Set default encoding to UTF-8
    set errorbells              " Set error bell on
    set expandtab               " Convert tab to spaces
    set hidden                  " Hide buffers when they are abandoned
    set hlsearch                " highlight search matches
    set ignorecase              " Ignore case when searching
    set incsearch               " Search while typing
    set linebreak               " Set linebreak at word boundary
    set listchars=precedes:<,extends:>
    set mousemodel=popup_setpos " Set right mouse button to popup menu at the click
    set noswapfile              " Do not create swap files
    set nowrap                  " Set wrap off
    set nowritebackup           " Do not save .sh~ files
    set number                  " Display line numbers
    set scrolloff=3             " Keep 3 lines visible at top & bottom of edit screen
    set shell=/bin/bash         " Set shell as /bin/bash
    set shiftwidth=4            " Set shift width to 4 characters
    set showmatch               " Display the match for a search pattern when typing
    set sidescroll=5            " Set sidescroll to scroll screen sideways 5 charaters at screen edge
    set smartcase               " Smart case matching
    set smartindent             " Smart indent
    set smarttab                " Set Smarttab
    set spelllang=en            " Set spell language to English all versions
    set splitbelow              " Open split below
    set splitright              " Open vsplit to right
    set tabstop=4               " Set tab width to 4 characters
    set warn                    " Warn no write since last change
    set wrapscan                " Wrap search to beginning of file
    syntax enable               " Enable Syntax

" **** Autocommands ****
    autocmd BufWinLeave mkview            " save folds on exit
    autocmd BufWinEnter silent loadview   " autoload folds on start

" **** ab_(breviations) & autocorrect ****
" == Shortforms
    ab __ppkds Pappukant Dansale
" == Auto-correct common spelling errors
    ab Convinience Convenience
    ab convinience convenience
    ab Kinldy Kindly
    ab kinldy kindly
    ab Teh The
    ab teh the

" **** Map shortcut keys ****
" == Insert various commonly used phrases and strings
    noremap <leader>ppkd o Pappukant Dansale - <ESC>:r !date<CR>kJA<ESC><ESC>
    noremap <leader>ppk o Pappukant Dansale<ESC>
    noremap <leader>dt <ESC>:r !date<CR>kJA<ESC>

" == Copy and comment out current line (bash/exrc, Vim)
    noremap <leader>nlb YP0i# <ESC><CR>
    noremap <leader>nlv YP0i" <ESC><CR>

" ==  Source vi .exrc & .bashrc setting files / set .exrc source file
    noremap <leader>e :e $HOME/.bashrc<CR>
    noremap <leader>v :so $HOME/.vim/vimrc<CR>

" == #!bin/bash standard header
    noremap <leader>T 1GO#!/bin/bash <CR># <CR># <CR># <CR># Pappukant Dansale - <ESC>:r!date<CR>kJo#<CR><ESC>60a#<ESC>

" **** Shortcut Keys (default leader in vim is '\' ****
" == Save / Save as / Open file / File Info (C-S-F2 works only in gvim)
    noremap <leader>w :w<CR>                                " save file
    " noremap <leader>s :sav                                  " save as...
    " noremap <C-F2> :e                                       " edit new/existing file - gvim
    " noremap <C-S-F2> <C-g>                                  " display file details - gvim

" == Disable search highlighting
    noremap <leader>h :noh<CR>                              " disable search highlighting

" == Toggle set spell
    noremap <leader>s :setlocal spell!<CR>                  " Toggle spellcheck

" == Mappings for commonly used plugins
    nmap <leader>d :NERDTreeToggle<CR>                      " Toggle NERDTRee
    nmap <leader>t :TagbarToggle<CR>                        " Toggle TagBar

" == Toggle line wrapping & display status
    noremap <leader>r :set wrap! wrap?<CR>                  " Toggle wrap and display status

" == Toggle line numbers & display status
    noremap <F12> :set number!<CR>                          " Toggle line #
    noremap <S-F12> :set relativenumber!<CR>                " Toggle relative line #

