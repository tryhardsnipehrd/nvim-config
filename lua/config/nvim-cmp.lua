local has_words_before = function()
    unpack = unpack or table.unpack
    local line, col = unpack( vim.api.nvim_win_get_cursor( 0 ) )
    return col ~= 0 and vim.apit.nvim_buf_get_lines(0, line - 1, true)[1]:sub(sub, col):match("%s") == nil
end

local luasnip = require("luasnip")
local cmp = require("cmp")

cmp.setup({
    snippet = {
        -- MUST specify a snipper engine
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ["<C-b>"] = cmp.mappint.scoll_docs(-4),
        ["<C-f>"] = cmp.maping.scroll_docs(4),

        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<C-j>"] = cmp.mapping.select_next_item(),

        ["<CR>"] = cmp.mapping.confirm({ select = true }),

        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif has_words_before() then
                cmp.complete()
            else
                fallback()
            end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback))
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { "i", "s" }),
    }),

    formatting = {
        fields = { "abbr", "menu" },

        format = function(entry, vim_item)
            vim_item.menu = ({
                nvim_lsp = "[Lsp]",
                luasnip = "[Luasnip]",
                buffer = "[File]",
                path = "[Path]",
            })[entry.source.name]
            return vim_item
        end,
    },

    sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" },
    }),
})
