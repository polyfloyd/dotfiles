" polyfloyd's .vimrc

version 8.0

let g:polyglot_disabled = ['go', 'vlang', 'vue']

call plug#begin('~/.config/nvim/plugged')

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'airblade/vim-gitgutter'
Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' }
Plug 'bling/vim-airline'
Plug 'chikamichi/mediawiki.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'godlygeek/tabular'
Plug 'hail2u/vim-css3-syntax'
Plug 'jlanzarotta/bufexplorer'
Plug 'junegunn/goyo.vim', { 'on':  'Goyo' }
Plug 'metakirby5/codi.vim'
Plug 'rakr/vim-one'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline-themes'
Plug 'elkowar/yuck.vim'

call plug#end()

" Requires Debian fzf package
set rtp+=/usr/share/doc/fzf/examples

" VIM Settings
set autoindent
set backspace=indent,eol,start
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,default,latin1
set fillchars=vert:│,fold:\ 
set foldmethod=syntax
set foldnestmax=1
set foldlevelstart=1
set grepprg=grep\ -nH\ $*
set hidden
set history=50
set hlsearch
set incsearch
set laststatus=2
set linebreak
set list
set listchars=tab:│\ ,trail:⋯,precedes:←,extends:→
set mouse=a
set mousemodel=popup_setpos
set nomodeline
set nostartofline
set nrformats=alpha
set path+=src
set shortmess=flmnxoOtTI
set showcmd
set showtabline=1
set smartindent
set smarttab
set splitright
set suffixes=.bak,~,.o,.h,.info,.swp,.obj,.aux,.log,.dvi,.bbl,.out,.o,.lo,.d,.class,.pyc
set switchbuf=useopen
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set colorcolumn=100
set textwidth=100
set termencoding=utf-8
set viminfo='20,\"500,%
set virtualedit=block
set wildignore+=*/*.bak,*/*~,*/*.o,*/*.sw*,*/*.sw*.obj,*/*.aux,*/*.dvi,*/*.bbl,*/*.out,*/*.o,*/*.lo,*/*.d,*/*.class,*/*.pyc,*/__pycache__
set wildmenu
set window=61
syntax on

" Key Mappings
nmap ; :
map <C-p>     :FZF<CR>
map <F10>     :NERDTreeToggle<CR>

" Colors & Theming
hi Normal      ctermfg=252 ctermbg=232
hi LineNr      ctermbg=0 ctermfg=12
hi NonText     ctermbg=0 ctermfg=12
hi ColorColumn ctermbg=0
hi Search      term=reverse ctermbg=8
hi Visual      term=reverse ctermbg=8
hi Comment     term=bold ctermfg=8 ctermbg=none
colorscheme one
set background=dark
set t_Co=256
set termguicolors
let g:NERDTreeDirArrows=1
let g:NERDTreeMinimalUI=1
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_powerline_fonts=0
let g:airline_theme='one'
let g:airline#extensions#whitespace#checks = [ 'trailing' ]

" Plugin settings
let g:go_fmt_options = { 'gofmt': '-s' }
let g:go_imports_autosave = 1
let g:go_imports_mode = "goimports"
let g:rustfmt_autosave = 0
let g:deoplete#enable_at_startup = 1
let NERDTreeRespectWildIgnore=1

" Language Server settings
"   cpp:    apt install clangd
"   go:     (gopls, included in vim-go)
"   python: pip install python-language-server[flake8]
"   rust:   rustup component add rust-analyzer rust-analysis rust-src
let g:LanguageClient_serverCommands = {
    \ 'cpp': ['clangd'],
    \ 'python': ['~/.local/bin/pyls'],
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rust-analyzer'],
    \ }
let g:LanguageClient_settingsPath = expand('~/.vim/settings.json')
set completefunc=LanguageClient#complete
"set formatexpr=LanguageClient#textDocument_rangeFormatting_sync()
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> gr :call LanguageClient#textDocument_rename()<CR>
nnoremap <silent> gc :call LanguageClient#textDocument_references()<CR>
nnoremap <F5> :call LanguageClient_contextMenu()<CR>

" Autocmds and other stuff
autocmd BufRead,BufNewFile,BufWrite *.c,*.h,*.cc,*.hh,*.cpp,*.hpp,*.ino setlocal ft=cpp
autocmd BufRead,BufNewFile,BufWrite *.md setlocal ft=markdown
autocmd BufRead,BufNewFile *.md setlocal spelllang=en
autocmd BufRead,BufNewFile,BufWrite *.py setlocal ft=python
autocmd BufRead,BufNewFile,BufWrite *.glsl setlocal ft=glsl
autocmd BufRead,BufNewFile,BufWrite *.v setlocal ft=verilog
autocmd BufRead,BufNewFile,BufWrite *.vue setlocal ft=html " 'vue' format is slow?
autocmd BufRead,BufNewFile,BufWrite *.nix setlocal ft=nix

autocmd FileType c,cpp setlocal cindent
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType markdown,gitcommit setlocal spell
autocmd FileType python setlocal foldmethod=indent
autocmd FileType gitcommit,json setlocal nofoldenable
autocmd FileType javascript,json,css,html,markdown setlocal noexpandtab tabstop=2 softtabstop=2 shiftwidth=2
autocmd FileType nix setlocal expandtab tabstop=2 softtabstop=2 shiftwidth=2
autocmd FileType go setlocal noexpandtab tabstop=4 softtabstop=4 shiftwidth=4

autocmd BufWritePost * GitGutter

" vim: set ft=vim
