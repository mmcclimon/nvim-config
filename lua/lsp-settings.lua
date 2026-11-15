vim.pack.add({ 'https://github.com/neovim/nvim-lspconfig' })

-- keybindings
vim.keymap.set({ "n" }, "<LocalLeader>r", vim.lsp.buf.references)
vim.keymap.set({ "n" }, "<LocalLeader>d", vim.lsp.buf.hover)
vim.keymap.set({ "n" }, "<LocalLeader>w", vim.diagnostic.open_float)
vim.keymap.set({ "n" }, "[s", "[d")
vim.keymap.set({ "n" }, "]s", "]d", { remap = true })

-- misc. settings
vim.diagnostic.config({
    -- I don't love this, but I like it more than the floating window.
    virtual_text = {
        current_line = true
    },
})

vim.pack.add({ 'https://github.com/nvim-treesitter/nvim-treesitter' })

-- language-specifics --

-- cue
require('nvim-treesitter').install({'cue'})
vim.lsp.enable('cue')

-- go
vim.lsp.enable('gopls')

-- lua
vim.lsp.enable('lua_ls')

-- this is just so that lua_ls works in vim (global definitions)
vim.pack.add({ 'https://github.com/folke/lazydev.nvim' })
require('lazydev').setup()
