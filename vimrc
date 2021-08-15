"  +----------------------------------------------+
"  | vimrc: Pappukant Dansale                     |
"  | Created: Sun 19 Feb 2012 02:34:16 PM CST     |
"  +----------------------------------------------+
"
" EDIT HISTORY :-
" Sun 23 Aug 2020 10:26:53 PM CDT - Deleted reduntant configs to optimize filesize
" Sun 23 Aug 2020 03:29:41 AM CDT - Updated to include plugin manager vim-plug, added NERDTree, lightline & commented out statusline syntax + custom highlight colors
" Sat 12 Sep 2020 11:18:41 PM CDT - Updated to install colorschemes using plugin manager
" Sun 11 Oct 2020 03:26:44 PM CDT - Updated with ueful plugins and obsoleted redundant vimrc settings

" **** Activate vim-plug to initiate plugins ****
call plug#begin()
Plug 'dense-analysis/ale'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'itchyny/lightline.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/NERDTree'
Plug 'preservim/nerdcommenter'
Plug 'preservim/tagbar'
Plug 'sonph/onehalf', {'rtp': 'vim/'}
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
call plug#end()
" Plug 'itchyny/vim-gitbranch' / 'gitbranch': 'gitbranch#name',

" **** Set colorscheme ****
" colorscheme corvine       " Set colorscheme to corvine
" colorscheme dracula       " Set colorscheme to dracula
" set background=dark       "... for dracula dark version
" set background=light      "... for dracula light version
colorscheme onehalfdark     " Set colorscheme to onehalfdark

" **** Misc. Configuration ****
" let mapleader = "-"        " Vim default is '\'

" **** NerdCommenter settings ***** <leader>cc
let g:NERDCommentEmptyLines = 1         " Allow commenting and inverting empty lines
let g:NERDCompactSexyComs = 1           " Use compact syntax for prettified multi-line comments
let g:NERDDefaultAlign = 'left'         " Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDSpaceDelims = 1               " Add spaces after comment
let g:NERDToggleCheckAllLines = 1       " Enable NERDCommenterToggle to check selected lines are commented
let g:NERDTrimTrailingWhitespace = 1    " Trim trailing whitespace when uncommenting

" **** lightline plugin ****
" \ 'colorscheme': 'onehalfdark', 'wombat' - alternate colorscheme
" \   'right': [ [ 'bufnum'], ['filetype', 'fileencoding', 'fileformat' ], [ 'lineinfo', 'percent', 'filesize'] ],
let g:lightline = {
    \ 'colorscheme': 'onehalfdark',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ], [ 'readonly', 'gitbranch', 'relativepath', 'modified' ] ],
    \   'right': [ [ 'bufnum'], ['filetype', 'fileencoding', 'fileformat' ], [ 'lineinfo', 'percent', 'filesize'] ],
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
    \   'lineinfo': "%{printf('%2d/%-2d:%2d', line('.'), line('$'), col('.'))}",
    \   },
    \ 'component_function': {
    \   'filesize': 'FileSize',
    \   'gitbranch': 'FugitiveHead',
    \   },
    \}

" **** Functions ****
" == Calculate filesize - determines filesize rounded to 1 decimal
function! FileSize()
    let bytes = getfsize(expand("%:p"))
        if (bytes >= 1024)
            let kbytes = bytes / 1024.0
        endif
        if (exists('kbytes') && kbytes >= 1024)
            let mbytes = kbytes / 1024.0
        endif
        if (exists('mbytes') && mbytes >= 1024)
            let gbytes = mbytes / 1024.0
        endif
        if bytes <= 0
            return '0'
        endif

        if (exists('gbytes'))
            return printf("%.1f", gbytes) . 'g'
        elseif (exists('mbytes'))
            return printf("%.1f", mbytes) . 'm'
        elseif (exists('kbytes'))
            return printf("%.1f", kbytes) . 'k'
        else
            return bytes . 'b'
        endif
endfunction

"  **** Set startup defaults ****
    set laststatus=2            " Set Status line to always on
    set noshowmode              " Do not indicate input/replace mode on command line
if &compatible
    set nocompatible            " Set nocompatible mode - avoiding side-effects if nocompatible has laready been set
endif
    " set cursorcolumn            " Highligt cursor column
    " set syntax=on               " Set Syntax on
    " set textwidth=0             " Use tw/textwidth=xx to wrap text at column xx, 0 default with nowrap
    " set wrapmargin=0            " Set wrapmargin to 0
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
    set hlsearch	            " highlight search matches
    set ignorecase              " Ignore case when searching
    set incsearch	            " Search while typing
    set linebreak               " Set linebreak at word boundary
    set listchars=precedes:<,extends:>
    set mouse=a                 " Enable mouse usage (all modes) - if 'vim' installed
    set noswapfile              " Do not create swap files
    set nowrap                  " Set wrap off
    set nowritebackup           " Do not save .sh~ files
    set number                  " Display line numbers
    set relativenumber          " Display relative line numbers
    set scrolloff=3             " Keep 3 lines visible at top & bottom of edit screen
    set shell=/bin/bash         " Set shell as /bin/bash
    set shiftwidth=4            " Set shift width to 4 characters
    set showmatch               " Display the match for a search pattern when typing
    set sidescroll=5            " Set sidescroll to scroll screen sideways 5 charaters at screen edge
    set smartcase               " Smart case matching
    set smartindent             " Smart indent
    set smarttab                " Set Smarttab
    set splitbelow              " Open split below
    set splitright              " Open vsplit to right
    set tabstop=4               " Set tab width to 4 characters
    set warn                    " Warn no write since last change
    set wrapscan                " Wrap search to beginning of file
    syntax enable               " Enable Syntax

" **** ab_(breviations) & autocorrect ****
" == Shortforms
    ab __ppkds Pappukant Dansale
" == Auto-correct common spelling errors
    ab Convinience Convenience
    ab Kinldy Kindly
    ab Teh The
    ab convinience convenience
    ab kinldy kindly
    ab teh the

" **** Map shortcut keys ****
" == Insert various commonly used phrases and strings
    noremap <leader>a o# Pappukant Dansale - <ESC>:r !date<CR>kJA<ESC><ESC>
    noremap <leader>n o# Pappukant Dansale<ESC>
    noremap <leader>D <ESC>:r !date<CR>kJA<ESC>

" == Comment out current line (bash/exrc/c/c++, Vim)
    " noremap <leader>c 0i# <ESC>
    " noremap <leader>C 0i" <ESC>

" == Copy and comment out current line (bash/exrc, Vim)
    noremap <leader>n YP0i# <ESC><CR>
    noremap <leader>N YP0i" <ESC><CR>

" ==  Source vi .exrc & .bashrc setting files / set .exrc source file
    noremap <leader>e :e $HOME/.bashrc<CR>
    noremap <leader>v :so $HOME/.vim/vimrc<CR>

" == #!bin/bash standard header
    noremap <leader>T 1GO#!/bin/bash <CR># <CR># <CR># <CR># Pappukant Dansale - <ESC>:r!date<CR>kJo#<CR><ESC>60a#<ESC>

" **** Shortcut Keys (default leader in vim is '\' ****
" == Save / Save as / Open file / File Info (C-S-F2 works only in gvim)
    noremap <leader>w :w<CR>                                " save file
    noremap <leader>s sav                                   " save as...
    " noremap <C-F2> :e                                       " edit new/existing file - gvim
    " noremap <C-S-F2> <C-g>                                  " display file details - gvim

" == Search highlighting
    noremap <leader>h :noh<CR>                              " disable search highlighting

" == Mappings for commonly used plugins
    nmap <leader>d :NERDTreeToggle<CR>                      " Toggle NERDTRee
    nmap <leader>t :TagbarToggle<CR>                        " Toggle TagBar

" ---- Toggle line wrapping & display status----
    noremap <leader>r :set wrap! wrap?<CR>                  " Toggle wrap and display staus

" == Toggle line numbers & display status
    noremap <F12> :set number!<CR>                          " Toggle line #
    noremap <S-F12> :set relativenumber!<CR>                " Toggle relative line #

" == Special characters in vim

" == In vim special key/unicode characters entered by  + special key or using  + unocode HEX
" == Useful statusline glyphs; kept for reference
"   ¦   " Alternate pipe symbol ( u00A6)
"   ॐ   " Aum ( u0950)
"   ∅   " ReadOnly flag symbol ( u2205)
"   ⌥   " Git branch character ( u2325)
"   ⎇   " Git branch character ( u2387)
"   ⎌   " 'Modified' flag symbol 1 ( u238c)
"   ☰   " Lines symbol ( u2630)
"   ㏑  " Lines symbol ( u33D1)
"      " 'Modified' flag symbol 2 ( u00B1)

" == Other special key display
"   ^M = <CR>
"   ^[ = ESC
"   ^? = BACKSPACE
"   ^I = TAB
"   ^V = ^v
