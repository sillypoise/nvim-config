local status_1, tscp = pcall(require, "telescope")
if (not status_1) then return end

-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`
local function telescope_buffer_dir()
    return vim.fn.expand('%:p:h')
end

local fb_actions = require "telescope".extensions.file_browser.actions;

tscp.setup {
    defaults = {
        mappings = {
            i = {
                ['<C-u>'] = false,
                ['<C-d>'] = false,
            },
        },
    },
    pickers = {
        find_files = {
            -- hidden = true,
            -- no_ignore = false,
            find_command = { "rg", "--files", "--hidden", "-g", "!.git" }
        },
    },
    extensions = {
        file_browser = {
            theme = "dropdown",
            path = "%:p:h",
            cwd = telescope_buffer_dir(),
            respect_gitignore = false,
            hidden = true,
            grouped = true,
            find_command = { "rg", "--files", "--hidden", "-g", "!.git" },
            initial_mode = "insert",
            layout_config = { height = 40 },
            -- disables netrw and use telescope-file-browser in its place
            hijack_netrw = true,
            mappings = {
                ["i"] = {
                    -- your custom insert mode mapping
                    ['<C-w>'] = function() vim.cmd('normal vbd') end,
                },
                ["n"] = {
                    -- your custom normal mode mappings
                    ['A'] = fb_actions.create,
                    ['h'] = fb_actions.goto_parent_dir,
                    ['/'] = function()
                        vim.cmd('startinsert')
                    end
                },
            },
        },
    },
}

-- Enable extensions
-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')

-- Enable telescope file browser
require("telescope").load_extension "file_browser"

-- Telescope Mappings
vim.keymap.set('n', '<leader>ro', require('telescope.builtin').oldfiles, { desc = '[R]ecently [O]pened files' })
vim.keymap.set('n', '<leader>;', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
    -- You can pass additional configuration to telescope to change theme, layout, etc.
    require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 0,
        previewer = false,
        layout_config = { height = 20 }
    })
end, { desc = '[/] Fuzzily search in current buffer]' })


vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sr', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').git_status, { desc = '[S]earch by [G]it Status' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>st', require('telescope').extensions.file_browser.file_browser,
    { desc = "[S]earch [T]ree file browser" })
