local status_1, ts = pcall(require, "nvim-treesitter.configs")
if (not status_1) then return end

-- [[ Configure Treesitter ]]
-- See `:help nvim-treesitter`

ts.setup {
    ensure_installed = {
        "astro",
        "c",
        "css",
        "diff",
        "dockerfile",
        "go",
        "git_rebase",
        "gitcommit",
        "gitignore",
        "graphql",
        "hcl",
        "html",
        "help",
        "javascript",
        "json",
        "latex",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "prisma",
        "rust",
        "scss",
        "sql",
        "terraform",
        "toml",
        "tsx",
        "typescript",
        "vim",
        "yaml"
    },
    sync_install = false,
    -- Automatically install missing parsers when entering buffer
    -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
    auto_install = false,
    highlight = { enable = true, additional_vim_regex_highlighting = { "markdown" } },
    indent = { enable = true, disable = { 'python' } },
    autotag = {
        enable = true,
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = '<c-i>',
            node_incremental = '<c-i>',
            scope_incremental = '<Tab>',
            node_decremental = '<c-l>',
        },
    },
    textobjects = {
        select = {
            enable = true,
            lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
            keymaps = {
                -- You can use the capture groups defined in textobjects.scm
                ['aa'] = '@parameter.outer',
                ['ia'] = '@parameter.inner',
                ['af'] = '@function.outer',
                ['if'] = '@function.inner',
                ['ac'] = '@class.outer',
                ['ic'] = '@class.inner',
            },
        },
        move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
                [']m'] = '@function.outer',
                [']]'] = '@class.outer',
            },
            goto_next_end = {
                [']M'] = '@function.outer',
                [']['] = '@class.outer',
            },

            goto_previous_start = {
                ['[m'] = '@function.outer',
                ['[['] = '@class.outer',
            },
            goto_previous_end = {
                ['[M'] = '@function.outer',
                ['[]'] = '@class.outer',
            },
        },
        swap = {
            enable = true,
            swap_next = {
                ['<leader>a'] = '@parameter.inner',
            },
            swap_previous = {
                ['<leader>A'] = '@parameter.inner',
            },
        },
    },
}

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
