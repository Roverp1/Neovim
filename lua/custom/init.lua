-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })

-- set relative lines on default 
vim.cmd('set relativenumber')

-- nvim tree instead of netrw
local autocmd = vim.api.nvim_create_autocmd
local function open_nvim_tree(data)
    -- buffer is a directory
    local directory = vim.fn.isdirectory(data.file) == 1
    -- buffer is a [No Name]
    local no_name = data.file == "" and vim.bo[data.buf].buftype == ""
    if not directory and not no_name then return end
    if directory then
        -- change to the directory
        vim.cmd.cd(data.file)
    end
    -- open the tree
    require("nvim-tree.api").tree.open()
end
autocmd({"VimEnter"}, {callback = open_nvim_tree})

-- remaps for centring
vim.api.nvim_set_keymap('n', '<C-d>', '<C-d>zz', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-u>', '<C-u>zz', {noremap = true})

vim.api.nvim_set_keymap('n', 'n', 'nzz', {noremap = true})
vim.api.nvim_set_keymap('n', 'N', 'Nzz', {noremap = true})

vim.api.nvim_set_keymap('n', '*', '*zz', {noremap = true})
vim.api.nvim_set_keymap('n', '#', '#zz', {noremap = true})

vim.api.nvim_set_keymap('n', '{', '{zz', {noremap = true})
vim.api.nvim_set_keymap('n', '}', '}zz', {noremap = true})

-- C# lsp configuration?

