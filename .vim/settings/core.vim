"
" g:editor_mode can take three string values:
"   - rich: full configuration (taking into account plugins)
"   - idea: some intelli j idea overrides and don't load plugins
"   - simple: smallest configuration for fast loading
"



" \ **************************************************************************************** \
" \ General functionality
" \ **************************************************************************************** \

" ----- Environment --------------------------------------------------------------------------
set encoding=utf-8              " keep the encoding as high as possible in $MYVIMRC
filetype plugin indent on       " :help :filetype-overview
set tags=~/code/.tags           " ctags dir
set fileformat=unix             " gives <EOL> of current buffer

" Vim needs a POSIX-Compliant shell. Fish is not.
if $SHELL =~ 'bin/fish' || $SHELL =~ 'bin/zsh'
    set shell=/usr/bin/bash
endif

" tmux will send xterm-style keys when its xterm-keys option is on
" if &term =~ '^screen'
" 	execute "set <xUp>=\e[1;*A"
" 	execute "set <xDown>=\e[1;*B"
" 	execute "set <xRight>=\e[1;*C"
"    execute "set <xLeft>=\e[1;*D"
" endif


" ----- Input --------------------------------------------------------------------------------
set mouse=                      " Mouse can be enabled for different modes.


" ----- Editor -------------------------------------------------------------------------------
syntax enable                   " syntax highlight

set tabstop=4                   " show existing tab with 4 spaces width
set softtabstop=4               " number of spaces tab counts for while editing
set shiftwidth=4                " when indenting with '>', use 4 spaces width
set expandtab                   " on pressing tab, insert 4 spaces
set autoindent                  " copy indent from current line

set number                      " show line numbers
set relativenumber              " use relative line numbers

set textwidth=0                 " line's 'max char count
set foldmethod=indent           " indent= lines with equal indent create a fold
set foldlevel=95                " folds with a higher level will be closed
set colorcolumn=95              " color column
set backspace=indent,eol,start  " backspace behavior in normal mode

set splitbelow                  " split below
set splitright                  " split to the right

set modeline                    " modeline
set laststatus=2                " if set to `2`, statusline is always displayed

highlight ColorColumn
            \ ctermbg=7
            \ guibg=lightgrey   " adds color column of line, width set with `set colorcolumn`



" ----- Accesibility -------------------------------------------------------------------------
set ruler                       " show cursor position
set wildmenu                    " tab-completion for command-line
set scrolloff=1                 " minimal number of screen lines to keep above & below cursor
set sidescrolloff=5             " minimal number of screen columns to keep to left and right
set display+=lastline           " :help 'display'
set formatoptions+=j            " delete comment character when joining commented lines
set autoread                    " reload files changed externally
set autowrite                   " :w automatically when a bunch of stuff happens
set notimeout                   " disable bind combo timeout

" netrw sane defaults
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 2
" let g:netrw_altv = 1
let g:netrw_winsize = 25
let g:netrw_list_hide= '.*\.swp$,.*\.d.ts$,.*\.pyc$,.*\.js.map$'

" close preview window on leaving the insert mode
" autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
"


" ----- Languages ----------------------------------------------------------------------------
let g:pymode_python     = 'python3' " python 3 as default
let g:python_host_prog  = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python3'


" ----- Performance --------------------------------------------------------------------------
set lazyredraw                  " avoid redrawing when executing macros and other commands
set synmaxcol=200               " Don't highlight anything longer than 200 chars
let did_install_default_menus=1 " Don't load gvim menu stuff
" let loaded_matchparen=1         " Don't hightlight matching parents


" \ **************************************************************************************** \
" \ Appearance
" \ **************************************************************************************** \

set t_Co=256

if &diff
    colorscheme github
endif


" Mode aware cursors
" set gcr+=o:hor50-Cursor
" set gcr+=n:Cursor
" set gcr+=i-ci-sm:InsertCursor
" set gcr+=r-cr:ReplaceCursor-hor20
" set gcr+=c:CommandCursor
" set gcr+=v-ve:VisualCursor

" Diff colours
hi DiffText ctermfg=darkred ctermbg=lightgrey

" Other colours
hi Search ctermfg=black ctermbg=lightmagenta


" \ **************************************************************************************** \
" \ Settings source files
" \ **************************************************************************************** \

source ~/.vim/settings/statusline.vim
source ~/.vim/settings/functions.vim
source ~/.vim/settings/mappings.vim

if (editor_mode == "rich") 
    source ~/.vim/settings/rich.vim

elseif (editor_mode == "idea")
    source ~/.vim/settings/idea.vim

endif
