local ERROR_MSG = "package missing"

local status_1, mason = pcall(require, "mason")
if (not status_1) then error(ERROR_MSG) end
local status_2, m_lspconfig = pcall(require, "mason-lspconfig")
if (not status_2) then error(ERROR_MSG) end
local status_3, neodev = pcall(require, "neodev")
if (not status_3) then print(ERROR_MSG) end
local status_4, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if (not status_4) then error(ERROR_MSG) end
local status_5, lspconfig = pcall(require, "lspconfig")
if (not status_5) then error(ERROR_MSG) end
local status_6, lspsaga = pcall(require, "lspsaga")
if (not status_6) then error(ERROR_MSG) end
local status_7, fidget = pcall(require, "fidget")
if (not status_7) then error(ERROR_MSG) end

-- Define mappings for when an LSP gets attached to a Buffer

-- Setup Lspsaga before defining mappings
lspsaga.setup(
    {
        ui = {
            winblend = 10,
            border = 'rounded',
            colors = {
                normal_bg = '#002b36'
            }
        }
    }
)

-- Setup neovim lua configuration
neodev.setup();

local on_attach = function(client, bufnr)
    -- NOTE: Remember that lua is a real programming language, and as such it is possible
    -- to define small helper and utility functions so you don't have to repeat yourself many times.
    -- In this case, we create a function that lets us more easily define mappings specific
    -- for LSP related items. It sets the mode, buffer and description for us each time.

    local nmap = function(keys, func, desc)
        if desc then
            desc = 'LSP: ' .. desc

        end

        vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })

    end

    -- Mappings
    -- We're using Lspsaga for some of these instead of `vim.lsp.buf.<action>
    -- feel free to swap them if you find issues with Lspsaga
    -- e.g.
    -- nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')

    -- Actions
    nmap('<leader>rn', "<cmd> Lspsaga rename<CR>", '[R]e[n]ame')
    nmap('<leader>ca', "<cmd>Lspsaga code_action<CR>", '[C]ode [A]ction')

    -- Documents, Definitions and Signatures
    nmap('gd', "<cmd>Lspsaga peek_definition<CR>", '[G]oto [D]efinition')
    nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
    nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
    -- *? requires telescope
    -- nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
    -- *? requires telescope
    -- nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
    nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
    -- * disabled: clashes with window mappings
    -- nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
    -- * disabled: clashes with window mappings
    -- nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
    -- * disabled: clashes with window mappings
    -- nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
    -- * disabled: clashes with window mappings
    -- nmap('<leader>wl', function()
    --     print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    -- end, '[W]orkspace [L]ist Folders')

    -- Diagnostics
    nmap('[d', ("<cmd>Lspsaga diagnostic_jump_prev<CR>"), 'Jump to previous diagnostic')
    nmap(']d', ("<cmd>Lspsaga diagnostic_jump_next<CR>"), 'Jump to next diagnostic')
    nmap('<leader>e', ("<cmd>Lspsaga show_line_diagnostics<CR>"), 'Show line diagnostic')
    nmap('K', ("<cmd>Lspsaga hover_doc<CR>"), 'Hover Documentation')
    -- * disabled: clashes with tmux+nvim navigation
    -- nmap('<C-k>', "<cmd>Lspsaga signature_help<CR>", 'Signature Documentation')

    -- Formatting
    vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
        vim.lsp.buf.format()
    end, { desc = 'Format current buffer with LSP' })
    nmap('<leader>F', ':Format<CR>', '[F]ormat')

end


-- Enable the following language servers
--  Feel free to add/remove any LSPs that you want here. They will automatically be installed.

--
--  Add any additional override configuration in the following tables. They will be passed to
--  the `settings` field of the server config. You must look up that documentation yourself.
local servers = {
    -- clangd = {},
    -- gopls = {},
    -- pyright = {},
    rust_analyzer = {},
    tsserver = {
        filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
        cmd = { "typescript-language-server", "--stdio" },
    },
    eslint = {},
    sumneko_lua = {
        Lua = {
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
        },
    },
}

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

mason.setup()

m_lspconfig.setup {
    ensure_installed = vim.tbl_keys(servers),
}

m_lspconfig.setup_handlers {
    function(server_name)
        lspconfig[server_name].setup {
            capabilities = capabilities,
            on_attach = on_attach,
            settings = servers[server_name],
        }
    end,
}


-- Turn on lsp status information
fidget.setup()
