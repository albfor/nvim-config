local nnoremap = require("albin.keymap").nnoremap
local cmp = require('cmp')

vim.opt.completeopt = "menu,menuone,noselect"

cmp.setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    window = {
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },

    }), {
        { name = 'buffer' },
    }
})


nnoremap("<leader>d", vim.diagnostic.open_float)
nnoremap("[d", vim.diagnostic.goto_prev)
nnoremap("]d", vim.diagnostic.goto_next)

local on_attach = function(client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    nnoremap("gD", vim.lsp.buf.declaration)
    nnoremap("gd", vim.lsp.buf.definition)
    nnoremap("gi", vim.lsp.buf.implementation)
    nnoremap("K", vim.lsp.buf.hover)
    nnoremap("<C-k>", vim.lsp.buf.signature_help)
    nnoremap("<leader>rn", vim.lsp.buf.rename)
    nnoremap("<leader>ca", vim.lsp.buf.code_action)
    nnoremap("<leader>f", vim.lsp.buf.formatting_sync)
end

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

--  require("lspconfig")["eslint"].setup {
--      capabilities = capabilities,
--      on_attach = on_attach,
--  }

require("lspconfig")["sumneko_lua"].setup {
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
        Lua = {
            runtime = {
                version = "LuaJIT",
            },
            diagnostics = {
                globals = { "vim" },
            },
            workkspace = {
                library = vim.api.nvim_get_runtime_file("", true),
            },
            telemetry = {
                enable = false,
            },
        },
    },
}

require("lspconfig")["tsserver"].setup {
    capabilities = capabilities,
    on_attach = on_attach,
}

require("lspconfig")["bashls"].setup {
    capabilities = capabilities,
    on_attach = on_attach,
}
