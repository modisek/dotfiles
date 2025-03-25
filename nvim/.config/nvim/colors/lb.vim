" ===============================================================
" Luba Colorscheme
" Author: Kgosietsile Modise
" ===============================================================

" {{{ Setup
set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name="lb"
" }}}

" {{{ Italics and Bold
let g:luba_terminal_italic = get(g:, 'luba_terminal_italic', 0)
let s:italic = g:luba_terminal_italic == 1 ? "italic" : ""

let g:luba_terminal_bold = get(g:, 'luba_terminal_bold', 0)
let s:bold = g:luba_terminal_bold == 1 ? "bold" : ""
"}}}

" {{{ Colors
let s:base00 = ['#282120', '235']
let s:base01 = ['#323232', '237']
let s:base02 = ['#424242', '240']
let s:base03 = ['#525252', '243']
let s:base04 = ['#626262', '145']
let s:base05 = ['#727272', '251']
let s:base06 = ['#929292', '252']
let s:base07 = ['#9ab19a', '253'] 
let s:red    = ['#d88553', '203']
let s:orange = ['#fda128', '255']
let s:yellow = ['#eda622', '221']
let s:green  = ['#9e9e9e', '114']
let s:cyan   = ['#5f5f88', '73']
let s:blue   = ['#5f8787', '68']
let s:purple = ['#99bbbb', '176']
let s:brown  = ['#fbe5c0', '137']
let s:white  = ['#f0f7e0', '15']
let s:none   = ['NONE',    'NONE']
" }}}

" {{{ Highlight function
function! s:hi(group, fg, bg, attr, attrsp)
  " fg, bg, attr, attrsp
  if !empty(a:fg)
    exec "hi " . a:group . " guifg=" .  a:fg[0]
    exec "hi " . a:group . " ctermfg=" . a:fg[1]
  endif
  if !empty(a:bg)
    exec "hi " . a:group . " guibg=" .  a:bg[0]
    exec "hi " . a:group . " ctermbg=" . a:bg[1]
  endif
  if a:attr != ""
    exec "hi " . a:group . " gui=" .   a:attr
    exec "hi " . a:group . " cterm=" . a:attr
  endif
  if !empty(a:attrsp)
    exec "hi " . a:group . " guisp=" . a:attrsp[0]
  endif
endfunction
" }}}

" {{{ UI Highlight Groups
call s:hi('Normal',                             s:base07, s:base00, '',          '')
call s:hi('Bold',                               '',       '',       s:bold,      '')
call s:hi('Debug',                              s:red,    '',       '',          '')
call s:hi('Directory',                          s:purple, '',       '',          '')
call s:hi('ErrorMsg',                           s:red,    s:base00, '',          '')
call s:hi('Exception',                          s:red,    '',       '',          '')
call s:hi('FoldColumn',                         s:blue,   s:base00, '',          '')
call s:hi('Folded',                             s:base03, s:base01, s:italic,    '')
call s:hi('IncSearch',                          s:base01, s:orange, 'NONE',      '')
call s:hi('Italic',                             '',       '',       s:italic,    '')
call s:hi('Macro',                              s:red,    '',       '',          '')
call s:hi('MatchParen',                         s:base05, s:base03, '',          '')
call s:hi('ModeMsg',                            s:green,  '',       '',          '')
call s:hi('MoreMsg',                            s:green,  '',       '',          '')
call s:hi('Question',                           s:blue,   '',       '',          '')
call s:hi('Search',                             s:base03, s:yellow, '',          '')
call s:hi('SpecialKey',                         s:base03, '',       '',          '')
call s:hi('TooLong',                            s:red,    '',       '',          '')
call s:hi('Underlined',                         s:red,    '',       '',          '')
call s:hi('Visual',                             '',       s:base02, '',          '')
call s:hi('VisualNOS',                          s:red,    '',       '',          '')
call s:hi('WarningMsg',                         s:red,    '',       '',          '')
call s:hi('WildMenu',                           s:base07, s:blue,   '',          '')
call s:hi('Title',                              s:blue,   '',       '',          '')
call s:hi('Conceal',                            s:blue,   s:base00, '',          '')
call s:hi('Cursor',                             s:base00, s:base05, '',          '')
call s:hi('NonText',                            s:base03, '',       '',          '')
call s:hi('EndOfBuffer',                        s:base05, s:base00, '',          '')
call s:hi('LineNr',                             s:base03, s:base00, '',          '')
call s:hi('SignColumn',                         s:base00, s:base00, '',          '')
call s:hi('StatusLine',                         s:yellow, s:base00, '',          '')
call s:hi('WinBar',                             s:base01, s:yellow, '',          '')
call s:hi('WinBarNC',                           s:base01, s:yellow, '',          '')
call s:hi('StatusLineNC',                       s:base00, s:base01, '',          '')
call s:hi('VertSplit',                          s:base00, s:base02, '',          '')
call s:hi('ColorColumn',                        '',       s:base01, '',          '')
call s:hi('CursorColumn',                       '',       s:base01, '',          '')
call s:hi('CursorLine',                         '',       s:base01, 'None',      '')
call s:hi('CursorLineNR',                       s:base00, s:base00, '',          '')
call s:hi('CursorLineNr',                       s:base03, s:base01, '',          '')
call s:hi('PMenu',                              s:base07, s:base01, '',          '')
call s:hi('PMenuSel',                           s:base07, s:blue,   '',          '')
call s:hi('PmenuSbar',                          '',       s:base02, '',          '')
call s:hi('PmenuThumb',                         '',       s:base07, '',          '')
call s:hi('TabLine',                            s:base03, s:base01, '',          '')
call s:hi('TabLineFill',                        s:base03, s:base01, '',          '')
call s:hi('TabLineSel',                         s:green,  s:base01, '',          '')
" }}}

" {{{ Syntax Highlighting
call s:hi('Boolean',                            s:orange, '',       '',          '')
call s:hi('Character',                          s:base07, '',       '',          '')
call s:hi('Comment',                            s:base03, '',       s:italic,    '')
call s:hi('Conditional',                        s:purple, '',       '',          '')
call s:hi('Constant',                           s:base07, '',       '',          '')
call s:hi('Define',                             s:purple, '',       '',          '')
call s:hi('Delimiter',                          s:cyan,   '',       '',          '')
call s:hi('Float',                              s:orange, '',       '',          '')
call s:hi('Function',                           s:purple, '',       '',          '')
call s:hi('Identifier',                         s:orange, '',       '',          '')
call s:hi('Include',                            s:blue,   '',       '',          '')
call s:hi('Keyword',                            s:orange, '',       '',          '')
call s:hi('Label',                              s:blue,   '',       '',          '')
call s:hi('Number',                             s:orange, '',       '',          '')
call s:hi('Operator',                           s:blue,   '',       '',          '')
call s:hi('PreProc',                            s:yellow, '',       '',          '')
call s:hi('Repeat',                             s:yellow, '',       '',          '')
call s:hi('Special',                            s:orange, '',       '',          '')
call s:hi('SpecialChar',                        s:orange, '',       '',          '')
call s:hi('Statement',                          s:purple, '',       '',          '')
call s:hi('StorageClass',                       s:yellow, '',       '',          '')
call s:hi('String',                             s:base07, '',       '',          '')
call s:hi('Structure',                          s:purple, '',       '',          '')
call s:hi('Tag',                                s:cyan,   '',       '',          '')
call s:hi('Todo',                               s:yellow, s:base01, '',          '')
call s:hi('Type',                               s:red,    '',       '',          '')
call s:hi('Typedef',                            s:yellow, '',       '',          '')
" }}}

" {{{ Language-Specific Highlighting
" Python
call s:hi('pythonRepeat',                       s:purple, '',       '',          '')
call s:hi('pythonOperator',                     s:purple, '',       '',          '')

" Ruby
call s:hi('rubyConstant',                       s:yellow, '',       '',          '')
call s:hi('rubySymbol',                         s:green,  '',       '',          '')
call s:hi('rubyAttribute',                      s:blue,   '',       '',          '')
call s:hi('rubyInterpolation',                  s:green,  '',       '',          '')
call s:hi('rubyInterpolationDelimiter',         s:brown,  '',       '',          '')
call s:hi('rubyStringDelimiter',                s:green,  '',       '',          '')
call s:hi('rubyRegexp',                         s:cyan,   '',       '',          '')

" HTML
call s:hi('htmlBold',                           s:yellow, '',       '',          '')
call s:hi('htmlItalic',                         s:purple, '',       '',          '')
call s:hi('htmlTag',                            s:cyan,   '',       '',          '')
call s:hi('htmlEndTag',                         s:cyan,   '',       '',          '')
call s:hi('htmlArg',                            s:yellow, '',       '',          '')
call s:hi('htmlTagName',                        s:base07, '',       '',          '')

" JavaScript
call s:hi('javaScript',                         s:base05, '',       '',          '')
call s:hi('javaScriptNumber',                   s:orange, '',       '',          '')
call s:hi('javaScriptBraces',                   s:base05, '',       '',          '')
" }}}

" {{{ Plugin Specific Highlighting
" TreeSitter
call s:hi('TSInclude',                          s:yellow, '',       '',          '')
call s:hi('TSPunctBracket',                     s:green,  '',       '',          '')
call s:hi('TSPunctDelimiter',                   s:green,  '',       '',          '')
call s:hi('TSType',                             s:blue,   '',       '',          '')
call s:hi('TSFunction',                         s:yellow, '',       '',          '')
call s:hi('TSTagDelimiter',                     s:cyan,   '',       '',          '')
call s:hi('TSProperty',                         s:yellow, '',       '',          '')
call s:hi('TSMethod',                           s:blue,   '',       '',          '')
call s:hi('TSParameter',                        s:yellow, '',       '',          '')
call s:hi('TSConstructor',                      s:base07, '',       '',          '')
call s:hi('TSVariable',                         s:green,  '',       '',          '')
call s:hi('TSOperator',                         s:green,  '',       '',          '')
call s:hi('TSTag',                              s:yellow, '',       '',          '')
call s:hi('TSKeyword',                          s:yellow, '',       '',          '')
call s:hi('TSKeywordOperator',                  s:purple, '',       '',          '')
call s:hi('TSVariableBuiltin',                  s:red,    '',       '',          '')
call s:hi('TSLabel',                            s:yellow, '',       '',          '')

" LSP Diagnostics
call s:hi('LspDiagnosticsDefaultError',         '',       '',       '',          '')
call s:hi('LspDiagnosticsSignError',            s:red,    '',       '',          '')
call s:hi('LspDiagnosticsUnderlineError',       '',       '',       'undercurl', '')
call s:hi('LspDiagnosticsDefaultWarning',       '',       '',       '',          '')
call s:hi('LspDiagnosticsSignWarning',          s:yellow, '',       '',          '')
call s:hi('LspDiagnosticsUnderlineWarning',     '',       '',       'undercurl', '')
call s:hi('LspDiagnosticsDefaultInformation',   '',       '',       '',          '')
call s:hi('LspDiagnosticsSignInformation',      s:blue,   '',       '',          '')
call s:hi('LspDiagnosticsUnderlineInformation', '',       '',       'undercurl', '')
call s:hi('LspDiagnosticsDefaultHint',          '',       '',       '',          '')
call s:hi('LspDiagnosticsSignHint',             s:cyan,   '',       '',          '')
call s:hi('LspDiagnosticsUnderlineHint',        '',       '',       'undercurl', '')

" Git Gutter
call s:hi('GitGutterAdd',                       s:green,  s:base00, s:bold,      '')
call s:hi('GitGutterChange',                    s:blue,   s:base00, s:bold,      '')
call s:hi('GitGutterDelete',                    s:red,    s:base00, s:bold,      '')
call s:hi('GitGutterChangeDelete',              s:purple, s:base00, s:bold,      '')
" }}}

" {{{ Terminal Colors
if has('nvim')
  let g:terminal_color_0  = s:base00[0]
  let g:terminal_color_8  = s:base03[0]
  let g:terminal_color_1  = s:red[0]
  let g:terminal_color_9  = s:red[0]
  let g:terminal_color_2  = s:green[0]
  let g:terminal_color_10 = s:green[0]
  let g:terminal_color_3  = s:yellow[0]
  let g:terminal_color_11 = s:yellow[0]
  let g:terminal_color_4  = s:blue[0]
  let g:terminal_color_12 = s:blue[0]
  let g:terminal_color_5  = s:purple[0]
  let g:terminal_color_13 = s:purple[0]
  let g:terminal_color_6  = s:cyan[0]
endif
