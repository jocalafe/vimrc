"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Important:
"       This requries that you install https://github.com/amix/vimrc !
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set rtp+=/usr/local/opt/fzf

""""""""""""""""""""""""""""""
" => Vundle config
""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim_runtime/bundle/Vundle.vim
call vundle#rc("~/.vim_runtime/bundle")
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'mileszs/ack.vim'
Plugin 'w0rp/ale'
Plugin 'jiangmiao/auto-pairs'
Plugin 'morhetz/gruvbox'
Plugin 'maximbaz/lightline-ale'
Plugin 'itchyny/lightline.vim'
Plugin 'yegappan/mru'
Plugin 'scrooloose/nerdtree'
Plugin 'chr4/nginx.vim'
Plugin 'amix/open_file_under_cursor.vim'
Plugin 'godlygeek/tabular'
Plugin 'vim-scripts/tlib'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tpope/vim-commentary'
Plugin 'terryma/vim-expand-region'
Plugin 'nvie/vim-flake8'
Plugin 'airblade/vim-gitgutter'
Plugin 'michaeljsmith/vim-indent-object'
Plugin 'plasticboy/vim-markdown'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'maxbrunsfeld/vim-yankstack'
Plugin 'junegunn/fzf.vim'
Plugin 'shinchu/lightline-gruvbox.vim'
Plugin 'StanAngeloff/php.vim'
Plugin 'HerringtonDarkholme/yats.vim'
Plugin 'ryanoasis/vim-devicons'
Plugin 'RRethy/vim-illuminate'
Plugin 'othree/yajs.vim'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'tpope/vim-rhubarb'
Plugin 'jremmen/vim-ripgrep'
Plugin 'evidens/vim-twig'
Plugin 'posva/vim-vue'
Plugin 'tpope/vim-sleuth'
Plugin 'neoclide/coc.nvim'
Plugin 'styled-components/vim-styled-components'
Plugin 'janko/vim-test'
Plugin 'martinda/Jenkinsfile-vim-syntax'
Plugin 'jasoncarr0/sidewalk-colorscheme'
Plugin 'theJian/Mogao'
Plugin 'shapeoflambda/dark-purple.vim'
Plugin 'iamcco/markdown-preview.nvim'
Plugin 'kamykn/spelunker.vim'
Plugin 'SirVer/ultisnips'
Plugin 'scrooloose/snipmate-snippets'
Plugin 'honza/vim-snippets'
Plugin 'epilande/vim-es2015-snippets'
Plugin 'mlaursen/vim-react-snippets'
Plugin 'jaredgorski/spacecamp'
Plugin 'protesilaos/prot16-vim'
Plugin 'sainnhe/sonokai'
Plugin 'MaxMEllon/vim-jsx-pretty'

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
" => ultisnips
""""""""""""""""""""""""""""""
let g:UltiSnipsExpandTrigger="<C-l>"
let g:UltiSnipsJumpForwardTrigger="<C-b>"
let g:UltiSnipsJumpBackwardTrigger="<C-z>"

""""""""""""""""""""""""""""""
" => Vim grep
""""""""""""""""""""""""""""""
let Grep_Skip_Dirs = 'RCS CVS SCCS .svn generated'
set grepprg=/bin/grep\ -nH

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Nerd Tree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let NERDTreeShowHidden=0
let g:NERDTreeWinSize=35
map <leader>tt <plug>NERDTreeTabsToggle<CR>
map <leader>nf :NERDTreeFind<cr>

let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25


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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => FZF
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:fzf_layout = { 'down': '~25%' }

let g:fzf_colors =
      \ { 'fg':      ['fg', 'Normal'],
      \ 'bg':      ['bg', 'Normal'],
      \ 'hl':      ['fg', 'Comment'],
      \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
      \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
      \ 'hl+':     ['fg', 'Statement'],
      \ 'info':    ['fg', 'PreProc'],
      \ 'border':  ['fg', 'Ignore'],
      \ 'prompt':  ['fg', 'Conditional'],
      \ 'pointer': ['fg', 'Exception'],
      \ 'marker':  ['fg', 'Keyword'],
      \ 'spinner': ['fg', 'Label'],
      \ 'header':  ['fg', 'Comment'] }

map <c-f> :Files<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => FZF Dev_Icons
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! Fzf_dev()
  function! s:files()
    let files = split(system($FZF_DEFAULT_COMMAND), '\n')
    return s:prepend_icon(files)
  endfunction

  function! s:prepend_icon(candidates)
    let result = []
    for candidate in a:candidates
      let filename = fnamemodify(candidate, ':p:t')
      let icon = WebDevIconsGetFileTypeSymbol(filename, isdirectory(filename))
      call add(result, printf("%s %s", icon, candidate))
    endfor

    return result
  endfunction

  function! s:edit_file(item)
    let parts = split(a:item, ' ')
    let file_path = get(parts, 1, '')
    execute 'silent e' file_path
  endfunction

  call fzf#run({
	\ 'source': <sid>files(),
	\ 'sink':   function('s:edit_file'),
	\ 'options': '-m -x +s',
	\ 'down':    '40%' })
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => YouCompleteMe
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ycm_goto_buffer_command = 'new-tab'
let g:ycm_autoclose_preview_window_after_insertion = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spelunker
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nospell

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => coc.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
let g:coc_config_home = $HOME.'/.vim_runtime/coc'
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Use `lp` and `ln` for navigate diagnostics
nmap <silent> <leader>lp <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>ln <Plug>(coc-diagnostic-next)

" Remap keys for gotos:
nmap <silent> <leader>ld <Plug>(coc-definition)
nmap <silent> <leader>lt <Plug>(coc-type-definition)
nmap <silent> <leader>li <Plug>(coc-implementation)
nmap <silent> <leader>lf <Plug>(coc-references)

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)
