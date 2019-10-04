set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-sensible.git'
Plugin 'tpope/vim-fugitive'
Plugin 'christoomey/vim-system-copy.git'
Plugin 'tpope/vim-surround'
Plugin 'majutsushi/tagbar'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tomtom/tcomment_vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'rdnetto/YCM-Generator'
Plugin 'godlygeek/tabular.git'
Plugin 'jiangmiao/auto-pairs.git'
Plugin 'mileszs/ack.vim'
Plugin 'Yggdroot/indentLine.git'
Plugin 'vim-scripts/xoria256.vim.git'
Plugin 'itchyny/lightline.vim.git'
Plugin 'kana/vim-textobj-user.git'
Plugin 'kana/vim-textobj-line.git'
Plugin 'edkolev/tmuxline.vim.git'
Plugin 'jeaye/color_coded.git'
Plugin 'christoomey/vim-tmux-navigator.git'
Plugin 'tpope/vim-vinegar.git'
" Plugin 'vim-scripts/Conque-GDB.git'
Plugin 'suan/vim-instant-markdown.git'
Plugin 'panozzaj/vim-autocorrect'
Plugin 'xolox/vim-colorscheme-switcher'
Plugin 'xolox/vim-misc'
Plugin 'rafi/awesome-vim-colorschemes'
" Plugin 'ludovicchabant/vim-gutentags'
" Plugin 'skywind3000/gutentags_plus'
" Plugin 'w0rp/ale.git'
Plugin 'brookhong/cscope.vim.git'
Plugin 'Valloric/ListToggle.git'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

colorscheme xoria256
" colorscheme zellner

" To ignore plugin indent changes, instead use:
"filetype plugin on

" Highlight the search pattern.
let mapleader="\<Space>"

set hidden
set directory=/tmp
set history=1000
set hlsearch
set incsearch
set ignorecase
set smartcase
set showbreak=…
set linebreak
set listchars=tab:►-,eol:¬,trail:●
set relativenumber
set number
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab
retab

" Do not highlight the foreground in the QuickFixList
hi QuickFixLine ctermfg=none

" Underline current cursor line
set cursorline
augroup CustomCursorLine
    au!    
    au ColorScheme * :hi clear CursorLine
    au ColorScheme * :hi! CursorLine gui=underline cterm=underline
augroup END


nnoremap <silent><F8> :nohlsearch<cr>

nnoremap <leader>vv :vsp<cr>
nnoremap <leader>ss :sp<cr>

" Toggle the Tlist window using <F4>
nnoremap <silent><F4> :TagbarToggle<cr>

nnoremap <leader>fb :CtrlPBuffer<cr>
nnoremap <leader>fm :CtrlPMixed<cr>
nnoremap <leader>ff :CtrlP getcwd()<cr>
nnoremap <leader>ft :CtrlPTag<cr>

nnoremap <silent><leader>sv :source ~/.vimrc<cr>
nnoremap <silent><leader>ev :edit ~/.vimrc<cr>
nnoremap <silent><leader>et :edit ~/.tmux.conf<cr>
nnoremap <silent><leader>eb :edit ~/.bashrc<cr>

nnoremap <silent><F9>       :cprev<cr>zz
nnoremap <silent><F10>      :cnext<cr>zz
nnoremap <silent><C-F9>     :lprev<cr>zz
nnoremap <silent><C-F10>    :lnext<cr>zz
nnoremap <silent><M-F9>     :cfirst<cr>
nnoremap <silent><M-F10>    :clast<cr>
nnoremap <silent><leader>mm :set lines=10000 columns=1000<cr>
nnoremap <silent><leader>mn :set lines=999 columns=90<cr>

" -------------- cscope -----------------
" Interactive search
nnoremap <leader>fa :call CscopeFindInteractive(expand('<cword>'))<CR>
" s: Find this C symbol
nnoremap  <leader>fs :call CscopeFind('s', expand('<cword>'))<CR>
" g: Find this definition
nnoremap  <leader>fg :call CscopeFind('g', expand('<cword>'))<CR>
" d: Find functions called by this function
nnoremap  <leader>fd :call CscopeFind('d', expand('<cword>'))<CR>
" c: Find functions calling this function
nnoremap  <leader>fc :call CscopeFind('c', expand('<cword>'))<CR>
" t: Find this text string
nnoremap  <leader>ft :call CscopeFind('t', expand('<cword>'))<CR>
" e: Find this egrep pattern
nnoremap  <leader>fe :call CscopeFind('e', expand('<cword>'))<CR>
" i: Find files #including this file
nnoremap  <leader>fi :call CscopeFind('i', expand('<cword>'))<CR>

" ================ Plugin Configuraiton  ====================
 

" -------------- gutentags  -----------------
let g:gutentags_modules = ['ctags', 'gtags_cscope']

" config project root markers.
let g:gutentags_project_root = ['.root', '.git']

" generate datebases in my cache directory, prevent gtags files polluting my project
let g:gutentags_cache_dir = expand('~/.cache/tags')

" change focus to quickfix window after search (optional).
let g:gutentags_plus_switch = 1

let g:gutentags_define_advanced_commands = 1
let g:gutentags_cscope_executable = 'gtags-cscope' 

" -------------- YouCompleteMe  -----------------
let g:ycm_always_populate_location_list            = 0
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_error_symbol                             = 'E>'
let g:ycm_warning_symbol                           = 'W>'
let g:ycm_confirm_extra_conf                       = 0

" -------------- lightline  -----------------

" display the plugin name at the mode component?
function! LightlineMode()
  return expand('%:t') ==# '__Tagbar__' ? 'Tagbar':
        \ expand('%:t') ==# 'ControlP' ? 'CtrlP' :
        \ &filetype ==# 'unite' ? 'Unite' :
        \ &filetype ==# 'vimfiler' ? 'VimFiler' :
        \ &filetype ==# 'vimshell' ? 'VimShell' :
        \ lightline#mode()
endfunction

let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head',
      \   'mode': 'LightlineMode',
      \ },
      \ }



" -------------- indentLine -----------------
let g:indentLine_char = '|'

" -------------- tagbar -----------------
let g:tagbar_autoclose        = 1
let g:tagbar_autofocus        = 1
let g:tagbar_sort             = 1
let g:tagbar_autoshowtag      = 1
let g:tagbar_foldlevel        = 99
let g:tagbar_show_linenumbers = -1

" -------------- Ack -----------------
let g:ackprg = 'ag --nogroup --nocolor --column'
