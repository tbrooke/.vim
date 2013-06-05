set nocompatible               " be iMproved
 let mapleader=" "
 set rtp+=~/.vim/bundle/vundle/
 call vundle#rc()

 set t_Co=256
 " let Vundle manage Vundle
 " required! 
 Bundle 'gmarik/vundle'

 set hidden
 set backspace=indent,eol,start
 set nocompatible
 set nobackup
 set nowritebackup
 set history=500
 set mouse=a
 set ruler
 set number
 set shell=zsh
 set numberwidth=5
 set noswapfile
 set incsearch
 set laststatus=2
 set encoding=utf-8
 map <c-p> :!pry<CR>
 map <c-u> :!ruby % <CR>
 set tabstop=2
 set shiftwidth=2
 set expandtab
 set timeoutlen=1000 ttimeoutlen=0
 set list listchars=tab:»·,trail:·
 " let vimclojure#WantNailgun = 1
 " let vimclojure#NailgunClient = $HOME ."/.nailgun/ng"

let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_rails = 1

 let g:vimclojure#HighlightBuiltins = 1
 let g:vimclojure#ParenRainbow = 1
 "
 let g:paredit_mode = 1
 " original repos on github
 Bundle 'tpope/vim-fugitive'
 Bundle 'tpope/vim-surround'
 Bundle 'Townk/vim-autoclose'
 Bundle 'Lokaltog/vim-easymotion'
 Bundle 'dgmbrg/vim-redl'
 Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
 Bundle 'tpope/vim-rails.git'
 Bundle 'flazz/vim-colorschemes'
 Bundle 'skalnik/vim-vroom'
 Bundle 'benmills/vimux'
 Bundle 'scrooloose/nerdcommenter'
 Bundle 'scrooloose/syntastic' 
 Bundle 'git://github.com/tpope/vim-foreplay.git'
 Bundle 'git://github.com/tpope/vim-classpath.git'
 Bundle 'git://github.com/guns/vim-clojure-static.git'
 Bundle 'git://github.com/kien/rainbow_parentheses.vim.git'
 Bundle 'derekwyatt/vim-scala'  
 "Bundle 'vim-scripts/VimClojure'
 Bundle 'vim-ruby/vim-ruby'
 Bundle 'vim-scripts/paredit.vim'
 Bundle "megaannum/self"
 Bundle "megaannum/forms" 
 Bundle "Shougo/vimproc"
 Bundle "Shougo/vimshell"
 Bundle "aemoncannon/ensime"
 Bundle "megaannum/vimside" 
 Bundle 'L9'
 Bundle 'FuzzyFinder'
 Bundle 'Lokaltog/vim-powerline'
 Bundle 'scrooloose/nerdtree'
 Bundle 'git://github.com/kien/ctrlp.vim.git'
 autocmd FileType ruby compiler ruby
 " non github repos
 Bundle 'git://git.wincent.com/command-t.git'
 au VimEnter * RainbowParenthesesToggle
 au Syntax * RainbowParenthesesLoadRound
 au Syntax * RainbowParenthesesLoadSquare
 au Syntax * RainbowParenthesesLoadBraces

 filetype on
 filetype plugin  on     " required!
 filetype indent  on
 syntax on
 "
 " Brief help
 " :BundleList          - list configured bundles
 " :BundleInstall(!)    - install(update) bundles
 " :BundleSearch(!) foo - search(or refresh cache first) for foo
 " :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
 "
 " see :h vundle for more details or wiki for FAQ
 " NOTE: comments after Bundle command are not allowed..

"""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""  Gary Bernhardt Stuff  """""""""

"""""""""""""""""""""""""""""""
 " MISC KEY MAPS
 """""""""""""""""""""""""""""""
 "map <leader>y "*y
 " Move around splits with <c-hjkl>
  nnoremap <c-j> <c-w>j
  nnoremap <c-k> <c-w>k
  nnoremap <c-h> <c-w>h
  nnoremap <c-l> <c-w>l
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
   map <leader>gc :CommandTFlush<cr>\|:CommandT app/controllers<cr>
   map <leader>gm :CommandTFlush<cr>\|:CommandT app/models<cr>
   map <leader>gh :CommandTFlush<cr>\|:CommandT app/helpers<cr>
   map <leader>gl :CommandTFlush<cr>\|:CommandT lib<cr>
   map <leader>gp :CommandTFlush<cr>\|:CommandT public<cr>
   map <leader>gs :CommandTFlush<cr>\|:CommandT public/stylesheets/sass<cr>
   map <leader>gf :CommandTFlush<cr>\|:CommandT features<cr>
   map <leader>gg :topleft 100 :split Gemfile<cr>
   map <leader>gt :CommandTFlush<cr>\|:CommandTTag<cr>
   map <leader>f :CommandTFlush<cr>\|:CommandT<cr>
   map <leader>F :CommandTFlush<cr>\|:CommandT %%<cr>
 

 " """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 " SWITCH BETWEEN TEST AND PRODUCTION CODE
 " """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  function! OpenTestAlternate()
  let new_file = AlternateForCurrentFile()
   exec ':e ' . new_file
   endfunction
   function! AlternateForCurrentFile()
   let current_file = expand("%")
   let new_file = current_file
   let in_spec = match(current_file, '^spec/') != -1
   let going_to_spec = !in_spec
   let in_app = match(current_file, '\<controllers\>') != -1 ||
    match(current_file, '\<models\>') != -1 ||
    match(current_file, '\<views\>') != -1 || match(current_file, '\<helpers\>') != -1
   if going_to_spec
   if in_app
   let new_file = substitute(new_file, '^app/', '',
    '')
   end
    let new_file = substitute(new_file, '\.rb$', '_spec.rb', '')
    let new_file = 'spec/' . new_file
   else
    let new_file =
   substitute(new_file, '_spec\.rb$', '.rb', '')
    let new_file =
   substitute(new_file, '^spec/', '', '')
    if in_app
     let new_file = 'app/' . new_file
    end
   endif
   return new_file
  endfunction
   nmap <silent> <Leader>/ :NERDTreeToggle<CR>
  nnoremap  <leader> :call OpenTestAlternate()<cr>
   colorscheme tomorrow-night 
