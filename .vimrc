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
Plugin 'vim-scripts/Conque-GDB.git'
" Plugin 'w0rp/ale.git'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

colorscheme xoria256

" To ignore plugin indent changes, instead use:
"filetype plugin on

" Highlight the search pattern.
let mapleader="\<Space>"

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

" Underline current cursor line
set cursorline
augroup CustomCursorLine
    au!    
    au ColorScheme * :hi clear CursorLine
    au ColorScheme * :hi! CursorLine gui=underline cterm=underline
augroup END


nnoremap <leader>l :set list!<cr>

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

" ================ Plugin Configuraiton  ====================

" -------------- YouCompleteMe  -----------------
let g:ycm_always_populate_location_list            = 1
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
