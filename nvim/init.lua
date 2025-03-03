vim.opt.scrolloff = 4
vim.opt.ambiwidth = "single"
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.number = true
vim.opt.ruler = true
vim.opt.showmode = false
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.backspace = "indent,eol,start"
vim.opt.cursorline = true
vim.opt.cursorcolumn = true
vim.opt.compatible = false
vim.opt.laststatus = 2
vim.opt.wildmenu = true
vim.opt.showcmd = true
vim.opt.mouse = "a"
vim.cmd("cmap w!! w !sudo tee %")

if vim.fn.has("termguicolors") == 1 then
    vim.opt.termguicolors = true
end

-- Filetype-specific settings
vim.opt.foldlevel = 99

-- Key mappings
vim.api.nvim_set_keymap("n", "s", "<ESC>:w<CR>", { noremap = true, silent = true, nowait = true })
vim.api.nvim_set_keymap("n", "qq", ":q<CR>", { noremap = true, silent = true, nowait = true })
vim.api.nvim_set_keymap("n", "<leader>p", ":set paste!<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "tn", ":tabprevious<CR>", { noremap = true, silent = true, nowait = true })
vim.api.nvim_set_keymap("n", "tp", ":tabnext<CR>", { noremap = true, silent = true, nowait = true })
vim.api.nvim_set_keymap("n", "tt", ":tabedit<SPACE>", { noremap = true, silent = false, nowait = true })
vim.api.nvim_set_keymap("n", "ts", ":tabsplit<SPACE>", { noremap = true, silent = false, nowait = true })
vim.api.nvim_set_keymap("n", "vs", ":vs<SPACE>", { noremap = true, silent = false, nowait = true })

-- Window management
vim.api.nvim_set_keymap("n", "sv", ":vsplit<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "ss", ":split<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "sh", "<C-w>h", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "sl", "<C-w>l", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "sk", "<C-w>k", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "sj", "<C-w>j", { noremap = true, silent = true })

-- Plugin management
-- Auto-install vim-plug if it is not already installed
local vim_plug_path = vim.fn.stdpath('data') .. '/site/autoload/plug.vim'
if vim.fn.empty(vim.fn.glob(vim_plug_path)) > 0 then
  vim.fn.system({'curl', '-fLo', vim_plug_path, '--create-dirs', 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'})
  vim.cmd('autocmd VimEnter * PlugInstall --sync | source $MYVIMRC')
end

local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

-- Code commenter https://github.com/scrooloose/nerdcommenter
Plug('scrooloose/nerdcommenter')

-- Class/module browser
Plug('majutsushi/tagbar')

-- Airline
Plug('vim-airline/vim-airline')
Plug('vim-airline/vim-airline-themes')

-- Pending tasks list
Plug('fisadev/FixedTaskList.vim')

--git related
Plug('tpope/vim-fugitive')

-- ColorScheme
Plug('sainnhe/sonokai')

-- FZF
Plug('junegunn/fzf', { ['do'] = function()
  vim.fn['fzf#install']()
end })
Plug('junegunn/fzf.vim')
Plug('antoinemadec/coc-fzf')


-- Autocomplete
Plug('neoclide/coc.nvim', { ['branch'] = 'release' })

-- Copilot
Plug('github/copilot.vim')

vim.call('plug#end')

-- All plugins are loaded after this line, configure them below
-- Coc settings
require('coc')

-- Ctags
require('ctags')

-- Airline settings
require('airline')

-- Fzf mappings
require('fzf')


-- ColorScheme
if vim.fn.has('termguicolors') then
  vim.o.termguicolors = true
end
require('sonokai')
