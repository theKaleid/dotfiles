vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.cursorline = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.laststatus = 3

vim.opt.cindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"

vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "100"

vim.g.mapleader = " "

local function getcwd()
    return vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
end

vim.opt.title = true
vim.opt.titlestring = getcwd() .. " - vim"

vim.diagnostic.config({
    signs = {
        text = {
            ["ERROR"] = "",
            ["WARN"] = "",
            ["INFO"] = "",
            ["HINT"] = "",
        }
    }
})


