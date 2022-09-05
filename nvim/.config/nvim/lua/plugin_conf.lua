--setup needed functions
local setkm = vim.api.nvim_set_keymap

--Treesitter
require('orgmode').setup_ts_grammar()
require 'nvim-treesitter.configs'.setup {
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = { 'org' },
    },
    ensure_installed = { 'org' },
}

--Telescope
require("telescope").setup {
    defaults = {
        file_ignore_patterns = { "venv/.*" }
    }
}

-- cmp
local cmp = require('cmp')
local luasnip = require('luasnip')
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
            if luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            elseif cmp.visible() then
                cmp.select_next_item()
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
        { name = 'luasnip' },
        { name = 'nvim_lsp_signature_help' }
    }, {
        { name = 'buffer' },
    },
        {
            { name = 'orgmode' }
        })
})

-- cmp configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources(
        {
            { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
        },
        {
            { name = 'buffer' },
        }
    )
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

--Orgmode
require('orgmode').setup {}

--Nvim-autopairs
require("nvim-autopairs").setup {}

--Comment
require('Comment').setup()

--Whitespace
vim.cmd [[ highlight ExtraWhitespace ctermbg=78 ]]
setkm('n', '<leader>w', ':StripWhitespace<CR>', { noremap = true, desc = 'Strip whitespace' })

--Undotree
setkm('n', '<leader>u', ':UndotreeToggle<CR>', { noremap = true, desc = 'Undotree Toggle' })

--Slime
vim.g.slime_target           = "tmux"
vim.g.slime_default_config   = '{"socket_name": "default", "target_pane": "1"}'
vim.g.slime_dont_ask_default = 1
vim.g.slime_python_ipython   = 0

--Rainbow brackets
vim.g.rainbow_active = 1

--Easy align
setkm('n', 'ga', '<Plug>(EasyAlign)', { noremap = true, desc = 'EasyAlign activate' })
setkm('v', 'ga', '<Plug>(EasyAlign)', { noremap = true, desc = 'EasyAlign activate' })

--IndentBlankLine
setkm('n', '<leader>i', ':IndentBlanklineToggle<CR>', { noremap = true, desc = 'IndentBlankLine Toggle' })

--Airline
vim.g['airline_symbols.colnr'] = ':'
vim.g['airline_symbols.crypt'] = '🔒'
vim.g['airline_symbols.linenr'] = ' | '
vim.g['airline_symbols.maxlinenr'] = ''
vim.g['airline_symbols.branch'] = '⎇'
vim.g['airline_symbols.paste'] = 'PASTE'
vim.g['airline_symbols.spell'] = 'SPELL'
vim.g['airline_symbols.notexists'] = 'Ɇ'
vim.g['airline_symbols.whitespace'] = 'wh'
vim.g['airline#extensions#wordcount#formatter#default#fmt'] = '%s |'
vim.g['airline#extensions#tabline#enabled'] = 1
vim.g['airline#extensions#tabline#show_tab_nr'] = 1
vim.g['airline_powerline_fonts'] = 1
vim.g['airline#extensions#tabline#ignore_bufadd_pat'] = '!|defx|gundo|nerd_tree|startify|tagbar|undotree|vimfiler'

--Telescope
setkm('n', '<leader>f%', ':Telescope oldfiles<CR>', { noremap = true, desc = 'Telescope find recently open files' })
setkm('n', '<leader>f/', ':Telescope search_history<CR>', { noremap = true, desc = 'Telescope find in search history' })
setkm('n', '<leader>fG', ':Telescope git_status<CR>', { noremap = true, desc = 'Telescope find modified git files' })
setkm('n', '<leader>fa', ':Telescope live_grep<CR>', { noremap = true, desc = 'Telescope find pattern in all files' })
setkm('n', '<leader>fb', ':Telescope buffers<CR>', { noremap = true, desc = 'Telescope find buffer' })
setkm('n', '<leader>f:', ':Telescope commands<CR>', { noremap = true, desc = 'Telescope find nvim command' })
setkm('n', '<leader>fd', ':Telescope diagnostics<CR>', { noremap = true, desc = 'Telescope find diagnostic' })
setkm('n', '<leader>ff', ':Telescope find_files<CR>', { noremap = true, desc = 'Telescope find file' })
setkm('n', '<leader>fg', ':Telescope git_files<CR>', { noremap = true, desc = 'Telescope find' })
setkm('n', '<leader>fh', ':Telescope help_tags<CR>', { noremap = true, desc = 'Telescope find' })
setkm('n', '<leader>fi', ':Telescope current_buffer_fuzzy_find<CR>', { noremap = true, desc = 'Telescope find' })
setkm('n', '<leader>fj', ':Telescope jumplist<CR>', { noremap = true, desc = 'Telescope find' })
setkm('n', '<leader>fk', ':Telescope keymaps<CR>', { noremap = true, desc = 'Telescope find' })
setkm('n', '<leader>fl', ':Telescope loclist<CR>', { noremap = true, desc = 'Telescope find' })
setkm('n', '<leader>f\'', ':Telescope marks<CR>', { noremap = true, desc = 'Telescope find' })
setkm('n', '<leader>fo', ':Telescope vim_options<CR>', { noremap = true, desc = 'Telescope find' })
setkm('n', '<leader>fq', ':Telescope quickfix<CR>', { noremap = true, desc = 'Telescope find' })
setkm('n', '<leader>f"', ':Telescope registers<CR>', { noremap = true, desc = 'Telescope find' })
setkm('n', '<leader>fw', ':Telescope grep_string<CR>', { noremap = true, desc = 'Telescope find' })
setkm('n', '<leader>ft', ':Telescope tags<CR>', { noremap = true, desc = 'Telescope find' })
setkm('n', '<leader>fu', ':Telescope lsp_references<CR>', { noremap = true, desc = 'Telescope find' })
setkm('n', '<leader>f<', ':Telescope lsp_incoming_calls<CR>', { noremap = true, desc = 'Telescope find' })
setkm('n', '<leader>f>', ':Telescope lsp_outgoing_calls<CR>', { noremap = true, desc = 'Telescope find' })
setkm('n', '<leader>f$', ':Telescope lsp_document_symbols<CR>', { noremap = true, desc = 'Telescope find' })
setkm('n', '<leader>f^', ':Telescope lsp_workspace_symbols<CR>', { noremap = true, desc = 'Telescope find' })
setkm('n', '<leader>fD', ':Telescope lsp_definitions<CR>', { noremap = true, desc = 'Telescope find' })
setkm('n', '<leader>fI', ':Telescope lsp_implementations<CR>', { noremap = true, desc = 'Telescope find' })
setkm('n', '<leader>ft', ':Telescope lsp_type_definitions<CR>', { noremap = true, desc = 'Telescope find' })
setkm('n', '<leader>fv', ':Telescope treesitter<CR>', { noremap = true, desc = 'Telescope find' })
setkm('n', '<leader>fc', ':Telescope git_commits<CR>', { noremap = true, desc = 'Telescope find' })
setkm('n', '<leader>fT', ':Telescope git_branches<CR>', { noremap = true, desc = 'Telescope find' })
setkm('n', '<leader>fs', ':Telescope git_status<CR>', { noremap = true, desc = 'Telescope find' })
setkm('n', '<leader>fS', ':Telescope git_stash<CR>', { noremap = true, desc = 'Telescope find' })
setkm('n', '<leader>fB', ':Telescope git_bcommits<CR>', { noremap = true, desc = 'Telescope find' })

--Web dev icons
require 'nvim-web-devicons'.setup {
    default = true;
}

--Nvim tree
require("nvim-tree").setup()
setkm('n', '<leader>n', ':NvimTreeToggle<CR>', { noremap = true, desc = 'Toggle NvimTree file explorer' })

--Luasnip
require("luasnip.loaders.from_vscode").lazy_load()
setkm('i', '<silent><expr> <Tab>', 'luasnip#expand_or_jumpable() ? \'<Plug>luasnip-expand-or-jump\' : \'<Tab>\' ', {})
setkm('i', '<silent> <S-Tab>', '<cmd>lua require\'luasnip\'.jump(-1)<Cr>', { noremap = true })
setkm('s', '<silent> <Tab>', '<cmd>lua require(\'luasnip\').jump(1)<Cr>', { noremap = true })
setkm('s', '<silent> <S-Tab>', '<cmd>lua require\'luasnip\'.jump(-1)<Cr>', { noremap = true })
setkm('i', '<silent><expr> <C-E>', 'luasnip#choice_active() ? \'<Plug>luasnip-next-choice\' : \'<C-E>\'', {})
setkm('i', '<silent><expr> <C-E>', 'luasnip#choice_active() ? \'<Plug>luasnip-next-choice\' : \'<C-E>\'', {})
