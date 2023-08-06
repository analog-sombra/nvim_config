return {
    'HiPhish/nvim-ts-rainbow2',
    config = function()
        require ('nvim-treesitter.configs').setup({
            rainbow = {
                enable = true,
                strategy = require('ts-rainbow').strategy.global,
            }
        })
    end
}
