return {
    {
        "supermaven-inc/supermaven-nvim",
        config = function()
            require("supermaven-nvim").setup({})
        end,

        keymaps = {
            accept_suggestion = "<C-i>",
            accept_word = "<C-e>",
        },
    }
}
