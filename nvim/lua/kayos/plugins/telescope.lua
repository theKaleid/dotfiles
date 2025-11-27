return {
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.8',
        dependencies = {
            'nvim-lua/plenary.nvim'
        },
        opts = {
            defaults = {
                layout_strategy = 'vertical',
                previewer = true,
            },
            keymap = {
                project = '<leader>pp', -- Use Git if possible or project files if not
                files = '<leader>pf',
                git = '<leader>pg',
                buffers = '<leader>pb',
                treesitter = '<leader>po',
                search = '<leader>ps', -- Use grep for global search
            }
        },
        config = function (_, opts)
            local telescope = require('telescope')
            telescope.setup(opts)
            local builtin = require('telescope.builtin')
            vim.keymap.set('n', opts.keymap.project, function ()
                local gitdir = vim.fn.finddir('.git', vim.fn.getcwd() .. ';')
                if gitdir and #gitdir > 0 then
                    builtin.get_files()
                else
                    builtin.find_files()
                end
            end, {
                noremap = true,
                silent = true,
            })

            vim.keymap.set('n', opts.keymap.git, builtin.git_files, {})
            vim.keymap.set('n', opts.keymap.files, builtin.find_files, {})
            vim.keymap.set('n', opts.keymap.buffers, builtin.buffers, {})
            vim.keymap.set('n', opts.keymap.treesitter, builtin.treesitter, {})
            vim.keymap.set('n', opts.keymap.search, function()
                builtin.grep_string({ search = vim.fn.input("Grep > ") });
            end)
        end
    }
}
