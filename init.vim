call plug#begin('~/.local/share/nvim/plugged')
  Plug 'preservim/nerdtree', { 'on':  'NERDTreeToggle' }
	Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'easymotion/vim-easymotion'
  Plug 'jiangmiao/auto-pairs'
  Plug 'sheerun/vim-polyglot'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'ryanoasis/vim-devicons'
  Plug 'vim-airline/vim-airline'
  Plug 'airblade/vim-gitgutter'
  Plug 'vim-syntastic/syntastic' 
  Plug 'Yggdroot/indentLine'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-dispatch'
  Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
  Plug 'yuttie/comfortable-motion.vim'
  Plug 'scrooloose/nerdcommenter'
  "Plug 'terryma/vim-multiple-cursors'
  Plug 'mattn/emmet-vim'
  Plug 'matze/vim-move' 
  "Plug 'majutsushi/tagbar'
  Plug 'mhinz/vim-startify'
  Plug 'morhetz/gruvbox'
  Plug 'tpope/vim-surround'
  Plug 'rhysd/git-messenger.vim'
  Plug 'mbbill/undotree'
call plug#end()

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
set incsearch
set hlsearch
set encoding=UTF-8
set mouse=n
set showmatch
set ignorecase
set smartcase

filetype plugin on

let loaded_matchparen = 1

syntax on

"Theme
colorscheme gruvbox
set bg=dark
if (has("termguicolors"))
  set termguicolors
endif

"Easymotion config
map <Leader> <Plug>(easymotion-prefix)

"Fzf search
silent! nmap <C-P> :GFiles<CR>
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>h :History<CR>
nnoremap <Leader>t :BTags<CR>
nnoremap <Leader>T :Tags<CR>
nnoremap <Leader>C :Commits<CR>
nnoremap <Leader>BC :Commits<CR>
nmap <Leader>F :Ag<Space>
nmap <Leader>' :Marks<CR>

"NERDTree
let NERDTreeMinimalUI = 1
let NERDTreeAutoDeleteBuffer = 1
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
map <C-n> :NERDTreeToggle<CR>
nmap <Leader>r :NERDTreeFocus<cr>R<c-w><c-p>
nnoremap <silent> <Leader>v :NERDTreeFind<CR>

"Vim Gitgutter
set signcolumn=yes

" Vim navigation, buffers
map gn :bn<cr>
map gp :bp<cr>
map gd :bd<cr>

"Close all others buffers
nnoremap <leader>co :w <bar> %bd <bar> e# <bar> bd# <CR>

"Vim Coc
set hidden
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=yes
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
inoremap <silent><expr> <c-space> coc#refresh()
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

autocmd CursorHold * silent call CocActionAsync('highlight')
nmap <leader>rn <Plug>(coc-rename)
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>ac  <Plug>(coc-codeaction)
nmap <leader>qf  <Plug>(coc-fix-current)
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)

command! -nargs=0 Format :call CocAction('format')
command! -nargs=? Fold :call     CocAction('fold', <f-args>)
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
let g:airline#extensions#tabline#enabled = 1

let g:coc_global_extensions = [
  \ 'coc-html',
  \ 'coc-css',
  \ 'coc-tsserver',
  \ 'coc-python',
  \ 'coc-eslint',
  \ 'coc-json',
  \ 'coc-yaml',
  \ 'coc-sh',
  \ 'coc-java',
  \ 'coc-jest',
  \ 'coc-highlight',
  \ 'coc-snippets',
  \ 'coc-docker',
  \ 'coc-svg',
  \ 'coc-lists',
  \ 'coc-diagnostic',
  \ 'coc-angular',
  \ 'coc-vetur']

"NerdComment

"Majutsushi tagBar
nmap <F8> :TagbarToggle<CR>
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

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_typescript_checkers = ['tslint']
let g:syntastic_javascript_checkers = ['eslint']

" Vim-move
let g:move_key_modifier = 'C'

" mbbill/undotree
nnoremap <F5> :UndotreeToggle<cr>
