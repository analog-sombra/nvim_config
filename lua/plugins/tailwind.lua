return {
    'neovim/nvim-lspconfig',
    opts = {
        servers = {
            tailwindcss = {},
        }
    },
    {
        "Nvchad/nvim-colorizer.lua",
        config = function()
            require('colorizer').setup({
                user_default_options = {
                    tailwind = true,
                }
            })
        end
    },
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            { "roobert/tailwindcss-colorizer-cmp.nvim", config = true },
        },
    },
}
