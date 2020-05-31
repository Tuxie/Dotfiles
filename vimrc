call plug#begin('~/.vim/plugged')

  Plug 'jnurmine/Zenburn'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'

  Plug 'scrooloose/nerdtree'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'airblade/vim-gitgutter'
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'scrooloose/nerdcommenter'
  Plug 'Shougo/denite.nvim'

  if !has('nvim')
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
  endif

call plug#end()

filetype plugin indent on
syntax enable

if $LC_TERMINAL == "iTerm2" ||
 \ $TERM_PROGRAM == "iTerm.app" ||
 \ $TERM_PROGRAM == "Apple_Terminal" ||
 \ $TERM_PROGRAM == "Terminus" ||
 \ $TERM_PROGRAM == "Extraterm"
  let g:fancy_terminal = 1
else
  let g:fancy_terminal = 0
endif

  let g:fancy_terminal = 1

if g:fancy_terminal
  let g:airline_powerline_fonts = 1
  let g:zenburn_transparent = 1
endif

" Tweak colors
  let g:airline_theme='base16_grayscale'
  "let g:airline#extensions#tabline#enabled = 1
  colorscheme zenburn
  if g:fancy_terminal
    " Make it even more transparent!
    hi Normal       ctermbg=NONE
    hi LineNr       ctermbg=NONE ctermfg=238
    hi CursorLineNr ctermbg=NONE ctermfg=248
    hi CursorLine   ctermbg=NONE
    hi VertSplit    ctermbg=NONE ctermfg=244 cterm=NONE
    hi Visual       ctermbg=238
  else
    hi Normal       ctermbg=16
    hi LineNr       ctermbg=232  ctermfg=237
    hi CursorLineNr ctermbg=233  ctermfg=248
    hi CursorLine   ctermbg=233
    hi VertSplit    ctermbg=16   ctermfg=244 cterm=NONE
endif

set backupdir=/tmp//
set directory=/tmp//
set undodir=/tmp//

set backspace=indent,eol,start
set numberwidth=4
set norelativenumber
set number
set cursorline
"set cursorcolumn
set fillchars+=vert:│

" Keyboard mappings
  nnoremap <space>l :set invnumber<CR>     "Toggle line numbers
  nnoremap <space>n :NERDTreeToggle<CR>    "Toggle NERDTree
  nnoremap <Space>/ :<c-u>noh<CR>:echo<CR> "Clear highlights from search
  nnoremap <Space>c :NERDCommenterToggle   "Toggle comment

" NERDTree configuration
  " How can I open a NERDTree automatically when vim starts up if no files were specified?
  autocmd StdinReadPre * let s:std_in=1
  autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
  " How can I open NERDTree automatically when vim starts up on opening a directory?
  autocmd StdinReadPre * let s:std_in=1
  autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
  " How can I close vim if the only window left open is a NERDTree?
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
  let NERDTreeQuitOnOpen=1
  let NERDTreeShowHidden=1
  let g:NERDTreeDirArrowExpandable = '▸'
  let g:NERDTreeDirArrowCollapsible = '▾'
  let g:NERDTreeIndicatorMapCustom = {"Modified":"✹", "Staged":"✚", "Untracked":"✭", "Renamed":"➜", "Unmerged":"═", "Deleted":"✖", "Dirty":"✗", "Clean":"✔︎", "Ignored":"☒", "Unknown":"?"}

" NERDCommenter configuration
  let g:NERDSpaceDelims = 1 " Add spaces after comment delimiters by default
  let g:NERDTrimTrailingWhitespace = 1 " Enable trimming of trailing whitespace when uncommenting

" Remeber last cursor position
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

