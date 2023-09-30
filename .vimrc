" using plugin manager vim-plug.
" auto-install if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif
set nocompatible
call plug#begin('~/.vim/plugged')
Plug 'tomasr/molokai' "colorscheme
Plug 'drewtempelmeyer/palenight.vim'
Plug 'tpope/vim-commentary' "comment
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-eunuch' "unix command to be able to modify a read-only file :SudoWrite
Plug 'davidhalter/jedi-vim' "completion tab for python file
" deprecated
Plug 'terryma/vim-multiple-cursors' " sublime-like multiple cursors
" Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'airblade/vim-gitgutter' " VCS change info per line (only git)
Plug 'junegunn/fzf'
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim' " fuzzy selector
" Plug 'haya14busa/incsearch.vim' " highlight all matches in incremental search (conflicts with vim-indexed-search)
Plug 'tpope/vim-surround' "surround text with quotes for example
Plug 'ornicar/vim-scala'
Plug 'kana/vim-textobj-user' " framework for custom text objects
Plug 'PeterRincker/vim-argumentative'  " text object ',' / also provides argument movements with >, ],
Plug 'junegunn/vim-easy-align'
Plug 'zirrostig/vim-schlepp'
Plug 'junegunn/goyo.vim'
Plug 'frazrepo/vim-rainbow'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'purescript-contrib/purescript-vim'
Plug 'leafgarland/typescript-vim'
Plug 'dart-lang/dart-vim-plugin', {'for': 'dart'}
Plug 'tpope/vim-abolish' "Working with words
" Plug 'bfredl/nvim-miniyank' "For block pasting https://github.com/neovim/neovim/issues/13052
map p <Plug>(miniyank-autoput)
map P <Plug>(miniyank-autoPut)

call plug#end()

function! s:find_git_root()
    return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction

command! ProjectFiles execute 'Files' s:find_git_root()

syntax on
" colorscheme palenight
colorscheme dim


if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
  set termguicolors
endif


" TODO: exit insert mode on <Up>/<Down>, move inside wrapped lines
" TODO: leave insert mode when losing focus?
" TODO: remove stuff, thats already in vim-sensible
" http://chibicode.com/vimrc/
":hi Visual guifg=#FFFFFF guibg=#4088FF http://nvie.com/posts/how-i-boosted-my-vim/


" Use Vim settings, rather than Vi settings

" " allow UTF-8 characters in vimrc
" scriptencoding utf-8

" " clear all keymappings
" mapclear

 " define a group `vimrc` and initialize.
 augroup vimrc

     autocmd!
 augroup END

"source $HOME/.vimrc_plugins
" source $HOME/.vimrc_custom
" source $HOME/.vimrc_statusline
" source $HOME/.vimrc_keybindings


" " Enable file type detection.
filetype plugin indent on


" " Colorscheme
syntax enable
" if filereadable($HOME."/.colors") && match(readfile($HOME."/.colors"),"light")
"     set background=dark
"   colorscheme solarized
" else
"     set background=light
"     colorscheme goodmorning
" endif


" " gui settings

"     set guioptions=aci        " hide toolbars
"     set guifont=Inconsolata\ 8
"     "set lines=24 columns=80 " Maximize window.
"     set guicursor+=a:blinkon0 "disible blinking
"     set guicursor+=i-ci:block-iCursor-blinkon0 "insert mode: block, no blinking, highlight with iCursor
" endif
"
set clipboard=unnamedplus
set updatetime=100

" " display
" set cursorline                    " highlight current line
 set number                        " enable line numbers
" set relativenumber                " show relative numbers for all lines but the current one
" set ruler                         " show the cursor position all the time
 set incsearch                     " do incremental searching
 set ignorecase                    " smart case sensitive search
 set smartcase                     "              "
 set hls                           " hightlight search results
 " set scrolloff=5 sidescrolloff=10  " keep some lines before and after the cursor visible
 set wrap                          " break long lines
 set linebreak                     " break only at word boundary
 set listchars=tab:⊳\ ,trail:·     " display whitespaces
 set list
 set breakindent                   " indent wrapped lines
 set breakindentopt=shift:2
 set display=lastline,uhex         " if last line does not fit on screen, display it anyways

" editing
 set gdefault                      " substitute all occurrences in line per default
 set backspace=indent,eol,start    " allow backspacing over everything in insert mode
 set tabstop=4                     " size of a hard tabstop
 set shiftwidth=4                  " size of an "indent"
 set softtabstop=4                 " a combination of spaces and tabs are used to simulate tab stops at a width
 set smarttab                      " make "tab" insert indents instead of tabs at the beginning of a line
 set expandtab                     " always uses spaces instead of tab characters
 set virtualedit=block,onemore
 set nostartofline                 " keep column position when switching buffers

" " behavior
 set hidden                        " switch from unsaved buffers
" set shell=/bin/bash
" set encoding=utf-8
" set history=1000                  " keep x lines of command line history
 set showcmd                       " display incomplete commands
 set wildmenu                      " better command line completion
 set wildmode=list:longest,full
" set lazyredraw                    " performance: dont redraw while executing macros
" set ttyfast                       " allow vim to write more characters to screen
 set autoread                      " read file when changed from outside
 set confirm                       " ask to save files when closing vim
" set exrc                         " source .vimrc from directories
" set secure                        " secure local vimrc execution
" set wildignore=*.o,*.obj,*.class,target/**
" set viewoptions=cursor,folds,slash,unix
set mouse=a "click with mouse activated
 " backup/undo/swap files
 set swapfile
 set backup
 set undofile

 set undodir=~/.vim/tmp/undo//     " undo files
 set backupdir=~/.vim/tmp/backup// " backups
 set directory=~/.vim/tmp/swap//   " swap files

set backupcopy=yes " fix file watching (e.g. parcel) https://stackoverflow.com/a/59227891
" set inccommand=nosplit " preview replace in search
 " Make those folders automatically if they don't already exist.
 if !isdirectory(expand(&undodir))
     call mkdir(expand(&undodir), "p")
 endif
 if !isdirectory(expand(&backupdir))
     call mkdir(expand(&backupdir), "p")
 endif
 if !isdirectory(expand(&directory))
     call mkdir(expand(&directory), "p")
 endif

" " change directory to the current buffer when opening files.
" " set autochdir
" autocmd vimrc BufEnter * silent! lcd %:p:h

" " break text automatically
" autocmd vimrc FileType text setlocal textwidth=78

" let g:tex_flavor = "latex"

" set spell spelllang=en_us

" " filetype aliases
" autocmd vimrc BufNewFile,BufRead *.sbt set filetype=scala
" autocmd vimrc BufNewFile,BufRead *.gdb set filetype=sh
" autocmd vimrc BufNewFile,BufRead *.jad set filetype=java

" " on save, delete trailing spaces
" autocmd vimrc FileType vim,html,css,scss,javascript,sh
"             \ autocmd BufWritePre * call StripTrailingSpaces()

" " on save, autoformat
" autocmd vimrc FileType vim,html
"             \ autocmd BufWritePre *.vim *.html Autoformat

 " return to last edit position when opening a file.
 " except for git commits: Enter insert mode instead.
 " autocmd vimrc BufReadPost *
 " \ if line("'\"") > 0 && line("'\"") <= line("$") |
 " \   if &filetype == 'gitcommit' |
 " \       setlocal spell |
 " \   else |
 " \      exe "normal! g`\"" |
 " \    endif |
 " \ endif


" " leave insert mode quickly
" if ! has('gui_running')
"     set ttimeoutlen=10
"     augroup FastEscape
"         autocmd!
"     augroup END

"     autocmd FastEscape InsertEnter * set timeoutlen=0
"     autocmd FastEscape InsertLeave * set timeoutlen=1000
" endif

" " don't move cursor when leaving insert mode, breaks multiple-cursors
" " let CursorColumnI = 0 "the cursor column position in INSERT
" " autocmd InsertEnter * let CursorColumnI = col('.')
" " autocmd CursorMovedI * let CursorColumnI = col('.')
" " autocmd InsertLeave * if col('.') != CursorColumnI | call cursor(0, col('.')+1) | endif

" multiple-cursors
let g:multi_cursor_exit_from_visual_mode = 0
let g:multi_cursor_exit_from_insert_mode = 0
let mapleader="\<space>"

" noremap <F5> :Autoformat<CR> " apply autoformat when pressing F5
" let g:formatdef_scalafmt = "'scalafmt --stdin'"
" let g:formatters_scala = ['scalafmt']
" au BufWrite *.scala :Autoformat "auto format on saving files

" rainbow parentheses
let g:rainbow_active = 1


" don't lose selection when indenting
vnoremap < <gv
vnoremap > >gv
vnoremap = =gv
nnoremap <silent> <Leader><Leader> :nohlsearch<cr>

nnoremap <silent> <leader><c-n> :MultipleCursorsFind <C-R>/<CR>
vnoremap <silent> <leader><c-n> :MultipleCursorsFind <C-R>/<CR>

nmap <Leader>e :ProjectFiles<CR>
nmap <Leader>vv :e  ~/.vimrc<CR>

map Q <Nop>

nmap <Leader>/ :nohls <cr>
nmap <leader>f <Plug>(coc-format)

" use <tab> for trigger completion and navigate to the next complete item
" https://github.com/neoclide/coc.nvim/wiki/Completion-with-sources#use-tab-or-custom-key-for-trigger-completion
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> <space>N :call CocAction('diagnosticPrev')<cr>
nmap <silent> <space>n :call CocAction('diagnosticNext')<cr>
" Use <c-space> for trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

hi Visual guifg=#FFFFFF guibg=#4088FF
