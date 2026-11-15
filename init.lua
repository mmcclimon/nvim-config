-- text editing
vim.opt.smartindent = true	-- indent braces automatically
vim.opt.cinwords = ""		-- turn off weird magic indent
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.textwidth = 78

-- UI
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.wildmenu = true
vim.opt.scrolloff = 3
vim.opt.modelines = 2
vim.opt.wildmode = "longest:full,longest"
vim.opt.wildignore:append({".git","local","build","vendor"})
vim.opt.list = true
vim.opt.listchars = { tab = ">-", trail = "~", extends = ">", precedes = "<" }
vim.opt.winborder = "single"

vim.opt.foldlevelstart=99
vim.opt.foldopen:remove({"block"})

vim.opt.backup = true
vim.opt.backupdir = vim.fn.expand("~/.config/nvim/backup")

-- mappings
vim.g.mapleader = ","
vim.g.maplocalleader = "\\"
vim.keymap.set({ "n" }, "<Leader>s", '<cmd>:nohlsearch<cr>')

-- swap colon + semicolon
vim.keymap.set({"n", "v", "o"}, ";", ":")
vim.keymap.set({"n", "v", "o"}, ":", ";")
vim.keymap.set({"n", "v", "o"}, "<Space>", ":")

-- better window motion
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- colemak stuff
-- modal swapping
vim.keymap.set({"n", "v", "o"}, "u", "i")
vim.keymap.set({"n", "v", "o"}, "U", "I")

-- hjkl = hnei
vim.keymap.set({"n", "v", "o"}, "h", "h")
vim.keymap.set({"n", "v", "o"}, "n", "j")
vim.keymap.set({"n", "v", "o"}, "e", "k")
vim.keymap.set({"n", "v", "o"}, "i", "l")
vim.keymap.set({"n", "v", "o"}, "H", "H")
vim.keymap.set({"n", "v", "o"}, "N", "J")
vim.keymap.set({"n", "v", "o"}, "E", "K")
vim.keymap.set({"n", "v", "o"}, "I", "L")

-- stuff stolen by the above
vim.keymap.set({"n", "v", "o"}, "k", "n")
vim.keymap.set({"n", "v", "o"}, "K", "N")
vim.keymap.set({"n", "v", "o"}, "l", "u")
vim.keymap.set({"n", "v", "o"}, "L", "U")
vim.keymap.set({"n", "v", "o"}, "j", "e")
vim.keymap.set({"n", "v", "o"}, "J", "E")

vim.keymap.set({"n"}, "<BS>", "<C-^>")

-- vim-rsi mappings
vim.keymap.set({"i"}, "<C-A>", "<C-O>^")
vim.keymap.set({"c"}, "<C-A>", "<Home>")
vim.keymap.set({"c"}, "<C-B>", "<Left>")
vim.keymap.set({"c"}, "<C-F>", "<Right>")
vim.keymap.set({"c"}, "<C-D>", "<Del>")

require("colors")
require("functions")
require("gui-settings")
require("plugins")
require("lsp-settings")
