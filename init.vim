call plug#begin('~/.config/nvim/bundle/')
Plug 'Yggdroot/indentLine'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-airline/vim-airline'
Plug 'tomasr/molokai'
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'morhetz/gruvbox'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'
Plug 'vim-syntastic/syntastic'
Plug 'scrooloose/nerdcommenter'
call plug#end()
syntax enable

if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

let mapleader=","

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0



let g:deoplete#enable_at_startup = 1
set completeopt-=preview

"let g:python3_host_prog = '/Users/zihua/Tools/miniconda3/bin/python'

set background=dark
colorscheme gruvbox
highlight Comment cterm=bold
set cursorline
hi CursorLine   cterm=NONE ctermbg=17 guibg=17 
set cursorcolumn
hi CursorColumn cterm=NONE ctermbg=17 guibg=17 
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd guibg=0 ctermbg=0
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=0 ctermbg=235
autocmd VimEnter * set nospell

autocmd VimEnter * set wrap

let g:tagbar_width = 20
nmap <F3> :TagbarToggle<CR>
autocmd VimEnter * Tagbar

let g:NERDTreeWinSize=20
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd w

map <F2> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

autocmd VimEnter * set relativenumber

let g:tagbar_sort = 0

set mouse=a

map <F5> :call CompileRunGcc()<CR>

func! CompileRunGcc()
    exec "w" 
    if &filetype == 'c' 
        exec '!g++ % -o %<'
        exec '!time ./%<'
    elseif &filetype == 'cpp'
        exec '!g++ % -o %<'
        exec '!time ./%<'
    elseif &filetype == 'python'
        exec '!time python %'
    elseif &filetype == 'sh'
        :!time bash %
    endif                                                                              
endfunc 
