local status_1, ts = pcall(require, "nvim-treesitter.configs")
if (not status_1) then return end
local status_2, autotag = pcall(require, "nvim-ts-autotag")
if (not status_2) then return end

return {
    {
        -- treesitter Playground
        'nvim-treesitter/playground',
    },
    {
        -- treesitter to autoclose and autorename html tag
        'windwp/nvim-ts-autotag',
        config = function()
            autotag.setup({})
        end
    },
    {
        -- treesitter-context aware commenting
        'JoosepAlviste/nvim-ts-context-commentstring',
    },
    {
        'nvim-treesitter/nvim-treesitter',
        build = function()
            pcall(require('nvim-treesitter.install').update {
                with_sync = true
            })
        end,
        dependencies = {
            -- Additional text objects via treesitter
            'nvim-treesitter/nvim-treesitter-textobjects',
        },
        config = function()
            ts.setup {
                -- ensure_installed = {
                --     "astro",
                --     "c",
                --     "cpp",
                --     "css",
                --     "diff",
                --     "dockerfile",
                --     "go",
                --     "git_rebase",
                --     "gitcommit",
                --     "gitignore",
                --     "graphql",
                --     "hcl",
                --     "html",
                --     "java",
                --     "javascript",
                --     "json",
                --     "latex",
                --     "lua",
                --     "markdown",
                --     "markdown_inline",
                --     "python",
                --     "prisma",
                --     "rust",
                --     "scss",
                --     "sql",
                --     "terraform",
                --     "toml",
                --     "tsx",
                --     "typescript",
                --     "vim",
                --     "yaml"
                -- },
                sync_install = false,
                -- Automatically install missing parsers when entering buffer
                -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
                auto_install = false,
                highlight = { enable = true, additional_vim_regex_highlighting = { "markdown" } },
                indent = { enable = true, disable = { 'python' } },
                autotag = {
                    enable = true,
                },
                context_commentstring = {
                    enable = true,
                    enable_autocmd = false,
                    -- config = {
                    --     typescript = { __default = '// %s', __multiline = '/* %s */' }
                    -- }
                },
                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = '<c-i>',
                        node_incremental = '<c-i>',
                        scope_incremental = '<c-I>',
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
        end
    },
}
