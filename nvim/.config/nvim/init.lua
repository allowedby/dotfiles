vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.sidescrolloff = 8
vim.opt.scrolloff = 8

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.expandtab = true
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

vim.opt.updatetime = 500

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.guicursor = ''

vim.opt.termguicolors = true

vim.opt.completeopt = 'menuone,noselect'
vim.opt.smartindent = true

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.api.nvim_create_autocmd('TextYankPost', {
        group = vim.api.nvim_create_augroup('YankHighlight', { clear = true }),
        callback = function() vim.highlight.on_yank() end,
        pattern = '*',
    }
)

vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.keymap.set({ 'n', 'v' }, '<leader>p', '"+p')
vim.keymap.set({ 'n', 'v' }, '<leader>P', '"+P')
vim.keymap.set({ 'n', 'v' }, '<leader>y', '"+y')
vim.keymap.set({ 'n' }, '<leader>Y', '"+yg_')

local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable',
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup {
    { 'blazkowolf/gruber-darker.nvim' },
    {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        dependencies = {
            'nvim-lua/plenary.nvim',
        },
    },
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
    },
}

require('telescope').setup {
    pickers = {
        find_files = {
            hidden = true,
        },
    },
}

vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files, {})
vim.keymap.set('n', '<leader>fb', require('telescope.builtin').buffers, {})
vim.keymap.set('n', '<leader>fw', require('telescope.builtin').grep_string, {})
vim.keymap.set('n', '<leader>fl', require('telescope.builtin').live_grep, {})

require('nvim-treesitter.configs').setup {
    ensure_installed = { 'lua', 'c', 'go' },
    sync_install = false,
    auto_install = false,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false
    },
}

require('gruber-darker').setup {
    bold = false,
    italic = {
        strings = false,
        comments = false,
        operators = false,
        folds = false,
    },
}

vim.cmd.colorscheme('gruber-darker')

vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
