vim.api.nvim_set_keymap('n', '<space><space>', ":<C-u>CocFzfList<CR>", { noremap = true, silent = true, nowait = true })
vim.api.nvim_set_keymap('n', '<space>d', ":<C-u>CocFzfList diagnostics<CR>", { noremap = true, silent = true, nowait = true })
vim.api.nvim_set_keymap('n', '<space>b', ":<C-u>CocFzfList diagnostics --current-buf<CR>", { noremap = true, silent = true, nowait = true })
vim.api.nvim_set_keymap('n', '<space>c', ":<C-u>CocFzfList commands<CR>", { noremap = true, silent = true, nowait = true })
vim.api.nvim_set_keymap('n', '<space>e', ":<C-u>Files<CR>", { noremap = true, silent = true, nowait = true })
vim.api.nvim_set_keymap('n', '<space>l', ":<C-u>CocFzfList location<CR>", { noremap = true, silent = true, nowait = true })
vim.api.nvim_set_keymap('n', '<space>o', ":<C-u>CocFzfList outline<CR>", { noremap = true, silent = true, nowait = true })
vim.api.nvim_set_keymap('n', '<space>s', ":<C-u>CocFzfList symbols<CR>", { noremap = true, silent = true, nowait = true })
vim.api.nvim_set_keymap('n', '<space>p', ":<C-u>CocFzfListResume<CR>", { noremap = true, silent = true, nowait = true })

-- fzf preview bindkeys
vim.env.FZF_DEFAULT_OPTS = "--preview-window 'right:57%' --preview 'bat --style=numbers --line-range :300 {}' --bind ctrl-u:preview-half-page-up,ctrl-d:preview-half-page-down"

