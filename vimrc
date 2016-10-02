set nocompatible
syntax on
"filetype plugin on
set hidden
set shiftwidth=2                 " number of spaces to use for each step of (auto) indent
set tabstop=2                    " tabular size
set expandtab                    " replace tab by spaces 
set backspace=indent,eol,start   " backspacing over everything in insert mode
"set incsearch                   " do incremental searching
set wildmenu                     " command-line completion in an enhanced mode
set wildmode=list,full
set clipboard=unnamedplus        " vim default buffer is system clipboard


set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0
"highlight lCursor guifg=NONE guibg=Cyan

colorscheme darkblue
if has("gui_running")
 set guifont=Monospace\ 14
 set guioptions-=mT
endif

if !isdirectory("~/.vim/bundle/Vundle.vim")
  call system("git clone  git://github.com/VundleVim/Vundle.vim  ~/.vim/bundle/Vundle.vim")
endif

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#rc()

filetype plugin indent on     " обязательно!

Bundle 'git://github.com/VundleVim/Vundle.vim'
Bundle 'git://github.com/scrooloose/nerdtree'
Bundle 'git://github.com/ctrlpvim/ctrlp.vim'
Bundle 'git://github.com/WolfgangMehner/c-support'
Bundle 'git://github.com/ervandew/supertab'
Bundle 'git://github.com/mileszs/ack.vim'
Bundle 'git://github.com/vim-latex/vim-latex'
Bundle 'git://github.com/godlygeek/tabular'
Bundle 'git://github.com/xolox/vim-notes'
Bundle 'git://github.com/xolox/vim-misc'



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

noremap р h
noremap о j
noremap л k
noremap д l
inoremap <C-р> <C-o>h
inoremap <C-о> <C-o>j
inoremap <C-л> <C-o>k
inoremap <C-д> <C-o>l



"For vim-latex my changed
let g:tex_flavor='latex'
let g:Tex_ViewRule_pdf='atril'
let g:Tex_DefaultTargetFormat='pdf'

imap <F2> <ESC>:!make<CR>
nmap <F2> :!make<CR>

"let s:figure =     "\\begin{figure}[<+htpb+>]\<cr>\\centering\<cr>\\includegraphics[width=<+text width+>\\textwidth]{<+file+>}\<cr>\\caption{<+caption text+>}\<cr>\\label{fig:<+label+>}\<cr>\\end{figure}<++>"

"noremap k :Tabularize /&\|\(\\\\\)<CR>

"For notest
let g:notes_directories=['~/vault/space/doc/notes']

imap <C-d> <ESC>:r!date --rfc-3339=seconds<CR>A 

