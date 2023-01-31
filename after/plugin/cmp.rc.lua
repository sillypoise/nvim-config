local ERROR_MSG = "package missing"

local status_1, cmp = pcall(require, "cmp")
if (not status_1) then error(ERROR_MSG) end
local status_2, luasnip = pcall(require, "luasnip")
if (not status_2) then error(ERROR_MSG) end
local status_3, lspkind = pcall(require, "lspkind")
if (not status_3) then error(ERROR_MSG) end


cmp.setup {
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert {
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete({}),
        ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        },
        -- ['<Tab>'] = cmp.mapping.confirm {
        --     behavior = cmp.ConfirmBehavior.Replace,
        --     select = true,
        -- },
        sources = {
            { name = 'nvim_lsp' },
            -- { name = 'luasnip' },
            -- { name = 'buffer' }
        },
        formatting = {
        }
    },
}

-- vim.cmd [[
--   set completeopt=menuone,noinsert,noselect
--   highlight! default link CmpItemKind CmpItemMenuDefault
-- ]]
