--* [[ Autocompletion ]]

local ERROR_MSG = "package missing"

local status_1, cmp = pcall(require, "cmp")
if (not status_1) then error(ERROR_MSG) end
local status_2, luasnip = pcall(require, "luasnip")
if (not status_2) then error(ERROR_MSG) end
local status_3, lspkind = pcall(require, "lspkind")
if (not status_3) then error(ERROR_MSG) end
local status_4, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if (not status_4) then error(ERROR_MSG) end
local status_5, cmp_autopairs = pcall(require, "nvim-autopairs.completion.cmp")
if (not status_5) then return end

return {
    'hrsh7th/nvim-cmp',
    dependencies = {
        { 'hrsh7th/cmp-nvim-lsp' },     -- Required
        { 'hrsh7th/cmp-buffer' },       -- Optional
        { 'hrsh7th/cmp-path' },         -- Optional
        { 'saadparwaiz1/cmp_luasnip' }, -- Optional
        { 'hrsh7th/cmp-nvim-lua' },     -- Optional,

        -- Snippets
        { 'L3MON4D3/LuaSnip' },             -- Required
        { 'rafamadriz/friendly-snippets' }, -- Optional

        -- Other
        'windwp/nvim-autopairs', -- Optional
    },
    config = function()
        local function format_for_tailwind_css(entry, vim_item)
            if vim_item.kind == 'Color' and entry.completion_item.documentation then
                local _, _, r, g, b = string.find(entry.completion_item.documentation, '^rgb%((%d+), (%d+), (%d+)')
                if r then
                    local color = string.format('%02x', r) .. string.format('%02x', g) .. string.format('%02x', b)
                    local group = 'Tw_' .. color
                    if vim.fn.hlID(group) < 1 then
                        vim.api.nvim_set_hl(0, group, { fg = '#' .. color })
                    end
                    vim_item.kind = "●"
                    vim_item.kind_hl_group = group
                    return vim_item
                end
            end
            vim_item.kind = lspkind.symbolic(vim_item.kind) and lspkind.symbolic(vim_item.kind) or vim_item.kind
            return vim_item
        end

        require("luasnip.loaders.from_vscode").lazy_load()

        cmp.setup {
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert {
                ['<C-d>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                -- ['<C-Space>'] = cmp.mapping.complete(),
                ['<C-s>'] = cmp.mapping.complete({}),
                ['<C-e>'] = cmp.mapping.abort(),
                ['<CR>'] = cmp.mapping.confirm {
                    behavior = cmp.ConfirmBehavior.Replace,
                    select = true,
                },
            },
            sources = {
                { name = 'nvim_lsp' },
                { name = 'luasnip' },
                { name = 'buffer' }
            },
            formatting = {
                format = lspkind.cmp_format({
                    maxwidth = 50,
                    ellipsis_char = '...',             -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
                    before = function(entry, vim_item) -- for tailwind css autocomplete
                        vim_item = format_for_tailwind_css(entry, vim_item)
                        return vim_item
                    end
                })
            },
        }

        cmp.event:on(
            'confirm_done',
            cmp_autopairs.on_confirm_done()
        )

        -- vim.cmd [[
        --   set completeopt=menuone,noinsert,noselect
        --   highlight! default link CmpItemKind CmpItemMenuDefault
        -- ]]
    end
}
