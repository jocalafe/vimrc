"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Important:
"       This requries that you install https://github.com/amix/vimrc !
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" => Vundle config
""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim_runtime/bundle/Vundle.vim
call vundle#rc("~/.vim_runtime/bundle")
call vundle#begin()

Plugin 'tpope/vim-fugitive'
Plugin 'mileszs/ack.vim',
Plugin 'w0rp/ale',
Plugin 'jiangmiao/auto-pairs',
Plugin 'ctrlpvim/ctrlp.vim',
Plugin 'morhetz/gruvbox',
Plugin 'maximbaz/lightline-ale',
Plugin 'itchyny/lightline.vim',
Plugin 'yegappan/mru',
Plugin 'scrooloose/nerdtree',
Plugin 'chr4/nginx.vim',
Plugin 'amix/open_file_under_cursor.vim',
Plugin 'scrooloose/snipmate-snippets',
Plugin 'godlygeek/tabular',
Plugin 'vim-scripts/tlib',
Plugin 'MarcWeber/vim-addon-mw-utils',
Plugin 'tpope/vim-commentary',
Plugin 'terryma/vim-expand-region',
Plugin 'nvie/vim-flake8',
Plugin 'airblade/vim-gitgutter',
Plugin 'michaeljsmith/vim-indent-object',
Plugin 'plasticboy/vim-markdown',
Plugin 'tpope/vim-repeat',
Plugin 'garbas/vim-snipmate',
Plugin 'honza/vim-snippets',
Plugin 'tpope/vim-surround',
Plugin 'maxbrunsfeld/vim-yankstack',
Plugin 'mxw/vim-jsx',
Plugin 'junegunn/fzf.vim',
Plugin 'shinchu/lightline-gruvbox.vim',
Plugin 'StanAngeloff/php.vim',
Plugin 'leafgarland/typescript-vim',
Plugin 'ryanoasis/vim-devicons',
Plugin 'RRethy/vim-illuminate',
Plugin 'pangloss/vim-javascript',
Plugin 'jistr/vim-nerdtree-tabs',
Plugin 'tpope/vim-rhubarb',
Plugin 'jremmen/vim-ripgrep',
Plugin 'kudabux/vim-srcery-drk',
Plugin 'evidens/vim-twig',
Plugin 'posva/vim-vue',
Plugin 'tpope/vim-sleuth'
Plugin 'Valloric/YouCompleteMe'

call vundle#end()            " required
filetype plugin indent on    " required

""""""""""""""""""""""""""""""
" => MRU plugin
""""""""""""""""""""""""""""""
let MRU_Max_Entries = 400
map <leader>f :MRU<CR>

""""""""""""""""""""""""""""""
" => GitBlame
""""""""""""""""""""""""""""""
map <leader>gb :Gblame<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Fugitive
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>gs :Gstatus<CR>
map <leader>gd :Gdiff<CR>
map <leader>gc :Gcommit<CR>

""""""""""""""""""""""""""""""
" => YankStack
""""""""""""""""""""""""""""""
let g:yankstack_yank_keys = ['y', 'd']

nmap <c-p> <Plug>yankstack_substitute_older_paste
nmap <c-n> <Plug>yankstack_substitute_newer_paste

""""""""""""""""""""""""""""""
" => CTRL-P
""""""""""""""""""""""""""""""
let g:ctrlp_working_path_mode = 0

let g:ctrlp_map = '<c-f>'
map <leader>j :CtrlP<cr>
map <c-b> :CtrlPBuffer<cr>

let g:ctrlp_max_height = 20

""""""""""""""""""""""""""""""
" => snipMate (beside <TAB> support <CTRL-j>)
""""""""""""""""""""""""""""""
ino <c-j> <c-r>=snipMate#TriggerSnippet()<cr>
snor <c-j> <esc>i<right><c-r>=snipMate#TriggerSnippet()<cr>

""""""""""""""""""""""""""""""
" => Vim grep
""""""""""""""""""""""""""""""
let Grep_Skip_Dirs = 'RCS CVS SCCS .svn generated'
set grepprg=/bin/grep\ -nH

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Nerd Tree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let NERDTreeShowHidden=0
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
let g:NERDTreeWinSize=35
map <leader>tt <plug>NERDTreeTabsToggle<CR>
map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark<Space>
map <leader>nf :NERDTreeFind<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => DEVICONS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if exists('g:loaded_webdevicons')
	call webdevicons#refresh()
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => ALE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <silent> <leader>a <Plug>(ale_next_wrap)
let g:ale_linters = {
			\   'javascript': ['eslint', 'prettier'],
			\	'php': ['phpcbf']
			\}

let g:ale_fixers = {
			\   'javascript': ['eslint']
			\}

