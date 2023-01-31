local ERROR_MSG = "package missing"

local status_1, cmp = pcall(require, "cmp")
if (not status_1) then error(ERROR_MSG) end
local status_2, luasnip = pcall(require, "luasnip")
if (not status_2) then error(ERROR_MSG) end
local status_3, lspkind = pcall(require, "lspkind")
if (not status_3) then error(ERROR_MSG) end
local status_4, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if (not status_4) then error(ERROR_MSG) end


cmp.setup {
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert {
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
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
            with_text = false,
            mode = 'symbol', -- show only symbol annotation_paths
            maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
            height = 50,
            ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)

            -- The function below will be called before any actual modifications from lspkind
            -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
            before = function(entry, vim_item)
                -- ...
                return vim_item
            end
        })
    },
}

-- vim.cmd [[
--   set completeopt=menuone,noinsert,noselect
--   highlight! default link CmpItemKind CmpItemMenuDefault
-- ]]
