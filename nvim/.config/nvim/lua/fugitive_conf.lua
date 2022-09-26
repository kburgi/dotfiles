vim.api.nvim_set_keymap('n', '<leader>gg', '<cmd>G<cr>', { noremap = true, desc = 'git status' })
vim.api.nvim_set_keymap('n', '<leader>gp', '<cmd>G pull<cr>', { noremap = true, desc = 'git pull' })
vim.api.nvim_set_keymap('n', '<leader>gP', '<cmd>G push<cr>', { noremap = true, desc = 'git push' })
vim.api.nvim_set_keymap('n', '<leader>gf', '<cmd>G push --force-with-lease<cr>',
    { noremap = true, desc = 'git push --force-with-lease<cr>' })
vim.api.nvim_set_keymap('n', '<leader>gb', '<cmd>G blame<cr>', { noremap = true, desc = 'git blame' })
