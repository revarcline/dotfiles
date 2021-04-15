set nocompatible


" a few external requirements/recs from your system package manager or elsewhere:
" fzf
" ag
" rubocop
" Jet Brains Mono Nerd Font or any other mono font from
" https://github.com/ryanoasis/nerd-fonts
"
" naturally check the help pages or the github pages for these plugins
" if you want some tips, i've made a few alterations but not too many
"
" c-z and c-x behavior have changed in insert mode!

" set up correct pyhon (important for plugins)
if exists("$VIRTUAL_ENV")
    let g:python3_host_prog=substitute(system("which -a python3 | head -n2 | tail -n1"), "\n", '', 'g')
else
    let g:python3_host_prog=substitute(system("which python3"), "\n", '', 'g')
endif

" autoinstall vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
endif

" Plugins! be sure to install
" https://github.com/junegunn/vim-plug
call plug#begin()

" color schemes!
Plug 'rafi/awesome-vim-colorschemes'

" start screen
Plug 'mhinz/vim-startify'

" extra language plugins
Plug 'sheerun/vim-polyglot'

" ale for linting - requires linters as system packages
Plug 'dense-analysis/ale'

" elixir
Plug 'elixir-editors/vim-elixir' 

" NERDCommenter and NERDTree
Plug 'preservim/nerdcommenter'
Plug 'preservim/nerdtree'

" Plug in goyo and limelight for a low distraction environment
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

" floating terminals
Plug 'voldikss/vim-floaterm'

" emmet
Plug 'mattn/emmet-vim'

" Rust language!
Plug 'rust-lang/rust.vim'

" show indent lines
Plug 'Yggdroot/indentLine'

" julia
Plug 'JuliaEditorSupport/julia-vim'

" cht.sh for little tips
Plug 'dbeniamine/cheat.sh-vim'

" Airline - statusbar plugin
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" more nerdfont fun
Plug 'ryanoasis/vim-devicons'

" tim pope's sensible, just a few easy settings
Plug 'tpope/vim-sensible'

" more sensible indentation
Plug 'tpope/vim-sleuth'

" rails plugin
Plug 'tpope/vim-rails'

" caps lock indicator
Plug 'tpope/vim-capslock'

" bracket keys
Plug 'tpope/vim-unimpaired'

" git info!
Plug 'tpope/vim-fugitive'

" eunuch, to do file commands
Plug 'tpope/vim-eunuch'

" more tim pope, this time for web-dev tags
Plug 'tpope/vim-ragtag'

" add end blocks in ruby devlopment
Plug 'tpope/vim-endwise'

" repeat last move
Plug 'tpope/vim-repeat'

" Colorizer (for hex values)
Plug 'chrisbra/Colorizer'

" closer for quotes and shit
Plug 'jiangmiao/auto-pairs'

" better alignment for delimiters and such
Plug 'junegunn/vim-easy-align'

" Deoplete and plugins 
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'deoplete-plugins/deoplete-zsh'
Plug 'tbodt/deoplete-tabnine', { 'do': './install.sh' }
Plug 'Shougo/neco-syntax'
Plug 'sebastianmarkow/deoplete-rust'
" lsp suport
Plug 'prabirshrestha/vim-lsp'
Plug 'lighttiger2505/deoplete-vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'GrzegorzKozub/vim-elixirls', { 'do': ':ElixirLsCompileSync' }

" FZF baybee
Plug '/usr/bin/fzf'  " make sure you install this
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" Improved python folding
Plug 'tmhedberg/SimpylFold'

" gitgutter
Plug 'airblade/vim-gitgutter'

" easier unicode and digraphs
Plug 'chrisbra/unicode.vim'

" tpope surround (autoclose)
Plug 'tpope/vim-surround'

" tmux stuff
Plug 'tpope/vim-tbone'

call plug#end()

" Syntax highlighting
syntax on

set t_ut= " fix 256 colors in tmux http://sunaku.github.io/vim-256color-bce.html
set termguicolors

" tmux escape bindings
  " 24 bit colour
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

  " Italics
  let &t_ZH = "\<Esc>[3m"
  let &t_ZR = "\<Esc>[23m"

"Set leader
nnoremap <SPACE> <Nop>
let mapleader = " "

" General
set number	" Show line numbers
set linebreak	" Break lines at word (requires Wrap lines)
set showbreak=+++ 	" Wrap-broken line prefix
set showmatch	" Highlight matching brace
set visualbell	" Use visual bell (no beeping)
 
set cursorline  " highlight current line
set cc=80       " highlight 80th column for readabilty
set hlsearch	" Highlight all search results
set smartcase	" Enable smart-case search
set ignorecase	" Always case-insensitive
set incsearch	" Searches for strings incrementally
set scl=yes     " Sign column always on

set autoindent	" Auto-indent new lines
set smartindent	" Enable smart-indent
set smarttab	" Enable smart-tabs
 
set ruler	" Show row and column ruler information
 
set undolevels=1000	" Number of undo levels

set cmdheight=2

highlight LineNr ctermbg=236

" Better command-line completion
set wildmenu
 
" Show partial commands in the last line of the screen
set showcmd
 
" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below)
set hlsearch

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase
 
" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler
 
" Always display the status line, even if only one window is displayed
set laststatus=2
 
" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm
 
" Enable use of the mouse for all modes
set mouse=a
 
" Use <F6> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F6>
 
" disable annoying conceals
let g:vim_json_syntax_conceal = 0
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0
 
"------------------------------------------------------------
" Indentation options {{{1
"
" Indentation settings according to personal preference.
set shiftwidth=2
set softtabstop=2
set expandtab

"------------------------------------------------------------
" Mappings {{{1
"
" Useful mappings
 
" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
map Y y$
 
" Easy call system clipboard
nmap <Leader>v "+
vmap <Leader>v "+

"Instead of stumbling into ex mode, repeat the last macro used.
nnoremap Q @@

" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-L> :nohl<CR><C-L>

" use latex-to-unicode functionality from julia plugin
" turn off deoplete to get full tab-completion instead of c-x c-o
noremap <expr> <F7> LaTeXtoUnicode#Toggle()
noremap! <expr> <F7> LaTeXtoUnicode#Toggle()

" toggle deoplete (helps on cpu if not using completion, note this is silent)
noremap <expr> <F5> deoplete#toggle()
noremap! <expr> <F5> deoplete#toggle()

" easy map for line nav
nnoremap <Leader>j J
vnoremap <Leader>j J
" search ag for word under cursor
nnoremap <Leader>k :Ag <C-R><C-W><CR>

nmap H ^
vmap H ^
nmap L $
vmap L $

nmap J 5j
vmap J 5j
nmap K 5k
vmap K 5k

" Save mappings
inoremap <C-s> <esc>:w<cr>
nnoremap <C-s> :w<cr>

" close buffers
inoremap <C-e> <esc>:bd<cr>
nnoremap <C-e> :bd<cr>

" highlight colors
nmap <Leader>hi :ColorToggle<CR>
xmap <Leader>hi :ColorToggle<CR>

" Use deoplete.
let g:deoplete#enable_at_startup = 1

" Deoplete mappings
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"

" remap emmet to c-z during insert mode, available for all files
let g:user_emmet_leader_key='<C-z>'
let g:user_emmet_install_global = 1

" FZF mappings
nnoremap <Leader>b :Buffer<CR>
xnoremap <Leader>b :Buffer<CR>
nnoremap <Leader>; :Commands<CR>
xnoremap <Leader>; :Commands<CR>
nnoremap <C-p> <esc>:Files<CR>
xnoremap <C-p> :Files<CR>
nnoremap <Leader>p <esc>:GFiles<CR>
xnoremap <Leader>p :GFiles<CR>
nnoremap <Leader>rg :Rg<CR>
xnoremap <Leader>rg :Rg<CR>
nnoremap <Leader>ag :Ag<CR>
xnoremap <Leader>ag :Ag<CR>

" FZF with preview for files
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>,
    \ fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}),
    \ <bang>0)

" Hide cmd buffer for fzf
autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

" edit this very file, source it
nnoremap <leader>ev :e $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" startify
let g:startify_padding_left = 2
let g:startify_custom_header = ''

" FloatTerm
let g:floaterm_width = 1.0
let g:floaterm_height = 0.4
let g:floaterm_position = 'bottom'

nnoremap   <silent>   <F4>    :FloatermNew --autoclose=2<CR>
inoremap   <silent>   <F4>    <ESC>:FloatermNew --autoclose=2<CR>
tnoremap   <silent>   <F4>    <C-\><C-n>:FloatermNew --autoclose=2<CR>
nnoremap   <silent>   <F2>    :FloatermPrev<CR>
inoremap   <silent>   <F2>    <ESC>:FloatermPrev<CR>
tnoremap   <silent>   <F2>    <C-\><C-n>:FloatermPrev<CR>
nnoremap   <silent>   <F3>    :FloatermNext<CR>
inoremap   <silent>   <F3>    <ESC>:FloatermNext<CR>
tnoremap   <silent>   <F3>    <C-\><C-n>:FloatermNext<CR>
nnoremap   <silent>   <F1>   :FloatermToggle<CR>
inoremap   <silent>   <F1>   <ESC>:FloatermToggle<CR>
tnoremap   <silent>   <F1>   <C-\><C-n>:FloatermToggle<CR>
tnoremap   <silent>   <F5>   <C-\><C-n><CR>

nnoremap   <C-c><C-c> :FloatermSend<CR>
vnoremap   <C-c><C-c> :FloatermSend<CR>

" Goyo hotkey (distraction-free typing)
nmap <Leader>go :Goyo<CR>
xmap <Leader>go :Goyo<CR>
nmap <Leader>li :Limelight!!<CR>
xmap <Leader>li :Limelight!!<CR>

" activate limelight with goyo
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" More goyo and limelight settings
let g:limelight_conceal_ctermfg = 240

" NERDTree toggle and arrows
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Default: 0.5
let g:limelight_default_coefficient = 0.7

" Number of preceding/following paragraphs to include (default: 0)
let g:limelight_paragraph_span = 2

" Beginning/end of paragraph
"   When there's no empty line between the paragraphs
"   and each paragraph starts with indentation
let g:limelight_bop = '\n'
let g:limelight_eop = '\n'

" Highlighting priority (default: 10)
"   Set it to -1 not to overrule hlsearch
let g:limelight_priority = -1
" ragtag available for more files
let g:ragtag_global_maps = 1


let g:surround_106 = "{\/\* \r \*\/}"

" Indent stuff
let g:indentLine_enabled = 1
let g:indentLine_color_term = 239
let g:indentLine_char_list = ['|', '¦', '┆', '┊']

" gruvbox baby
let g:gruvbox_italic=1
let g:gruvbox_bold=1
let g:gruvbox_underline=1
let g:gruvbox_undercurl=1
let g:gruvbox_italicize_comments=1

" disable lsp syntax highlighting
let g:lsp_diagnostics_enabled = 0

" ALE settings
" use ale as a deoplete source
let g:ale_completion_enabled = 1

" set symbols
let g:ale_sign_error = ""
let g:ale_sign_warning = ""
let g:ale_sign_style_warning = ""
let g:ale_sign_style_error = ""
let g:ale_sign_info = ""

" elixir ls stuff
let g:ale_elixir_elixir_ls_release = '~/.config/nvim/plugged/vim-elixirls/elixir-ls/release'

" https://github.com/JakeBecker/elixir-ls/issues/54
let g:ale_elixir_elixir_ls_config = { 'elixirLS': { 'dialyzerEnabled': v:false } }

" fix indent etc on save
let g:ale_fixers = {
      \    'ruby': ['rubocop'],
      \    'javascript': ['eslint'],
      \    'elixir': ['mix_format'],
      \    'css': ['stylelint', 'prettier'],
      \    'html': ['prettier']
      \}
let g:ale_fix_on_save = 1

let g:ale_linters = {}
let g:ale_linters.elixir = [ 'credo', 'elixir-ls' ]
let g:ale_linters.javascript = [ 'eslint' ]

" helpers for toggling fix_on_save
command! ALEDisableFixers       let g:ale_fix_on_save=0
command! ALEEnableFixers        let g:ale_fix_on_save=1
command! ALEDisableFixersBuffer let b:ale_fix_on_save=0
command! ALEEnableFixersBuffer  let b:ale_fix_on_save=1

" use bracket bindings to navgiate ale specific errors/warnings
nmap <silent> [r <Plug>(ale_previous_wrap)
nmap <silent> ]r <Plug>(ale_next_wrap)

" Airline settings
let g:airline_powerline_fonts = 1
" make tabline the way we want it
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buf_label_first = 1
let g:airline#extensions#tabline#tabs_label = '裡'
let g:airline#extensions#tabline#buffers_label = ' '
let g:airline#extensions#tabline#overflow_marker = ''

" ALE enabled
let g:airline#extensions#ale#enabled = 1
let airline#extensions#ale#error_symbol = ' '
let airline#extensions#ale#warning_symbol = ' '

" get rid of that ugly whitespace thing
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#branch#enabled= 1

let g:airline#extensions#tabline#close_symbol = ''
let g:airline#extensions#capslock#symbol = ''

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = 'שׂ'
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
let g:airline_symbols.maxlinenr= ''

colors gruvbox
