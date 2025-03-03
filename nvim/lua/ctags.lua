-- Toggle Tagbar
vim.api.nvim_set_keymap('n', ',o', ':TagbarToggle<CR>', { silent = true })

-- Show task list
vim.api.nvim_set_keymap('n', '<C-F2>', ':TaskList<CR>', { silent = true })
