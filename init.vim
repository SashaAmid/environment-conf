call plug#begin('~/.vim/plugged')
	Plug 'Yggdroot/indentLine'
	Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
	Plug 'mhartington/nvim-typescript'
	Plug 'scrooloose/nerdtree'
	Plug 'leafgarland/typescript-vim'
  Plug 'kien/ctrlp.vim'
  Plug 'jiangmiao/auto-pairs'
  Plug 'joshdick/onedark.vim'
  Plug 'tpope/vim-fugitive'
  Plug 'w0rp/ale'
  Plug 'airblade/vim-gitgutter'
  Plug 'easymotion/vim-easymotion'
  Plug 'ap/vim-css-color'
  Plug 'vim-airline/vim-airline'
  Plug 'majutsushi/tagbar'
  Plug 'Perlence/tstags'
  Plug 'universal-ctags/ctags'
  Plug 'digitaltoad/vim-pug'
  Plug 'ryanoasis/vim-devicons'
  Plug 'jistr/vim-nerdtree-tabs'
  Plug 'scrooloose/nerdcommenter'
  Plug 'rking/ag.vim'
call plug#end()

if (empty($TMUX))
  if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
    if (has("termguicolors"))
    set termguicolors
  endif
endif

let g:tagbar_type_typescript = {                                                  
  \ 'ctagsbin' : 'tstags',                                                        
  \ 'ctagsargs' : '-f-',                                                           
  \ 'kinds': [                                                                     
  \ 'e:enums:0:1',                                                               
  \ 'f:function:0:1',                                                            
  \ 't:typealias:0:1',                                                           
  \ 'M:Module:0:1',                                                              
  \ 'I:import:0:1',                                                              
  \ 'i:interface:0:1',                                                           
  \ 'C:class:0:1',                                                               
  \ 'm:method:0:1',                                                              
  \ 'p:property:0:1',                                                            
  \ 'v:variable:0:1',                                                            
  \ 'c:const:0:1',                                                              
\ ],                                                                            
\ 'sort' : 0                                                                    
\ }                                

map <Leader>n <plug>NERDTreeTabsToggle<CR>
nnoremap <silent> <Leader>v :NERDTreeFind<CR>

let g:nerdtree_tabs_open_on_console_startup=1
let g:deoplete#enable_at_startup = 1
let g:typescript_indent_disable = 1
let NERDTreeDirArrows = 1
let g:mapleader=','
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

filetype plugin on

set cursorline
set number
set expandtab
set copyindent
set preserveindent
set softtabstop=2
set shiftwidth=2
set tabstop=2
set nobackup
set noswapfile
set omnifunc=syntaxcomplete#Complete

syntax on
colorscheme onedark
let g:airline_theme='onedark'

"Mappings
map <C-n> :NERDTreeToggle<CR>
map <C-i> :TSImport<CR>
map <Co> :NERDTreeToggle %<CR>
map <Leader> <Plug>(easymotion-prefix)
nmap <F8> :TagbarToggle<CR>

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'

nnoremap <C-k> :tabprevious<CR>
nnoremap <C-l>   :tabnext<CR>
nnoremap <C-t>     :tabnew<CR>
inoremap <C-S-w>   <Esc>:tabclose<CR>

nnoremap <A-F1> 1gt
nnoremap <A-F2> 2gt
nnoremap <A-F3> 3gt
nnoremap <A-F4> 4gt
nnoremap <A-F5> 5gt
nnoremap <A-F6> 6gt
nnoremap <A-F7> 7gt
nnoremap <A-F8> 8gt
nnoremap <A-F9> 9gt
nnoremap <A-F10> 10gt 

nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==

map <silent> <A-<> <C-w><
map <silent> <A--> <C-W>-
map <silent> <A-+> <C-W>+
map <silent> <A->> <C-w>>

nnoremap <esc> :noh<return><esc>
