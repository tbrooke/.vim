set nocompatible 
runtime macros/matchit.vim
if has("autocmd")
    filetype indent plugin on
endif
filetype off
let mapleader=" "
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

set t_Co=256

 set hidden
 set backspace=indent,eol,start
 set nocompatible
 set nobackup
 set nowritebackup
 set history=500
 set mouse=a
 set clipboard=unnamed
 set ruler
 set number
 set shell=zsh
 set numberwidth=5
 set noswapfile
 set incsearch
 set laststatus=2
 set encoding=utf-8
 set tabstop=2
 set shiftwidth=2
 set expandtab
 set timeoutlen=1000 ttimeoutlen=0
 set list listchars=tab:»·,trail:·

let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_rails = 1

 let g:vimclojure#HighlightBuiltins = 1
 let g:vimclojure#ParenRainbow = 1


 " Let Vundle manage Vundle
 Plugin 'gmarik/Vundle.vim'
 Plugin 'thoughtbot/vim-rspec'
 Plugin 'skalnik/vim-vroom.git'
 Plugin 'tpope/vim-fugitive'
 Plugin 'tpope/vim-surround'
 Plugin 'tpope/vim-repeat'
 Plugin 'pbrisbin/vim-mkdir'
 Plugin 'scrooloose/syntastic'
 Plugin 'slim-template/vim-slim'
 Plugin 'vim-scripts/tComment'
 Plugin 'vim-ruby/vim-ruby'
 Plugin 'tpope/vim-rails'
 Plugin 'tpope/vim-endwise'
 Plugin 'tpope/vim-bundler'
 Plugin 'tpope/vim-leiningen.git'
 Plugin 'tpope/vim-projectionist.git'
 Plugin 'tpope/vim-dispatch.git'
 Plugin 'tpope/vim-fireplace.git'
 Plugin 'nelstrom/vim-textobj-rubyblock'
 Plugin 'tpope/vim-sexp-mappings-for-regular-people'
 Plugin 'guns/vim-sexp.git'
 Plugin 'guns/vim-clojure-static'
 Plugin 'tpope/vim-classpath.git'
 Plugin 'kien/rainbow_parentheses.vim'
 Plugin 'altercation/vim-colors-solarized'
 Plugin 'bling/vim-airline'
 Plugin 'christoomey/vim-run-interactive'
 Plugin 'amdt/vim-niji'
 Plugin 'Pychimp/vim-luna'
 Plugin 'vim-scripts/ctags.vim'
 Plugin 'scrooloose/nerdtree'
 Plugin 'rizzatti/dash.vim'
  autocmd FileType ruby compiler ruby
 " non github repos
 Plugin 'git://git.wincent.com/command-t.git'
 filetype on
 filetype plugin  on     " required!
 filetype indent  on
 syntax on
 "
 " Brief help
 " :PluginList          - list configured bundles
 " :PluginInstall(!)    - install(update) bundles
 " :PluginSearch(!) foo - search(or refresh cache first) for foo
 " :PluginClean(!)      - confirm(or auto-approve) removal of unused bundles
 "
 " see :h vundle for more details or wiki for FAQ
 " NOTE: comments after Plugin command are not allowed..

"""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""  Gary Bernhardt Stuff  """""""""

"""""""""""""""""""""""""""""""
 " MISC KEY MAPS
 """""""""""""""""""""""""""""""
 map <Esc><Esc> :w<CR>
 "map <leader>y "*y
 " Move around splits with <c-hjkl>
  nnoremap <c-j> <c-w>j
  nnoremap <c-k> <c-w>k
  nnoremap <c-h> <c-w>h
  nnoremap <c-l> <c-w>l

nnoremap <silent> <Leader>w <C-w>o

nnoremap <silent> <Leader>h <C-w>h
nnoremap <silent> <Leader>j <C-w>j
nnoremap <silent> <Leader>k <C-w>k
nnoremap <silent> <Leader>l <C-w>l
let g:rspec_command = "!bundle exec rspec {spec}"

" map <Leader>r :call RunCurrentSpecFile()<CR>
" map <Leader>s :call RunNearestSpec()<CR>
" map <Leader>l :call RunLastSpec()<CR>
" map <Leader>a :call RunAllSpecs()<CR>

" [q]uit (close) window/split
nnoremap <silent> <Leader>q <C-w>q

" " [s]plit window horizontally
nnoremap <silent> <Leader>s <C-w>s

" " split window [v]ertically
nnoremap <silent> <Leader>v <C-w>v



"" Airline

let g:airline_powerline_fonts = 1

  " Insert a hash rocket with <c-l>
 " imap <c-l> <space>=><space>
 " " Can't be bothered to understand ESC vs <c-c> in insert mode
  imap <c-c> <esc>
 " " Clear the search buffer when hitting return
  function! MapCR()
    nnoremap <cr> :nohlsearch<cr>
    endfunction
    call MapCR()
   nnoremap <leader><leader> <c-^>

 """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 " MULTIPURPOSE TAB KEY
 " Indent if we're at the beginning of a line. Else, do completion.
 " """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
      return "\<tab>"
    else
       return "\<c-p>"
    endif
   endfunction
 inoremap <tab> <c-r>=InsertTabWrapper()<cr>
 inoremap <s-tab> <c-n>
 """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 " MAPS TO JUMP TO SPECIFIC COMMAND-T TARGETS AND FILES
 " """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  map <leader>gr :topleft :split config/routes.rb<cr>
  function! ShowRoutes()
   " Requires 'scratch' plugin
     :topleft 100 :split __Routes__
   " Make sure Vim doesn't write __Routes__ as a file
     :set buftype=nofile
          " Delete everythin   
     :normal 1GdG
   " Put routes output in buffer
     :0r! rake -s routes
  " Size window to number of lines (1 plus rake output
     length)
     :exec ":normal " . line("$") . _ "
   " Move cursor to bottom
     :normal 1GG
  " Delete empty trailing line
     :normal dd
    endfunction
   map <leader>gR :call ShowRoutes()<cr>
   map <leader>gv :CommandTFlush<cr>\|:CommandT app/views<cr>
   map <leader>gm :CommandTFlush<cr>\|:CommandT app/models<cr>
   map <leader>gh :CommandTFlush<cr>\|:CommandT app/helpers<cr>
   map <leader>gl :CommandTFlush<cr>\|:CommandT app/controllers<cr>
   map <leader>gp :CommandTFlush<cr>\|:CommandT public<cr>
   map <leader>gf :CommandTFlush<cr>\|:CommandT features<cr>
   map <leader>gg :topleft 100 :split Gemfile<cr>
   map <leader>gt :CommandTFlush<cr>\|:CommandTTag<cr>
   map <leader>b  :CommandTFlush<cr>\|:CommandTBuffer<cr>
   
   map <leader>f :NERDTreeToggle<cr>
   :nmap <silent> <leader>d <Plug>DashSearch
   nnoremap <silent> <Leader>gs :Gstatus<CR>
   nnoremap <silent> <Leader>gc :Gcommit -v<CR>
                                                                                                       
  nnoremap  <leader> :call OpenTestAlternate()<cr>
   syntax enable

  colorscheme solarized
  set background=dark
   let g:airline_theme='luna'

