"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Important:
"       This requries that you install https://github.com/amix/vimrc !
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" => vim-plug config
""""""""""""""""""""""""""""""
" Install vim-plug if not found
 if empty(glob('${XDG_DATA_HOME:-$HOME/.local/share}/nvim/site/autoload/plug.vim'))
   silent !sh -c 'curl -fLo ${XDG_DATA_HOME:-$HOME/.local/share}/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
 endif
" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

""""""""""""""""""""""""""""""
" => Vundle config
""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required

call plug#begin('~/.vim_runtime/plugged')

Plug 'tpope/vim-fugitive'
Plug 'jiangmiao/auto-pairs'
Plug 'morhetz/gruvbox'
Plug 'amix/open_file_under_cursor.vim'
Plug 'tpope/vim-commentary'
Plug 'airblade/vim-gitgutter'
Plug 'michaeljsmith/vim-indent-object'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'ryanoasis/vim-devicons'
Plug 'RRethy/vim-illuminate'
Plug 'tpope/vim-rhubarb'
Plug 'jremmen/vim-ripgrep'
Plug 'tpope/vim-sleuth'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-test/vim-test'
Plug 'jasoncarr0/sidewalk-colorscheme'
Plug 'theJian/Mogao'
Plug 'iamcco/markdown-preview.nvim'
Plug 'SirVer/ultisnips'
Plug 'scrooloose/snipmate-snippets'
Plug 'honza/vim-snippets'
Plug 'epilande/vim-es2015-snippets'
Plug 'mlaursen/vim-react-snippets'
Plug 'tpope/vim-unimpaired'
Plug 'sheerun/vim-polyglot'
Plug 'editorconfig/editorconfig-vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'romgrk/barbar.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'hoob3rt/lualine.nvim'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'machakann/vim-highlightedyank'
" Plug 'kamykn/spelunker.vim' " need to find a faster spelling plugin :(

" Coc Extensions as plugins
Plug 'neoclide/coc-json', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-css', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-eslint', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-prettier', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-highlight', {'do': 'yarn install --frozen-lockfile'}
Plug 'pappasam/coc-jedi', { 'do': 'yarn install --frozen-lockfile && yarn build' }


call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Fugitive
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>gb :Git blame<CR>
map <leader>gs :Git status<CR>
map <leader>gd :Git diff<CR>
map <leader>gc :Git commit<CR>

""""""""""""""""""""""""""""""
" => ultisnips
""""""""""""""""""""""""""""""
let g:UltiSnipsExpandTrigger="<C-l>"
let g:UltiSnipsJumpForwardTrigger="<C-b>"
let g:UltiSnipsJumpBackwardTrigger="<C-z>"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NvimTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:nvim_tree_width=35
let g:nvim_tree_follow = 1
let g:nvim_tree_indent_markers = 1
nnoremap <leader>tt :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>nf :NvimTreeFindFile<CR>

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
" nmap <silent> <leader>a <Plug>(ale_next_wrap)
" let g:ale_linters = {
"       \ 'javascript': ['eslint', 'prettier'],
"       \ 'typescript': ['eslint', 'prettier'],
"       \	'php': ['phpcbf']
"       \}

" let g:ale_fixers = {
"       \ 'javascript': ['eslint', 'prettier'],
"       \ 'typescript': ['eslint', 'prettier']
"       \}

" let g:ale_linter_aliases = {'typescriptreact': 'typescript'}

" autocmd BufEnter */dist/* let b:ale_enabled = 0
" autocmd BufEnter */node_modules/* let b:ale_enabled = 0

" let g:ale_fix_on_save = 1

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
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

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

" Remap keys for applying codeAction to the current line.
nmap <leader>a <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Barbar.nvim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let bufferline = {}
let g:bufferline.auto_hide = v:true
let g:bufferline.icons = 'both'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => FZF
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set rtp+=/usr/local/opt/fzf
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }
let $FZF_DEFAULT_COMMAND='rg --files --follow --hidden -g "!.git/" -g "!bundle/"'
let $FZF_DEFAULT_OPTS="--ansi --preview-window 'right:60%' --layout reverse --margin=1,4 --preview 'bat --color=always --style=header,grid --line-range :300 {}'""
function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

" Prevent FZF commands from opening in none modifiable buffers
function! FZFOpen(cmd)
    " If more than 1 window, and buffer is not modifiable or file type is
    " NERD tree or Quickfix type
    if winnr('$') > 1 && (!&modifiable || &ft == 'nerdtree' || &ft == 'qf')
        " Move one window to the right, then up
        wincmd l
        wincmd k
    endif
    exe a:cmd
endfunction

nnoremap <silent> <c-f> :call FZFOpen(':Files')<CR>
nnoremap <silent> <c-g> :call FZFOpen(':RG')<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NvimTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:nvim_tree_auto_close = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Lualine
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
lua << EOF
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'gruvbox',
    section_separators = { '', '' },
    component_separators = { '', '' },
    disabled_filetypes = {}
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch'},
    lualine_c = {{'filename', file_status=true, path=1 }},
    lualine_x = {'filetype'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {'nvim-tree'}
}
EOF
