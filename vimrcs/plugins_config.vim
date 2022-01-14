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

Plug 'nvim-lua/plenary.nvim'
Plug 'MunifTanjim/nui.nvim'
Plug 'nvim-neo-tree/neo-tree.nvim'
Plug 'nvim-telescope/telescope.nvim'
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
Plug 'honza/vim-snippets'
Plug 'epilande/vim-es2015-snippets'
Plug 'mlaursen/vim-react-snippets'
Plug 'tpope/vim-unimpaired'
Plug 'sheerun/vim-polyglot'
Plug 'editorconfig/editorconfig-vim'
Plug 'romgrk/barbar.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-lualine/lualine.nvim'
Plug 'machakann/vim-highlightedyank'
Plug 'rebelot/kanagawa.nvim'
Plug 'folke/tokyonight.nvim'

" Coc Extensions as plugins
Plug 'neoclide/coc-json', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-css', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-eslint', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-prettier', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-highlight', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-snippets', {'do': 'yarn install --frozen-lockfile'}


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
" let g:UltiSnipsExpandTrigger="<C-l>"
let g:UltiSnipsJumpForwardTrigger="<C-b>"
let g:UltiSnipsJumpBackwardTrigger="<C-z>"

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
nmap <leader>do <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Show documentation on hover
function! ShowDocIfNoDiagnostic(timer_id)
  if (coc#float#has_float() == 0 && CocHasProvider('hover') == 1)
    silent call CocActionAsync('doHover')
  endif
endfunction

function! s:show_hover_doc()
  call timer_start(500, 'ShowDocIfNoDiagnostic')
endfunction

" autocmd CursorHoldI * :call <SID>show_hover_doc()
" autocmd CursorHold * :call <SID>show_hover_doc()

" Show diagnostics list
nnoremap <silent> <leader>d :<C-u>CocList diagnostics<cr>
imap <C-l> <Plug>(coc-snippets-expand)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Barbar.nvim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let bufferline = {}
let g:bufferline.auto_hide = v:true
let g:bufferline.icons = 'both'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Telescope
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
lua << EOF
require('telescope').setup {
  defaults = {
    file_ignore_patterns = { "^.git/" },
    mappings = {
      i = {
        ["<C-j>"] = 'move_selection_next',
        ["<C-k>"] = 'move_selection_previous',
      }
    }
  },
  pickers = {
    find_files = {
      theme = "dropdown",
    },
    live_grep = {
      theme = "dropdown",
    },
    spell_suggest = {
      theme = "cursor",
    }
  }
}
EOF

nnoremap <silent> <c-f> :Telescope find_files hidden=true<CR>
nnoremap <silent> <c-g> :Telescope live_grep hidden=true<CR>
nnoremap z= :Telescope spell_suggest<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Lualine
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
lua << EOF
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'tokyonight',
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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NeoTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
lua << EOF
local highlights = require('neo-tree.ui.highlights')

require("neo-tree").setup {
  -- The default_source is the one used when calling require('neo-tree').show()
  -- without a source argument.
  default_source = "filesystem",
  popup_border_style = "NC", -- "double", "none", "rounded", "shadow", "single" or "solid"
  -- "NC" is a special style that works well with NormalNC set
  enable_git_status = true,
  enable_diagnostics = true,
  filesystem = {
    window = {
      -- see https://github.com/MunifTanjim/nui.nvim/tree/main/lua/nui/popup
      -- for possible options. These can also be functions that return these
      -- options.
      position = "left", -- left, right, float
      width = 40, -- applies to left and right positions
      -- settings that apply to float position only
      popop = {
        size = {
          height = "80%",
          width = "50%"
        },
        position = "50%" -- 50% means center it
        -- you can also specify border here, if you want a different setting from
        -- the global popup_border_style.
      },
      -- Mappings for tree window. See |Neo-tree-Mappings| for built-in 
      -- commands. You can also create your own commands by providing a 
      -- function instead of a string. See the built-in commands for examples.
      mappings = {
        ["<2-LeftMouse>"] = "open",
        ["<cr>"] = "open",
        ["S"] = "open_split",
        ["s"] = "open_vsplit",
        ["<bs>"] = "navigate_up",
        ["."] = "set_root",
        ["H"] = "toggle_hidden",
        ["I"] = "toggle_gitignore",
        ["R"] = "refresh",
        ["/"] = "filter_as_you_type",
        ["f"] = "filter_on_submit",
        ["<C-x>"] = "clear_filter",
        ["a"] = "add",
        ["d"] = "delete",
        ["r"] = "rename",
        ["c"] = "copy_to_clipboard",
        ["x"] = "cut_to_clipboard",
        ["p"] = "paste_from_clipboard",
      }
    },
    search_limit = 50, -- max number of search results when using filters
    filters = {
      show_hidden = false,
      respect_gitignore = true,
    },
    bind_to_cwd = true, -- true creates a 2-way binding between vim's cwd and neo-tree's root
    before_render = function(state)
      -- This function is called after the file system has been scanned,
      -- but before the tree is rendered. You can use this to gather extra
      -- data that can be used in the renderers.
      local utils = require("neo-tree.utils")
      state.git_status_lookup = utils.get_git_status()
    end,
    -- The components section provides custom functions that may be called by 
    -- the renderers below. Each componment is a function that takes the
    -- following arguments:
    --      config: A table containing the configuration provided by the user
    --              when declaring this component in their renderer config.
    --      node:   A NuiNode object for the currently focused node.
    --      state:  The current state of the source providing the items.
    --
    -- The function should return either a table, or a list of tables, each of which
    -- contains the following keys:
    --    text:      The text to display for this item.
    --    highlight: The highlight group to apply to this text.
    components = {
      hello_node = function (config, node, state)
        local text = "Hello " .. node.name
        if state.search_term then
          text = string.format("Hello '%s' in %s", state.search_term, node.name)
        end
        return {
          text = text,
          highlight = config.highlight or highlights.FILE_NAME,
        }
      end
    },
    -- This section provides the renderers that will be used to render the tree.
    -- The first level is the node type.
    -- For each node type, you can specify a list of components to render.
    -- Components are rendered in the order they are specified.
    -- The first field in each component is the name of the function to call.
    -- The rest of the fields are passed to the function as the "config" argument.
    renderers = {
      directory = {
        {
            "icon",
            folder_closed = "",
            folder_open = "",
            padding = " ",
        },
        { "current_filter" },
        { "name" },
        {
          "clipboard",
          highlight = "NeoTreeDimText"
        },
        { "diagnostics", errors_only = true },
        --{ "git_status" },
      },
      file = {
        {
          "icon",
          default = "*",
          padding = " ",
        },
        --{ "hello_node", highlight = "Normal" }, -- For example, don't actually
        -- use this!
        {
          "name",
          use_git_status_colors = true
        },
        {
          "clipboard",
          highlight = "NeoTreeDimText"
        },
        { "diagnostics" },
        {
          "git_status",
          highlight = "NeoTreeDimText"
        }
      },
    }
  }
}
EOF

nnoremap <leader>tt :NeoTreeFloatToggle<CR>
nnoremap <leader>nf :NeoTreeFloatToggle<CR>
