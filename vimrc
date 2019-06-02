set nocompatible                 " drop compability with vi
filetype plugin indent on
syntax on                        " syntax highlitning on
"filetype plugin on
set hidden                       " allow other buffer while current not changed
set shiftwidth=2                 " number of spaces to use for each step of (auto) indent
set tabstop=2                    " tabular size
set expandtab                    " replace tab by spaces 
set backspace=indent,eol,start   " backspacing over everything in insert mode
"set incsearch                   " do incremental searching
set wildmenu                     " command-line completion in an enhanced mode
set wildmode=list,full
set clipboard=unnamedplus        " vim default buffer is system clipboard

"set isfname-={,}
set isfname-==

set path+=**           "looking files in subderrectories (for command find)

set cryptmethod=blowfish2


set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0
"highlight lCursor guifg=NONE guibg=Cyan
"set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯЖ;ABCDEFGHIJKLMNOPQRSTUVWXYZ:,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz

set virtualedit=block

colorscheme darkblue
"colorscheme desert
if has("gui_running")
 set guifont=Monospace\ 10
" set guioptions-=mT
endif

if !isdirectory("~/.vim/bundle/Vundle.vim")
  call system("git clone  git://github.com/VundleVim/Vundle.vim  ~/.vim/bundle/Vundle.vim")
endif

set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
"call vundle#rc()
Bundle 'git://github.com/VundleVim/Vundle.vim'
Bundle 'git://github.com/scrooloose/nerdtree'
"Bundle 'git://github.com/ctrlpvim/ctrlp.vim'
Bundle 'git://github.com/WolfgangMehner/c-support'
Bundle 'git://github.com/ervandew/supertab'
Bundle 'git://github.com/mileszs/ack.vim'
"Move to vimtex
"Bundle 'git://github.com/vim-latex/vim-latex'
"Align columns using pattern
Bundle 'git://github.com/godlygeek/tabular'
Bundle 'git://github.com/xolox/vim-notes'
Bundle 'git://github.com/xolox/vim-misc'
Bundle 'git://github.com/jamessan/vim-gnupg'
"Bundle 'git://github.com/zweifisch/pipe2eval'

"Bundle 'git://github.com/tomtom/tlib_vim'
"Bundle 'git://github.com/MarcWeber/vim-addon-mw-utils'
"Bundle 'git://github.com/garbas/vim-snipmate'
"что-то не заработал этот плагин
"Plugin 'git://github.com/vim-scripts/browser.vim' 

Bundle 'tpope/vim-fugitive'
"Bundle 'git://github.com/vim-scripts/sum.vim'
Bundle 'git://github.com/kien/rainbow_parentheses.vim'

Bundle 'christoomey/vim-titlecase'

"Bundle 'vim-syntastic/syntastic'
Bundle 'w0rp/ale'
Bundle 'itchyny/lightline.vim'  
"Nice status line with colors and more info
Bundle 'sirver/ultisnips'
"Bundle 'honza/vim-snippets'
Bundle 'lervag/vimtex'
Bundle 'rafi/awesome-vim-colorschemes'

call vundle#end()            " required
filetype plugin indent on 

if version >= 700
  " Turn off spell checking
  set nospell
  menu Spell.off :setlocal spell spelllang= <cr>
  menu Spell.Russian+English :setlocal spell spelllang=ru,en <cr>
  menu Spell.Russian :setlocal spell spelllang=ru <cr>
  menu Spell.English :setlocal spell spelllang=en <cr>
  menu Spell.-SpellControl- :
  menu Spell.Word\ Suggest<Tab>z= z=
  menu Spell.Previous\ Wrong\ Word<Tab>[s [s
  menu Spell.Next\ Wrong\ Word<Tab>]s ]s
endif

inoremap <Up>    <NOP>
inoremap <Down>  <NOP>
inoremap <Left>  <NOP>
inoremap <Right> <NOP>
noremap  <Up>    <NOP>
noremap  <Down>  <NOP>
noremap  <Left>  <NOP>
noremap  <Right> <NOP>
" Navigate with <Ctrl>-hjkl in Insert mode
inoremap <C-h> <C-o>h
inoremap <C-j> <C-o>j
inoremap <C-k> <C-o>k
inoremap <C-l> <C-o>l

"noremap р h
"noremap о j
"noremap л k
"noremap д l
inoremap <C-р> <C-o>h
inoremap <C-о> <C-o>j
inoremap <C-л> <C-o>k
inoremap <C-д> <C-o>l



"=============== vim-latex ==========================================
"let g:tex_flavor='latex'
"let g:Tex_ViewRule_pdf='evince'
"let g:Tex_DefaultTargetFormat='pdf'

imap <F9> <ESC>:!make<CR>
nmap <F9> :!make<CR>
"===================================================================

"noremap k :Tabularize /&\|\(\\\\\)<CR>

"=============== vim-notes =========================================
if isdirectory("~/vault/space/doc/notes")
  let g:notes_directories=['~/vault/space/doc/notes']
else
  let g:notes_directories=['~/tmp/notes']
endif
"===================================================================

"imap <C-d> <ESC>:r!date --rfc-3339=seconds<CR>A 
inoremap <F4> <C-R>=strftime('%F %T %Z(%z) (%d  %B, %A)')<CR>
inoremap <F5> <C-R>=strftime('%T')<CR>

"=============== c-support ==========================================
let g:C_CreateMenusDelayed = 'yes'  "to supress long plugin loading




if has('gui_running')
    function! s:ChangeFont(delta)
        let l:expr = '\=submatch(1)+' . a:delta
        let l:font = substitute(&guifont, '\v(\d+)', l:expr, '')
        let &guifont = l:font
    endfunction

    nnoremap <silent> <C-ScrollWheelUp> :call <SID>ChangeFont(+1)<cr>
    nnoremap <silent> <C-ScrollWheelDown> :call <SID>ChangeFont(-1)<cr>
endif

au VimEnter * RainbowParenthesesActivate
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

"Line number numeration
set number  
"Set gray color of line number
highlight LineNr guifg=gray 
"set highlight only for line number not whole string
"highlight CursorLine cterm=NONE ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE
set cursorline


"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"let g:syntastic_cpp_include_dirs = [ '/usr/local/geant4.10.00/include/Geant4/', '/usr/local/root-6.04.12/include/root', '$HOME/work/ibn']
"let g:syntastic_cpp_compiler = "g++"
"let g:syntastic_cpp_compiler_options = '-std=c++1y'

let g:airline#extensions#ale#enabled = 1
let g:ale_cpp_gcc_options = '-std=c++2a -Wall -I/usr/local/root-v6-16-00/include/ -I/home/nikolaev/work'

"Line movement
noremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

"map <F8> <ESC>:w ! lpr -o fit-to-page

set laststatus=2
command Lpr w !lpr -o fit-to-page

autocmd! bufwritepost ~/.vim/vimrc execute "normal! :source ~/.vimrc"


"auto Tabularsize doesnt work
if exists(":Tabularsize")
  nmap <Leader>a= :Tabularsize /=<CR>
  vmap <Leader>a= :Tabularsize /=<CR>
  nmap <Leader>a: :Tabularsize /:\zs<CR>
  vmap <Leader>a: :Tabularsize /:\zs<CR>
endif

inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction


"SINPPETS
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetsDir="/home/angara/.vim/UltiSnips/"
"VIMTEX options
let g:tex_flavor='latex'
let g:vimtex_view_method='general'
let g:vimtex_view_general_viewr = 'evince'
let g:vimtex_quickfix_mode=0
set conceallevel=2
"highlight clear Conceal
highlight Conceal NONE
let g:tex_conceal='abdmg'

