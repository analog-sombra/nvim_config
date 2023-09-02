return {
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
        config = function()
            require("tokyonight").setup({
                style = "storm",
                light_style = "day",
                transparent = false,
                terminal_colors = true,
            })
        end
    }
}