set encoding=utf-8

" Set line numbers
set number

" Enable syntax highlighting
syntax on  

" Set directory to the open file automatically
set autochdir

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>
" Make backspace work normal !
" set backspace=2
set backspace=indent,eol,start

" Always search case insensitive
set ignorecase
" Search is case sensitive if contains an uppercase letter
set smartcase

" Autoload file if changed outside vim
set autoread

" No irritating swap file
set noswapfile

" Map esc key to jj for conveinenve
imap jj <Esc>

" Set tab size
set autoindent
set tabstop=2
set shiftwidth=2

" Vim puts spaces instead of tab when you use tab key
set expandtab

" Highlight search
set hlsearch

" Add suffixes to be able to go to files without extension
set suffixesadd+=.js
set suffixesadd+=.ts
set suffixesadd+=.jsx
set suffixesadd+=.tsx

" Copy to clipboard
vmap '' :w !pbcopy<CR><CR>

" Open / Close tabs easily
" CR is Carriage Return ~ ENTER
nmap TC :tabclose<CR>
nmap TN :tabnew 

" Set Mouse for 'a' = 'All'
set mouse=a

" Go to file for npm scoped packages
set isfname+=@-@

" Set path for nodejs projects for gf
set path=$PWD/**

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" Display different types of white spaces.
set listchars=
set listchars=tab:›\ ,trail:•,extends:#,nbsp:.
set list

" ================== EXTENSIONS =================

" Toggle NERDTree easily!
nmap ,n :NERDTreeFind<CR>
nmap ,m :NERDTreeToggle<CR>
" Show hidden files on NERDtree by default
let NERDTreeShowHidden=1

" Add fzf if installed using homebrew
set rtp+=~/.fzf
" Add fzf if installed using git"
" set rtp+=~/.fzf" 

" VSCode colorscheme
set t_Co=256
colorscheme codedark

" Ale
" Fix files with prettier, and then ESLint.
let g:ale_fixers = ['prettier', 'eslint']

" Enable Vim Airline  Powerline fonts
let g:airline_powerline_fonts = 1

" Coc.vim Config
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
let g:coc_global_extensions= ['coc-omnisharp','coc-tsserver']

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

" Highlight active tab
:hi TabLineSel ctermfg=Red ctermbg=Yellow