" =============================================================================
" Filename: autoload/lightline/colorscheme/onehalfdark.vim
" Filename for Plugin install: .vim/plugged/onehalf/vim/autoload/lightline/colorscheme/onehalfdark.vim
" Author: sonph
" License: MIT License
" Last Change: 2019/12/01
" Modified: Pappukant Dansale - Mon Apr 29 04:17:15 PM CDT 2024
" =============================================================================

let s:mono0 = [ '#282c34', 236 ]
let s:mono1 = [ '#313640', 238 ]
let s:mono2 = [ '#5d677a', 243 ]
let s:mono3 = [ '#dcdfe4', 255 ]
let s:mono4 = [ '#9e9e9e', 247 ]

let s:blue = [ '#61afef', 75 ]
let s:cyan = [ '#56b6c2', 73 ]
let s:green = [ '#98c379', 114 ]
let s:magenta = [ '#c678dd', 176 ]
let s:red = [ '#e06c75', 168 ]

" Custom colors
let s:gold = [ '#ffd75f', 221 ] " for active tab in tabline

let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}

"let s:p.normal.middle = [ [ s:blue, s:mono1 ] ]    " Coloured middle characters disabled for mono characters below
let s:p.normal.left = [ [ s:mono0, s:blue ], [ s:mono3, s:mono2 ] ]
let s:p.normal.middle = [ [ s:mono4, s:mono1 ] ]
let s:p.normal.right = [ [ s:mono0, s:blue ], [ s:mono3, s:mono2 ] ]

let s:p.normal.error = [ [ s:mono0, s:red ] ]
let s:p.normal.warning = [ [ s:mono0, s:gold ] ]

let s:p.inactive.left =  [ [ s:mono3, s:mono2 ], [ s:mono3, s:mono2 ] ]
let s:p.inactive.middle = [ [ s:mono3, s:mono1 ] ]
let s:p.inactive.right = [ [ s:mono0, s:mono3 ], [ s:mono3, s:mono2 ] ]

let s:p.insert.left = [ [ s:mono0, s:green ], [ s:mono3, s:mono2 ] ]
let s:p.insert.middle = [ [ s:mono4, s:mono1 ] ]
let s:p.insert.right = [ [ s:mono0, s:green ], [ s:mono3, s:mono2 ] ]

let s:p.replace.left = [ [ s:mono3, s:red ], [ s:mono3, s:mono2 ] ]
let s:p.replace.middle = [ [ s:mono4, s:mono1 ] ]
let s:p.replace.right = [ [ s:mono3, s:red ], [ s:mono3, s:mono2 ] ]

let s:p.visual.left = [ [ s:mono0, s:gold ], [ s:mono3, s:mono2 ] ]
let s:p.visual.middle = [ [ s:mono4, s:mono1 ] ]
let s:p.visual.right = [ [ s:mono0, s:gold ], [ s:mono3, s:mono2 ] ]

let s:p.tabline.left = [ [ s:mono4, s:mono1] ]
" let s:p.tabline.tabsel = [ [ s:mono0, s:gold] ]
let s:p.tabline.tabsel = [ [ s:gold, s:mono1] ]
let s:p.tabline.middle = [ [ s:mono2, s:mono1] ]
let s:p.tabline.right = [ [ s:mono1, s:mono2 ] ]

let g:lightline#colorscheme#onehalfdark#palette = lightline#colorscheme#flatten(s:p)
