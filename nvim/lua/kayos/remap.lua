vim.keymap.set("n", "<leader>pv", "<CMD>Oil<CR>")
vim.keymap.set("n", "<leader><leader>", function()
    if vim.bo.filetype == "lua" then
        vim.cmd("so")
    end
end)

vim.keymap.set("n", "<C-h>", "<C-w>h", { noremap = true, silent = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { noremap = true, silent = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { noremap = true, silent = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { noremap = true, silent = true })

vim.keymap.set({"n", "v"}, "<leader>y", "\"+y")
vim.keymap.set({"n", "v"}, "<leader>Y", "\"+Y")

vim.keymap.set({"n", "v"}, "<C-p>", "\"+p")

vim.keymap.set("x", "<leader>p", "\"_dp")
vim.keymap.set({"n", "v"}, "<leader>d", "\"_d")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set("n", "gp", "<cmd>!open .<CR><CR>", { noremap = true, silent = true })

-- Lspsaga
vim.keymap.set("n", "gd", "<cmd>Lspsaga goto_definition<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>gd", "<cmd>Lspsaga peek_definition<CR>", { noremap = true, silent = true })
vim.keymap.set("n", 'K', '<cmd>Lspsaga hover_doc<CR>', { noremap = true, silent = true })
vim.keymap.set("n", "<leader>o", "<cmd>Lspsaga outline<CR>", { noremap = true, silent = true })
vim.keymap.set('n', '<leader>rn', '<cmd>Lspsaga rename<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>.', '<cmd>Lspsaga code_action<CR>', { noremap = true, silent = true })
vim.keymap.set('v', '<leader>.', '<cmd>Lspsaga code_action<CR>', { noremap = true, silent = true })
vim.keymap.set({'n','t'}, '<A-d>', '<cmd>Lspsaga term_toggle<CR>')

-- Diagnostics
vim.keymap.set('n', '<leader>e', '<cmd>Lspsaga diagnostic_jump_next<CR>')
