vim.pack.add({
    'https://github.com/neovim/nvim-lspconfig',
    'https://github.com/stevearc/conform.nvim',
    'https://github.com/nvim-treesitter/nvim-treesitter',
})

-- keybindings
vim.keymap.set({ "n" }, "<LocalLeader>r", vim.lsp.buf.references)
vim.keymap.set({ "n" }, "<LocalLeader>d", vim.lsp.buf.hover)
vim.keymap.set({ "n" }, "<LocalLeader>w", vim.diagnostic.open_float)
vim.keymap.set({ "n" }, "[s", "[d", { remap = true })
vim.keymap.set({ "n" }, "]s", "]d", { remap = true })

-- misc. settings
vim.diagnostic.config({
    -- I don't love this, but I like it more than the floating window.
    virtual_text = {
        current_line = true
    },
})

require("conform").setup({
    formatters_by_ft = {
        go = { "goimports" },
    },
    format_on_save = {
        timeout_ms = 500,
        lsp_format = "fallback",
        undojoin = true,
    },
})


-- language-specifics --

-- cue
require('nvim-treesitter').install({ 'cue' })
vim.lsp.enable('cue')

-- go
vim.lsp.enable('gopls')
vim.lsp.enable('golangci_lint_ls')

-- lua
vim.lsp.enable('lua_ls')

-- this is just so that lua_ls works in vim (global definitions)
vim.pack.add({ 'https://github.com/folke/lazydev.nvim' })
require('lazydev').setup()
