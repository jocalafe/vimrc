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
Plugin 'amix/open_file_under_cursor.vim'
Plugin 'tpope/vim-commentary'
Plugin 'terryma/vim-expand-region'
Plugin 'nvie/vim-flake8'
Plugin 'airblade/vim-gitgutter'
Plugin 'michaeljsmith/vim-indent-object'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'shinchu/lightline-gruvbox.vim'
Plugin 'ryanoasis/vim-devicons'
Plugin 'RRethy/vim-illuminate'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'tpope/vim-rhubarb'
Plugin 'jremmen/vim-ripgrep'
Plugin 'tpope/vim-sleuth'
Plugin 'neoclide/coc.nvim'
Plugin 'vim-test/vim-test'
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
Plugin 'liuchengxu/vim-clap'
Plugin 'tpope/vim-unimpaired'
Plugin 'ap/vim-buftabline'
Plugin 'sheerun/vim-polyglot'

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
" => ultisnips
""""""""""""""""""""""""""""""
let g:UltiSnipsExpandTrigger="<C-l>"
let g:UltiSnipsJumpForwardTrigger="<C-b>"
let g:UltiSnipsJumpBackwardTrigger="<C-z>"

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
" => auto-pairs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:AutoPairsMultilineClose=0

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
      \   'javascript': ['eslint'],
      \   'typescript': ['eslint']
      \}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Clap
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:clap_provider_grep_opts = '-H --no-heading --vimgrep --smart-case --hidden -g "!.git/"'
let g:clap_provider_files_opts = ''
map <c-f> :Clap files --hidden<CR>
map <c-g> :Clap grep2<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spelunker
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nospell

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => coc.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

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

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Buftabline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:buftabline_show=1
let g:buftabline_numbers=2
let g:buftabline_indicators='on'

nmap <leader>1 <Plug>BufTabLine.Go(1)
nmap <leader>2 <Plug>BufTabLine.Go(2)
nmap <leader>3 <Plug>BufTabLine.Go(3)
nmap <leader>4 <Plug>BufTabLine.Go(4)
nmap <leader>5 <Plug>BufTabLine.Go(5)
nmap <leader>6 <Plug>BufTabLine.Go(6)
nmap <leader>7 <Plug>BufTabLine.Go(7)
nmap <leader>8 <Plug>BufTabLine.Go(8)
nmap <leader>9 <Plug>BufTabLine.Go(9)
nmap <leader>0 <Plug>BufTabLine.Go(10)
