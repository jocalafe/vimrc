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

Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'rafamadriz/friendly-snippets'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-lua/plenary.nvim'
Plug 'MunifTanjim/nui.nvim'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'nvim-telescope/telescope.nvim'
Plug 'tpope/vim-fugitive'
Plug 'ellisonleao/gruvbox.nvim'
Plug 'amix/open_file_under_cursor.vim'
Plug 'tpope/vim-commentary'
Plug 'michaeljsmith/vim-indent-object'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'RRethy/vim-illuminate'
Plug 'tpope/vim-rhubarb'
Plug 'jremmen/vim-ripgrep'
Plug 'tpope/vim-sleuth'
Plug 'cocopon/iceberg.vim'
Plug 'iamcco/markdown-preview.nvim'
Plug 'tpope/vim-unimpaired'
Plug 'editorconfig/editorconfig-vim'
Plug 'romgrk/barbar.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'machakann/vim-highlightedyank'
Plug 'rebelot/kanagawa.nvim'
Plug 'folke/tokyonight.nvim'
Plug 'marko-cerovac/material.nvim'
Plug 'lewis6991/gitsigns.nvim'
Plug 'windwp/nvim-autopairs'
Plug 'windwp/nvim-ts-autotag'

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Fugitive
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>gb :Git blame<CR>
map <leader>gs :Git status<CR>
map <leader>gd :Gitsigns diffthis<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => DEVICONS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
lua << EOF
require'nvim-web-devicons'.setup {
 -- globally enable default icons (default to false)
 -- will get overriden by `get_icons` option
 default = true;
}
EOF

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
    file_ignore_patterns = {
      ".git/",
    },
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
      additional_args = function(opts)
        return {"--hidden"}
      end
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
    section_separators = { left = '', right = '' },
    component_separators = { left = '', right = '' },
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
" => NvimTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
lua << EOF
require'nvim-tree'.setup {
  disable_netrw = false,
  diagnostics = {
    enable = true,
  }
}
EOF

let g:nvim_tree_width=35
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
" => MarkdownPreview
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call mkdp#util#install()

"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Treesitter
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
lua <<EOF
require'nvim-treesitter.configs'.setup {
  autotag = {
    enable = true,
  },
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = true,
    disable = {},
  },
  ensure_installed = {
    "vim",
    "lua",
    "json",
    "yaml",
    "html",
    "scss",
    "css",
    "javascript",
    "typescript",
    "tsx",
  },
}
EOF


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => GitSigns
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
lua <<EOF
require('gitsigns').setup({
  signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
  numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
  linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
  word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
  current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
    delay = 1000,
    ignore_whitespace = false,
  },
})
EOF

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => autopairs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
lua <<EOF
require('nvim-autopairs').setup{}
EOF

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => nvim-lspconfig
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => nvim-cmp
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set completeopt=menu,menuone,noselect

lua <<EOF
require("luasnip.loaders.from_vscode").lazy_load()

-- Configure diagnostic display
vim.diagnostic.config({
    virtual_text = {
        -- Only display errors w/ virtual text
        severity = vim.diagnostic.severity.ERROR,
        -- Prepend with diagnostic source if there is more than one attached to the buffer
        -- (e.g. (eslint) Error: blah blah blah)
        source = "if_many",
        signs = false,
    },
    float = {
        severity_sort = true,
        source = "if_many",
        border = "rounded",
        prefix = function(diagnostic)
            local diag_to_format = {
                [vim.diagnostic.severity.ERROR] = { "Error", "LspDiagnosticsDefaultError" },
                [vim.diagnostic.severity.WARN] = { "Warning", "LspDiagnosticsDefaultWarning" },
                [vim.diagnostic.severity.INFO] = { "Info", "LspDiagnosticsDefaultInfo" },
                [vim.diagnostic.severity.HINT] = { "Hint", "LspDiagnosticsDefaultHint" },
            }
            local res = diag_to_format[diagnostic.severity]
            return string.format("(%s) ", res[1]), res[2]
        end,
    },
    severity_sort = true,
})
vim.o.updatetime = 250
vim.cmd [[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]
-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<leader>f', vim.lsp.buf.formatting, bufopts)
end

  -- Setup nvim-cmp.
  local cmp = require'cmp'
  local luasnip = require'luasnip'

  local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
  end

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        elseif has_words_before() then
          cmp.complete()
        else
          fallback()
        end
      end, { "i", "s" }),
      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, { "i", "s" }),
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      -- { name = 'vsnip' }, -- For vsnip users.
      { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
      { name = 'path' },
    }, {
      { name = 'buffer' },
    })
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Setup lspconfig.
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  require'lspconfig'.tsserver.setup {
    capabilities = capabilities,
    on_attach = on_attach,
  }
  require'lspconfig'.eslint.setup{
    capabilities = capabilities,
    on_attach = on_attach,
  }
  require'lspconfig'.cssls.setup{
    capabilities = capabilities,
    on_attach = on_attach,
  }
  require'lspconfig'.html.setup{
    capabilities = capabilities,
    on_attach = on_attach,
  }
  require'lspconfig'.jsonls.setup {
    capabilities = capabilities,
    on_attach = on_attach,
  }
  require'lspconfig'.yamlls.setup {
    settings = {
      yaml = {
        schemaStore = {
          url = "https://www.schemastore.org/api/json/catalog.json",
          enable = true,
        }
      }
    },
    on_attach = on_attach
  }

  require("mason").setup()
  require("mason-lspconfig").setup({
    ensure_installed = {
      "tsserver",
      "eslint",
      "cssls",
      "html",
      "jsonls",
      "yamlls"
    }
  })

EOF

autocmd BufWritePre *.tsx,*.ts,*.jsx,*.js EslintFixAll
